package com.hotel.servlet;
import com.hotel.dao.ReservationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
public class DeleteReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;
    public void init() throws ServletException {
        super.init();
        reservationDAO = new ReservationDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            request.getSession().setAttribute("error", "❌ Invalid reservation ID!");
            response.sendRedirect(request.getContextPath() + "/admin");
            return;
        }
        try {
            int reservationId = Integer.parseInt(idParam);
            com.hotel.model.Reservation reservation = reservationDAO.getReservationById(reservationId);
            if (reservation == null) {
                request.getSession().setAttribute("error", "❌ Reservation not found with ID: " + reservationId);
                response.sendRedirect(request.getContextPath() + "/admin");
                return;
            }
            boolean deleted = reservationDAO.deleteReservation(reservationId);
            if (deleted) {
                request.getSession().setAttribute("message", 
                    "🗑️ Reservation #" + reservationId + " for " + reservation.getGuestName() + " has been successfully cancelled!");
                System.out.println("[ADMIN ACTION] Reservation ID " + reservationId + 
                                 " deleted for guest: " + reservation.getGuestName());
            } else {
                request.getSession().setAttribute("error", 
                    "⚠️ Failed to delete reservation #" + reservationId + ". Please try again.");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "❌ Invalid reservation ID format!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", 
                "❌ Database error while deleting reservation: " + e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/admin");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String ajaxHeader = request.getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(ajaxHeader);
        if (idParam == null || idParam.trim().isEmpty()) {
            if (isAjax) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": false, \"message\": \"Invalid reservation ID\"}");
            } else {
                request.getSession().setAttribute("error", "❌ Invalid reservation ID!");
                response.sendRedirect(request.getContextPath() + "/admin");
            }
            return;
        }
        
        try {
            int reservationId = Integer.parseInt(idParam);
            boolean deleted = reservationDAO.deleteReservation(reservationId);
            
            if (isAjax) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                if (deleted) {
                    response.getWriter().write("{\"success\": true, \"message\": \"Reservation deleted successfully\", \"id\": " + reservationId + "}");
                } else {
                    response.getWriter().write("{\"success\": false, \"message\": \"Failed to delete reservation\", \"id\": " + reservationId + "}");
                }
            } else {
                if (deleted) {
                    request.getSession().setAttribute("message", "🗑️ Reservation #" + reservationId + " deleted successfully!");
                } else {
                    request.getSession().setAttribute("error", "⚠️ Failed to delete reservation #" + reservationId);
                }
                response.sendRedirect(request.getContextPath() + "/admin");
            }
            
        } catch (NumberFormatException e) {
            if (isAjax) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": false, \"message\": \"Invalid reservation ID format\"}");
            } else {
                request.getSession().setAttribute("error", "❌ Invalid reservation ID format!");
                response.sendRedirect(request.getContextPath() + "/admin");
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (isAjax) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": false, \"message\": \"Database error: " + e.getMessage() + "\"}");
            } else {
                request.getSession().setAttribute("error", "❌ Database error: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/admin");
            }
        }
    }
}