package com.hotel.dao;

import com.hotel.db.DBConnection;
import com.hotel.model.Reservation;
import com.hotel.model.Destination;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class ReservationDAO {
    
    // CREATE - Secure PreparedStatement
    public boolean createReservation(Reservation reservation) throws SQLException {
        String sql = "INSERT INTO reservations (guest_name, room_number, contact_number, " +
                    "reservation_date, status, total_amount, room_type, number_of_guests, destination, special_requests) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            // FIX 1: If the model does not have a date set from the UI form, fall back to current system time
            LocalDateTime bookingDate = reservation.getReservationDate();
            if (bookingDate == null) {
                bookingDate = LocalDateTime.now();
                reservation.setReservationDate(bookingDate); // Sync it back to the object for the JSP layer
            }
            
            // FIX 2: Pre-calculate price if it's null so that the calculated value is synced back to the object
            if (reservation.getTotalAmount() == null) {
                BigDecimal calculatedPrice = calculatePrice(reservation.getRoomType(), reservation.getNumberOfGuests());
                reservation.setTotalAmount(calculatedPrice); // Sync it back to the object for confirmation.jsp!
            }
            
            pstmt.setString(1, reservation.getGuestName());
            pstmt.setInt(2, reservation.getRoomNumber());
            pstmt.setString(3, reservation.getContactNumber());
            pstmt.setTimestamp(4, Timestamp.valueOf(bookingDate));
            pstmt.setString(5, reservation.getStatus() != null ? reservation.getStatus() : "CONFIRMED");
            pstmt.setBigDecimal(6, reservation.getTotalAmount());
            pstmt.setString(7, reservation.getRoomType() != null ? reservation.getRoomType() : "Standard");
            pstmt.setInt(8, reservation.getNumberOfGuests());
            pstmt.setString(9, reservation.getDestination());
            pstmt.setString(10, reservation.getSpecialRequests());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        reservation.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        }
        return false;
    }
    
    private BigDecimal calculatePrice(String roomType, int guests) {
        if (roomType == null) return new BigDecimal("199.00");
        
        BigDecimal basePrice;
        // FIX 3: Standardize to lowercase and trim spaces to ensure reliable string switching
        switch (roomType.toLowerCase().replace(" ", "-").trim()) {
            case "ocean-view-king": 
                basePrice = new BigDecimal("299.00"); 
                break;
            case "beachfront-villa": 
                basePrice = new BigDecimal("499.00"); 
                break;
            case "deluxe-suite": 
                basePrice = new BigDecimal("399.00"); 
                break;
            default: 
                basePrice = new BigDecimal("199.00");
        }
        
        if (guests > 2) {
            basePrice = basePrice.add(new BigDecimal("50.00").multiply(new BigDecimal(guests - 2)));
        }
        return basePrice;
    }
    
    // READ - Get all reservations
    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservations ORDER BY reservation_date DESC";
        
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                reservations.add(mapResultSetToReservation(rs));
            }
        }
        return reservations;
    }
    
    // READ - Search by guest name
    public List<Reservation> searchByGuestName(String guestName) throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservations WHERE guest_name LIKE ? ORDER BY reservation_date DESC";
        
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "%" + guestName + "%");
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    reservations.add(mapResultSetToReservation(rs));
                }
            }
        }
        return reservations;
    }
    
    // READ - Get by ID
    public Reservation getReservationById(int id) throws SQLException {
        String sql = "SELECT * FROM reservations WHERE id = ?";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToReservation(rs);
                }
            }
        }
        return null;
    }
    
    // UPDATE
    public boolean updateReservation(Reservation reservation) throws SQLException {
        String sql = "UPDATE reservations SET guest_name = ?, room_number = ?, " +
                    "contact_number = ?, status = ?, room_type = ?, number_of_guests = ?, " +
                    "destination = ?, special_requests = ? WHERE id = ?";
        
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, reservation.getGuestName());
            pstmt.setInt(2, reservation.getRoomNumber());
            pstmt.setString(3, reservation.getContactNumber());
            pstmt.setString(4, reservation.getStatus());
            pstmt.setString(5, reservation.getRoomType());
            pstmt.setInt(6, reservation.getNumberOfGuests());
            pstmt.setString(7, reservation.getDestination());
            pstmt.setString(8, reservation.getSpecialRequests());
            pstmt.setInt(9, reservation.getId());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    // DELETE
    public boolean deleteReservation(int id) throws SQLException {
        String sql = "DELETE FROM reservations WHERE id = ?";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        }
    }
    
    // Statistics
    public int getTotalReservationsCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM reservations";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }
    
    public BigDecimal getTotalRevenue() throws SQLException {
        String sql = "SELECT SUM(total_amount) FROM reservations WHERE status != 'CANCELLED'";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) return rs.getBigDecimal(1) != null ? rs.getBigDecimal(1) : BigDecimal.ZERO;
        }
        return BigDecimal.ZERO;
    }
    
    // Get available destinations
    public List<Destination> getAvailableDestinations() {
        List<Destination> destinations = new ArrayList<>();
        destinations.add(new Destination("bali", "Bali, Indonesia", "Indonesia"));
        destinations.add(new Destination("maldives", "Maldives", "Maldives"));
        destinations.add(new Destination("phuket", "Phuket, Thailand", "Thailand"));
        destinations.add(new Destination("hawaii", "Hawaii, USA", "USA"));
        destinations.add(new Destination("cancun", "Cancun, Mexico", "Mexico"));
        destinations.add(new Destination("santorini", "Santorini, Greece", "Greece"));
        return destinations;
    }
    
    private Reservation mapResultSetToReservation(ResultSet rs) throws SQLException {
        Reservation reservation = new Reservation();
        reservation.setId(rs.getInt("id"));
        reservation.setGuestName(rs.getString("guest_name"));
        reservation.setRoomNumber(rs.getInt("room_number"));
        
        // Match standard variable configuration mappings
        reservation.setContactNumber(rs.getString("contact_number"));
        
        Timestamp timestamp = rs.getTimestamp("reservation_date");
        if (timestamp != null) reservation.setReservationDate(timestamp.toLocalDateTime());
        
        reservation.setStatus(rs.getString("status"));
        reservation.setTotalAmount(rs.getBigDecimal("total_amount"));
        reservation.setRoomType(rs.getString("room_type"));
        reservation.setNumberOfGuests(rs.getInt("number_of_guests"));
        reservation.setDestination(rs.getString("destination"));
        reservation.setSpecialRequests(rs.getString("special_requests"));
        return reservation;
    }
}