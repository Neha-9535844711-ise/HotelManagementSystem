package com.hotel.servlet;
import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
public class UpdateReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;
    public void init() throws ServletException {
        reservationDAO = new ReservationDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            Reservation reservation = new Reservation();
            reservation.setId(Integer.parseInt(request.getParameter("id")));
            reservation.setGuestName(request.getParameter("guestName"));
            reservation.setRoomNumber(Integer.parseInt(request.getParameter("roomNumber")));
            reservation.setContactNumber(request.getParameter("contactNumber"));
            reservation.setStatus(request.getParameter("status"));
            reservation.setRoomType(request.getParameter("roomType"));
            reservation.setNumberOfGuests(Integer.parseInt(request.getParameter("numberOfGuests")));
            reservation.setDestination(request.getParameter("destination"));
            reservation.setSpecialRequests(request.getParameter("specialRequests"));
            boolean success = reservationDAO.updateReservation(reservation);
            if (success) {
                request.getSession().setAttribute("message", "✏️ Reservation updated successfully!");
            } else {
                request.getSession().setAttribute("error", "Failed to update reservation!");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error: " + e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/admin");
    }
}