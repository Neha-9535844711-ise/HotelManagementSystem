package com.hotel.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * DBConnection Utility Class - Thread-safe Singleton Pattern
 * Compatible with Jakarta EE 11 / Tomcat 11
 * MySQL 8.0/9.0+ JDBC Driver Support
 * 
 * @author Azure Sands Hotel Management System
 * @version 3.0
 */
public class DBConnection {
    
    // Database configuration constants
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hotel_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=UTF-8";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root123"; // IMPORTANT: Change this to your MySQL password
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    
    // Logger for error handling
    private static final Logger LOGGER = Logger.getLogger(DBConnection.class.getName());
    
    // Singleton instance (volatile for thread-safety)
    private static volatile DBConnection instance;
    
    // ThreadLocal for managing connection per thread (request scope)
    private static final ThreadLocal<Connection> connectionHolder = new ThreadLocal<>();
    
    /**
     * Private constructor to enforce Singleton pattern
     * Registers MySQL JDBC driver
     */
    private DBConnection() {
        try {
            // Explicitly load and register MySQL JDBC driver
            Class.forName(DB_DRIVER);
            LOGGER.info("✓ MySQL JDBC Driver registered successfully");
            LOGGER.info("✓ Database URL: " + DB_URL);
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "✗ MySQL JDBC Driver not found! Please add mysql-connector-java jar to WEB-INF/lib", e);
            throw new RuntimeException("Failed to load MySQL JDBC Driver", e);
        }
    }
    
    /**
     * Get Singleton instance of DBConnection (Thread-safe with double-checked locking)
     * 
     * @return DBConnection singleton instance
     */
    public static DBConnection getInstance() {
        if (instance == null) {
            synchronized (DBConnection.class) {
                if (instance == null) {
                    instance = new DBConnection();
                }
            }
        }
        return instance;
    }
    
    /**
     * Get database connection from ThreadLocal
     * Creates new connection if none exists for current thread
     * 
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public Connection getConnection() throws SQLException {
        Connection conn = connectionHolder.get();
        
        if (conn == null || conn.isClosed()) {
            try {
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                connectionHolder.set(conn);
                LOGGER.fine("✓ New database connection created for thread: " + Thread.currentThread().getName());
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "✗ Failed to establish database connection", e);
                throw new SQLException("Unable to connect to database. Please check:\n" +
                                       "1. MySQL service is running\n" +
                                       "2. Database 'hotel_db' exists\n" +
                                       "3. Username/password is correct\n" +
                                       "4. MySQL connector JAR is in classpath", e);
            }
        }
        
        return conn;
    }
    
    /**
     * Get a fresh connection (not bound to ThreadLocal)
     * Use this for operations that need independent transactions
     * 
     * @return New Connection object
     * @throws SQLException if connection fails
     */
    public Connection getFreshConnection() throws SQLException {
        try {
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "✗ Failed to create fresh database connection", e);
            throw e;
        }
    }
    
    /**
     * Close connection and remove from ThreadLocal
     * Should be called at the end of request/operation (e.g., in a filter or finally block)
     */
    public void closeConnection() {
        Connection conn = connectionHolder.get();
        if (conn != null) {
            try {
                if (!conn.isClosed()) {
                    conn.close();
                    LOGGER.fine("✓ Database connection closed for thread: " + Thread.currentThread().getName());
                }
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "⚠ Error closing database connection", e);
            } finally {
                connectionHolder.remove();
            }
        }
    }
    
    /**
     * Close ResultSet safely (null-safe)
     * 
     * @param rs ResultSet to close
     */
    public void closeResultSet(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "⚠ Error closing ResultSet", e);
            }
        }
    }
    
    /**
     * Close Statement safely (null-safe)
     * 
     * @param stmt Statement to close
     */
    public void closeStatement(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "⚠ Error closing Statement", e);
            }
        }
    }
    
    /**
     * Close PreparedStatement safely (null-safe)
     * 
     * @param pstmt PreparedStatement to close
     */
    public void closePreparedStatement(PreparedStatement pstmt) {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "⚠ Error closing PreparedStatement", e);
            }
        }
    }
    
    /**
     * Close all database resources (ResultSet, Statement)
     * 
     * @param rs ResultSet
     * @param stmt Statement
     */
    public void closeResources(ResultSet rs, Statement stmt) {
        closeResultSet(rs);
        closeStatement(stmt);
    }
    
    /**
     * Close all database resources (ResultSet, Statement) with optional connection
     * 
     * @param rs ResultSet
     * @param stmt Statement
     * @param conn Connection (optional - can be null)
     */
    public void closeAll(ResultSet rs, Statement stmt, Connection conn) {
        closeResultSet(rs);
        closeStatement(stmt);
        if (conn != null) {
            try {
                if (!conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "⚠ Error closing Connection", e);
            }
        }
    }
    
    /**
     * Test database connectivity
     * 
     * @return true if connection successful, false otherwise
     */
    public boolean testConnection() {
        try (Connection conn = getFreshConnection()) {
            boolean isValid = conn != null && !conn.isClosed() && conn.isValid(2);
            if (isValid) {
                LOGGER.info("✓ Database connection test SUCCESSFUL!");
                LOGGER.info("  Database: " + conn.getCatalog());
                LOGGER.info("  Server Version: " + conn.getMetaData().getDatabaseProductVersion());
                LOGGER.info("  Driver Version: " + conn.getMetaData().getDriverVersion());
            }
            return isValid;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "✗ Database connection test FAILED!", e);
            return false;
        }
    }
    
    /**
     * Get detailed connection status message
     * 
     * @return Status message string
     */
    public String getConnectionStatus() {
        StringBuilder status = new StringBuilder();
        status.append("=== Database Connection Status ===\n");
        
        try (Connection conn = getFreshConnection()) {
            if (conn != null && !conn.isClosed()) {
                status.append("✓ Status: CONNECTED\n");
                status.append("✓ URL: ").append(conn.getMetaData().getURL()).append("\n");
                status.append("✓ Database: ").append(conn.getCatalog()).append("\n");
                status.append("✓ Driver: ").append(conn.getMetaData().getDriverName()).append("\n");
                status.append("✓ Driver Version: ").append(conn.getMetaData().getDriverVersion()).append("\n");
                status.append("✓ Database Version: ").append(conn.getMetaData().getDatabaseProductVersion()).append("\n");
                status.append("✓ JDBC Version: ").append(conn.getMetaData().getJDBCMajorVersion()).append(".");
                status.append(conn.getMetaData().getJDBCMinorVersion()).append("\n");
            }
        } catch (SQLException e) {
            status.append("✗ Status: DISCONNECTED\n");
            status.append("✗ Error: ").append(e.getMessage()).append("\n");
        }
        
        return status.toString();
    }
    
    /**
     * Check if connection is valid
     * 
     * @return true if connection exists and is valid
     */
    public boolean isConnected() {
        Connection conn = connectionHolder.get();
        if (conn != null) {
            try {
                return !conn.isClosed() && conn.isValid(1);
            } catch (SQLException e) {
                return false;
            }
        }
        return false;
    }
    
    /**
     * Rollback transaction on current connection
     */
    public void rollback() {
        Connection conn = connectionHolder.get();
        if (conn != null) {
            try {
                if (!conn.isClosed() && !conn.getAutoCommit()) {
                    conn.rollback();
                    LOGGER.fine("✓ Transaction rolled back");
                }
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "⚠ Error during rollback", e);
            }
        }
    }
    
    /**
     * Set auto-commit mode on current connection
     * 
     * @param autoCommit true to enable auto-commit, false to disable
     * @throws SQLException if operation fails
     */
    public void setAutoCommit(boolean autoCommit) throws SQLException {
        Connection conn = getConnection();
        if (conn.getAutoCommit() != autoCommit) {
            conn.setAutoCommit(autoCommit);
            LOGGER.fine("✓ Auto-commit set to: " + autoCommit);
        }
    }
    
    /**
     * Commit transaction on current connection
     * 
     * @throws SQLException if commit fails
     */
    public void commit() throws SQLException {
        Connection conn = connectionHolder.get();
        if (conn != null && !conn.isClosed() && !conn.getAutoCommit()) {
            conn.commit();
            LOGGER.fine("✓ Transaction committed");
        }
    }
}