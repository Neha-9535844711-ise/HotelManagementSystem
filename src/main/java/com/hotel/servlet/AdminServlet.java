package com.hotel.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin") // Matches your browser URL path
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Using your existing DAO
    private ReservationDAO reservationDAO = new ReservationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // 1. Fetch the data arrays from your database via DAO
            List<Reservation> reservationsList = reservationDAO.getAllReservations();
            int totalBookingsCount = reservationDAO.getTotalReservationsCount();
            BigDecimal totalRevenueAmount = reservationDAO.getTotalRevenue();

            // 2. Map them to the EXACT variable names used in your admin.jsp Expressions
            request.setAttribute("reservations", reservationsList);
            request.setAttribute("totalBookings", totalBookingsCount);
            request.setAttribute("totalRevenue", totalRevenueAmount);

            // 3. Securely forward the execution payload to your webapp/admin.jsp view
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            
        } catch (Exception e) {
            // Print out the exact backend failure error tracking stack map in Eclipse Console
            e.printStackTrace();
            
            // Gracefully step aside to your existing error page instead of throwing a generic Tomcat exception
            request.setAttribute("errorMessage", "Database link failed: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Keeps your existing update/delete router logic intact
        doGet(request, response);
    }
}