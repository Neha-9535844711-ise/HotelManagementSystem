package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;
    
    @Override
    public void init() throws ServletException {
        reservationDAO = new ReservationDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("reserve".equals(action)) {
            String guestName = request.getParameter("guestName");
            String roomNumberStr = request.getParameter("roomNumber");
            String contactNumber = request.getParameter("contactNumber");
            String destination = request.getParameter("destination");
            String roomType = request.getParameter("roomType");
            String guestsStr = request.getParameter("numberOfGuests");
            String specialRequests = request.getParameter("specialRequests");
            
            // Basic Form Validation
            if (guestName == null || guestName.trim().isEmpty() ||
                roomNumberStr == null || roomNumberStr.trim().isEmpty() || 
                contactNumber == null || contactNumber.trim().isEmpty()) {
                request.setAttribute("error", "All vital fields are required!");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            
            try {
                int roomNumber = Integer.parseInt(roomNumberStr.trim());
                int numberOfGuests = (guestsStr != null && !guestsStr.trim().isEmpty()) ? Integer.parseInt(guestsStr.trim()) : 2;
                Reservation reservation = new Reservation(guestName, roomNumber, contactNumber);
                reservation.setRoomType(roomType != null ? roomType : "Standard");
                reservation.setNumberOfGuests(numberOfGuests);
                reservation.setDestination(destination);
                reservation.setSpecialRequests(specialRequests);
                boolean success = reservationDAO.createReservation(reservation);
                
                if (success) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("reservation", reservation);
                    
                    request.setAttribute("message", "✨ Reservation successful! ✨");
                    request.setAttribute("reservation", reservation);
                    request.getRequestDispatcher("/confirmation.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Failed to make reservation. Please try again.");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid numeric input format for room or guest number!");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("error", "Database error encountered: " + e.getMessage());
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}