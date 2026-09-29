<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gourmet Dining - Azure Sands Resort</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
        }
        
        .navbar {
            background: rgba(26, 26, 46, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 0;
        }
        
        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            font-weight: 700;
            color: white !important;
        }
        
        .navbar-brand span {
            color: #ff6b35;
        }
        
        .nav-link {
            color: white !important;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .nav-link:hover, .nav-link.active {
            color: #ff6b35 !important;
        }
        
        .btn-book {
            background: linear-gradient(135deg, #ff6b35, #ff4757);
            color: white;
            border-radius: 50px;
            padding: 0.5rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-book:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,107,53,0.3);
            color: white;
        }
        
        .page-header {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            padding: 6rem 0 4rem;
            color: white;
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .page-header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            height: 100%;
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }
        
        .card-img-top {
            height: 250px;
            object-fit: cover;
            width: 100%;
        }
        
        .card-body {
            padding: 1.5rem;
        }
        
        .card-title {
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .cuisine-badge {
            display: inline-block;
            background: linear-gradient(135deg, #ff6b35, #ff4757);
            color: white;
            padding: 0.3rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .hours {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        
        .hours i {
            color: #ff6b35;
            margin-right: 0.5rem;
        }
        
        .amenities-list {
            list-style: none;
            padding: 0;
            margin: 1rem 0;
        }
        
        .amenities-list li {
            padding: 0.3rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
        }
        
        .amenities-list li i {
            color: #ff6b35;
            width: 20px;
        }
        
        .signature-dish {
            background: #fff5f0;
            padding: 1rem;
            border-radius: 10px;
            margin: 1rem 0;
            border-left: 3px solid #ff6b35;
        }
        
        .signature-dish strong {
            color: #ff6b35;
            display: block;
            margin-bottom: 0.5rem;
        }
        
        .btn-reserve {
            background: linear-gradient(135deg, #ff6b35, #ff4757);
            color: white;
            border: none;
            padding: 0.8rem;
            border-radius: 10px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s;
        }
        
        .btn-reserve:hover {
            transform: translateX(5px);
            background: linear-gradient(135deg, #ff4757, #ff6b35);
        }
        
        .footer {
            background: #1a1a2e;
            color: white;
            padding: 3rem 0 2rem;
            margin-top: 3rem;
        }
        
        .footer a {
            color: #ff6b35;
            text-decoration: none;
        }
        
        @media (max-width: 768px) {
            .page-header h1 {
                font-size: 2rem;
            }
            .card-title {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">AZURE <span>SANDS</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="rooms.jsp">Rooms</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="dining.jsp">Dining</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="spa.jsp">Spa</a>
                </li>
            </ul>
            <a href="index.jsp#booking" class="btn btn-book ms-lg-3 mt-3 mt-lg-0">BOOK NOW</a>
        </div>
    </div>
</nav>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <h1><i class="fas fa-utensils"></i> Culinary Excellence</h1>
        <p class="lead">Embark on a gastronomic journey around the world without leaving the resort</p>
    </div>
</section>

<!-- Dining Cards Grid -->
<div class="container mb-5">
    <div class="row g-4">
        
        <!-- Card 1: Spice Route - Indian Cuisine -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=800&h=600&fit=crop" 
                     class="card-img-top" 
                     alt="Authentic Indian Tandoori Chicken and Naan"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="cuisine-badge">Indian • Tandoor</span>
                    <h3 class="card-title">Spice Route</h3>
                    <div class="hours">
                        <i class="fas fa-clock"></i> Dinner: 6:00 PM - 10:30 PM | Sunday Brunch: 12:00 PM - 3:00 PM
                    </div>
                    <p>Exquisite North Indian cuisine featuring traditional tandoor dishes, aromatic curries, and freshly baked breads from our clay oven.</p>
                    <div class="signature-dish">
                        <strong><i class="fas fa-star"></i> Signature Dish</strong>
                        "Butter Chicken with Garlic Naan" - Tandoor-cooked chicken in a creamy tomato sauce, served with freshly baked garlic naan
                    </div>
                    <ul class="amenities-list">
                        <li><i class="fas fa-check-circle"></i> Tandoor Specialties</li>
                        <li><i class="fas fa-check-circle"></i> Fresh Naan Breads</li>
                        <li><i class="fas fa-check-circle"></i> Authentic Curries</li>
                        <li><i class="fas fa-check-circle"></i> Indian Wines</li>
                    </ul>
                    <button class="btn-reserve" onclick="openReservation('Spice Route', 'Indian')">
                        Reserve a Table <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Card 2: The Brasserie - French Cuisine -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.pexels.com/photos/260922/pexels-photo-260922.jpeg?auto=compress&cs=tinysrgb&w=800&h=600&fit=crop" 
                     class="card-img-top" 
                     alt="Luxury French Brasserie with Ocean View Terrace"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="cuisine-badge">French • Brasserie</span>
                    <h3 class="card-title">The Brasserie</h3>
                    <div class="hours">
                        <i class="fas fa-clock"></i> Breakfast: 7:00 AM - 10:30 AM | Lunch: 12:00 PM - 3:00 PM | Dinner: 6:00 PM - 10:00 PM
                    </div>
                    <p>Classic French brasserie fare in an elegant yet relaxed setting. Known for our seafood tower, steak frites, and extensive wine list.</p>
                    <div class="signature-dish">
                        <strong><i class="fas fa-star"></i> Signature Dish</strong>
                        "Coq au Vin" - Slow-cooked chicken in red wine with mushrooms, pearl onions, and bacon, served with pomme purée
                    </div>
                    <ul class="amenities-list">
                        <li><i class="fas fa-check-circle"></i> Ocean View Terrace</li>
                        <li><i class="fas fa-check-circle"></i> Extensive Wine List</li>
                        <li><i class="fas fa-check-circle"></i> Fresh Seafood</li>
                        <li><i class="fas fa-check-circle"></i> Live Piano Music</li>
                    </ul>
                    <button class="btn-reserve" onclick="openReservation('The Brasserie', 'French')">
                        Reserve a Table <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Card 3: Pool Bar and Grill -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.pexels.com/photos/1643388/pexels-photo-1643388.jpeg?auto=compress&cs=tinysrgb&w=800&h=600&fit=crop" 
                     class="card-img-top" 
                     alt="Luxury Poolside Bar with Tropical Cocktails"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="cuisine-badge">Casual • Grill</span>
                    <h3 class="card-title">Pool Bar & Grill</h3>
                    <div class="hours">
                        <i class="fas fa-clock"></i> Daily: 10:00 AM - 6:00 PM | Happy Hour: 3:00 PM - 5:00 PM
                    </div>
                    <p>Relaxed poolside dining with gourmet burgers, fresh salads, tropical cocktails, and stunning ocean views.</p>
                    <div class="signature-dish">
                        <strong><i class="fas fa-star"></i> Signature Dish</strong>
                        "Azure Burger" - Wagyu beef patty with caramelized onions, truffle aioli, aged cheddar, and hand-cut truffle fries
                    </div>
                    <ul class="amenities-list">
                        <li><i class="fas fa-check-circle"></i> Poolside Service</li>
                        <li><i class="fas fa-check-circle"></i> Tropical Cocktails</li>
                        <li><i class="fas fa-check-circle"></i> Live Sports Screening</li>
                        <li><i class="fas fa-check-circle"></i> Sunset Happy Hour</li>
                    </ul>
                    <button class="btn-reserve" onclick="openReservation('Pool Bar & Grill', 'Casual')">
                        Reserve a Table <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
        
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4 mb-md-0">
                <h4 class="mb-3">AZURE <span style="color: #ff6b35;">SANDS</span></h4>
                <p>123 Paradise Cove<br>Malibu, California 90265</p>
            </div>
            <div class="col-md-4 mb-4 mb-md-0">
                <h5>Contact Us</h5>
                <p><i class="fas fa-phone"></i> +1 (555) 123-4567<br>
                   <i class="fas fa-envelope"></i> dining@azuresands.com</p>
            </div>
            <div class="col-md-4">
                <h5>Follow Us</h5>
                <div class="social-links">
                    <a href="#" class="me-3"><i class="fab fa-instagram fa-lg"></i></a>
                    <a href="#" class="me-3"><i class="fab fa-facebook fa-lg"></i></a>
                    <a href="#" class="me-3"><i class="fab fa-twitter fa-lg"></i></a>
                </div>
            </div>
        </div>
        <hr class="mt-4" style="border-color: rgba(255,255,255,0.1);">
        <div class="text-center">
            <p class="mb-0">&copy; 2024 Azure Sands Resort. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function openReservation(restaurant, cuisine) {
        alert(`Reservation requested for ${restaurant}\nCuisine: ${cuisine}\n\nOur dining team will contact you within 24 hours to confirm your booking.`);
    }
</script>
</body>
</html>