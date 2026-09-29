<%@ page import="com.hotel.model.Reservation" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    // Safely look for the object in either the request scope or session scope
    Reservation reservation = (Reservation) request.getAttribute("reservation");
    if (reservation == null) {
        reservation = (Reservation) session.getAttribute("reservation");
    }
    
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.US);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Status - Azure Sands</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;900&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">
                <i class="fas fa-umbrella-beach"></i>
                <h1>AZURE <span>SANDS</span></h1>
            </div>
            <ul class="nav-menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="dining.jsp">Dining</a></li>
                <li><a href="spa.jsp">Spa</a></li>
            </ul>
            <a href="index.jsp#booking" class="book-now-btn">BOOK NOW</a>
        </div>
    </nav>

    <div class="confirmation-container" style="min-height: 80vh; display: flex; align-items: center; justify-content: center; padding: 6rem 2rem;">
        <div class="confirmation-card" style="width: 100%; max-width: 600px; background: white; border-radius: 20px; padding: 3rem; text-align: center; box-shadow: 0 20px 60px rgba(0,0,0,0.1);">
            
            <% if (reservation != null) { %>
                <div class="success-icon" style="font-size: 5rem; color: #28a745; margin-bottom: 1rem;">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h1 style="color: var(--coral-accent); margin-bottom: 1rem;">Booking Confirmed!</h1>
                <p style="font-size: 1.2rem; margin-bottom: 2rem;">Thank you for choosing Azure Sands</p>
                
                <div class="booking-details" style="text-align: left; background: #f8f9fa; padding: 1.5rem; border-radius: 15px; margin: 2rem 0;">
                    <h3 style="margin-bottom: 1rem;">Reservation Details</h3>
                    <p><strong>Booking ID:</strong> #<%= reservation.getId() %></p>
                    <p><strong>Guest Name:</strong> <%= reservation.getGuestName() != null ? reservation.getGuestName() : "N/A" %></p>
                    <p><strong>Room Number:</strong> <%= reservation.getRoomNumber() %></p>
                    <p><strong>Room Type:</strong> <%= reservation.getRoomType() != null ? reservation.getRoomType().replace("-", " ") : "Standard" %></p>
                    <p><strong>Number of Guests:</strong> <%= reservation.getNumberOfGuests() %></p>
                    <p><strong>Contact Number:</strong> <%= reservation.getContactNumber() != null ? reservation.getContactNumber() : "N/A" %></p>
                    
                    <p><strong>Total Amount:</strong> 
                        <%= (reservation.getTotalAmount() != null) ? currencyFormat.format(reservation.getTotalAmount()) : "$0.00" %>
                    </p>
                    
                    <% if(reservation.getSpecialRequests() != null && !reservation.getSpecialRequests().isEmpty()) { %>
                        <p><strong>Special Requests:</strong> <%= reservation.getSpecialRequests() %></p>
                    <% } %>
                </div>
                
                <p style="margin-bottom: 1rem;">A confirmation email has been sent to your registered contact.</p>
            
            <% } else { %>
                <div class="error-icon" style="font-size: 5rem; color: #dc3545; margin-bottom: 1rem;">
                    <i class="fas fa-exclamation-circle"></i>
                </div>
                <h1 style="color: #dc3545; margin-bottom: 1rem;">No Active Booking Found</h1>
                <p style="font-size: 1.1rem; margin-bottom: 2rem; color: #6c757d;">We couldn't locate any active reservation data. This can happen if you refresh the page or access it directly.</p>
            <% } %>
            
            <div style="display: flex; gap: 1rem; justify-content: center; margin-top: 1.5rem;">
                <a href="index.jsp" class="btn-book" style="text-decoration: none;">Return to Home</a>
                <a href="index.jsp#booking" class="btn-room-book" style="text-decoration: none;">Book Another</a>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3><i class="fas fa-hotel"></i> Azure Sands Resort</h3>
                    <p>123 Paradise Cove<br>Malibu, California 90265</p>
                </div>
                <div class="footer-section">
                    <h3>Contact</h3>
                    <p><i class="fas fa-phone"></i> +1 (555) 123-4567<br>
                       <i class="fas fa-envelope"></i> reservations@azuresands.com</p>
                </div>
                <div class="footer-section">
                    <h3>Follow Us</h3>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 Azure Sands Resort. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>