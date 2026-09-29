<%@ page import="com.hotel.dao.ReservationDAO" %>
<%@ page import="com.hotel.model.Destination" %>
<%@ page import="java.util.List" %>
<%
    ReservationDAO dao = new ReservationDAO();
    List<Destination> destinations = dao.getAvailableDestinations();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Azure Sands | Luxury Beach Resort</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;900&family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Navigation Header -->
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">
                <i class="fas fa-umbrella-beach"></i>
                <h1>AZURE <span>SANDS</span></h1>
            </div>
            <ul class="nav-menu">
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="dining.jsp">Dining</a></li>
                <li><a href="spa.jsp">Spa</a></li>
            </ul>
            <a href="#booking" class="book-now-btn"><i class="fas fa-calendar-check"></i> BOOK NOW</a>
        </div>
    </nav>

    <!-- Animated Slider Hero Section -->
    <section class="hero-slider">
        <div class="slider-container">
            <div class="slide active" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=1920');">
                <div class="slide-content">
                    <h1 class="hero-title">ESCAPE TO TRANQUILITY</h1>
                    <p class="hero-subtitle">Discover paradise where luxury meets the ocean breeze</p>
                </div>
            </div>
            <div class="slide" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=1920');">
                <div class="slide-content">
                    <h1 class="hero-title">YOUR DREAM AWAITS</h1>
                    <p class="hero-subtitle">Experience unmatched luxury at our beachfront villas</p>
                </div>
            </div>
            <div class="slide" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('https://images.unsplash.com/photo-1530521954074-e64f6810b32d?w=1920');">
                <div class="slide-content">
                    <h1 class="hero-title">SUNSETS AND SERENITY</h1>
                    <p class="hero-subtitle">Create memories that last a lifetime</p>
                </div>
            </div>
            <div class="slide" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1920');">
                <div class="slide-content">
                    <h1 class="hero-title">LUXURY REDEFINED</h1>
                    <p class="hero-subtitle">Indulge in world-class amenities and service</p>
                </div>
            </div>
            <button class="slider-btn prev"><i class="fas fa-chevron-left"></i></button>
            <button class="slider-btn next"><i class="fas fa-chevron-right"></i></button>
            <div class="slider-dots"></div>
        </div>
    </section>

    <!-- International Booking Widget -->
    <section id="booking" class="booking-section">
        <div class="container">
            <div class="booking-card floating-card">
                <div class="booking-header">
                    <i class="fas fa-globe-americas"></i>
                    <h2>Find Your Paradise</h2>
                    <p>Explore our global collection of luxury properties</p>
                </div>
                
                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-error">
                        <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %>
                    </div>
                <% } %>
                
                <form action="${pageContext.request.contextPath}/booking" method="POST" class="booking-form">
                    <input type="hidden" name="action" value="reserve">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-map-marker-alt"></i> Select Destination</label>
                            <select name="destination" required>
                                <option value="">Choose your paradise</option>
                                <% for(Destination dest : destinations) { %>
                                    <option value="<%= dest.getCode() %>"><%= dest.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label><i class="fas fa-user"></i> Guest Name</label>
                            <input type="text" name="guestName" placeholder="Full name" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-door-open"></i> Room Type</label>
                            <select name="roomType">
                                <option value="standard">Standard Room</option>
                                <option value="ocean-view-king">Ocean View King</option>
                                <option value="beachfront-villa">Beachfront Villa</option>
                                <option value="deluxe-suite">Deluxe Suite</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label><i class="fas fa-hashtag"></i> Room Number</label>
                            <input type="number" name="roomNumber" placeholder="Room #" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-users"></i> Number of Guests</label>
                            <input type="number" name="numberOfGuests" min="1" max="6" value="2">
                        </div>
                        
                        <div class="form-group">
                            <label><i class="fas fa-phone"></i> Contact Number</label>
                            <input type="tel" name="contactNumber" placeholder="+1 234 567 8900" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-pen"></i> Special Requests</label>
                        <textarea name="specialRequests" rows="2" placeholder="Any special requests or preferences?"></textarea>
                    </div>
                    
                    <button type="submit" class="btn-book"><i class="fas fa-check-circle"></i> Reserve Your Stay →</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2 class="section-title">Why Choose Azure Sands?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-umbrella-beach"></i></div>
                    <h3>Private Beach Access</h3>
                    <p>Step directly onto pristine white sands</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-utensils"></i></div>
                    <h3>World-Class Dining</h3>
                    <p>Michelin-starred chefs at your service</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-spa"></i></div>
                    <h3>Award-Winning Spa</h3>
                    <p>Rejuvenate mind, body, and soul</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-infinity"></i></div>
                    <h3>Infinity Pools</h3>
                    <p>Panoramic ocean views from every pool</p>
                </div>
            </div>
        </div>
    </section>

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
                <p>&copy; 2024 Azure Sands Resort. All rights reserved. | <a href="admin.jsp"><i class="fas fa-chart-line"></i> Admin Dashboard</a></p>
            </div>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>