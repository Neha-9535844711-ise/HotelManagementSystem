package com.hotel.test;

import com.hotel.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/dbtest")
public class DBTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Database Connection Test</title>");
        out.println("<style>");
        out.println("body { font-family: monospace; padding: 20px; background: #f5f5f5; }");
        out.println(".success { color: green; }");
        out.println(".error { color: red; }");
        out.println(".info { color: blue; }");
        out.println("pre { background: white; padding: 15px; border-radius: 5px; border: 1px solid #ddd; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Azure Sands Hotel - Database Connection Test</h1>");
        out.println("<hr/>");
        
        DBConnection db = DBConnection.getInstance();
        
        // Test connection
        out.println("<h2>Testing Database Connection...</h2>");
        if (db.testConnection()) {
            out.println("<p class='success'>✓ Connection Successful!</p>");
        } else {
            out.println("<p class='error'>✗ Connection Failed!</p>");
        }
        
        // Show detailed status
        out.println("<h2>Connection Details:</h2>");
        out.println("<pre>");
        out.println(db.getConnectionStatus());
        out.println("</pre>");
        
        out.println("<hr/>");
        out.println("<p><a href='index.jsp'>Return to Homepage</a></p>");
        out.println("</body>");
        out.println("</html>");
    }
}