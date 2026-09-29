<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Rooms - Azure Sands Resort</title>
    
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
        
        .room-badge {
            display: inline-block;
            background: linear-gradient(135deg, #ff6b35, #ff4757);
            color: white;
            padding: 0.3rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .room-details {
            display: flex;
            gap: 1rem;
            margin: 1rem 0;
            padding: 0.8rem 0;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }
        
        .room-detail-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.85rem;
            color: #666;
        }
        
        .room-detail-item i {
            color: #ff6b35;
        }
        
        .room-price {
            font-size: 1.8rem;
            font-weight: 700;
            color: #ff6b35;
            margin: 1rem 0;
        }
        
        .room-price span {
            font-size: 0.9rem;
            font-weight: 400;
            color: #666;
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
            font-size: 0.85rem;
        }
        
        .amenities-list li i {
            color: #ff6b35;
            width: 20px;
        }
        
        .btn-book-room {
            background: linear-gradient(135deg, #ff6b35, #ff4757);
            color: white;
            border: none;
            padding: 0.8rem;
            border-radius: 10px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s;
            text-align: center;
            display: inline-block;
            text-decoration: none;
        }
        
        .btn-book-room:hover {
            transform: translateX(5px);
            background: linear-gradient(135deg, #ff4757, #ff6b35);
            color: white;
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
            .room-price {
                font-size: 1.4rem;
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
                    <a class="nav-link active" href="rooms.jsp">Rooms</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="dining.jsp">Dining</a>
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
        <h1><i class="fas fa-bed"></i> Luxury Accommodations</h1>
        <p class="lead">Experience unparalleled comfort in our curated collection of premium suites and villas</p>
    </div>
</section>

<!-- Room Cards Grid -->
<div class="container mb-5">
    <div class="row g-4">
        
        <!-- Ocean View King -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80" 
                     class="card-img-top" 
                     alt="Luxury Ocean View King Suite with panoramic ocean window"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="room-badge">Most Popular</span>
                    <h3 class="card-title">Ocean View King</h3>
                    <div class="room-details">
                        <span class="room-detail-item"><i class="fas fa-users"></i> 2 Guests</span>
                        <span class="room-detail-item"><i class="fas fa-bed"></i> 1 King Bed</span>
                        <span class="room-detail-item"><i class="fas fa-square"></i> 550 sq ft</span>
                    </div>
                    <div class="room-price">$299 <span>/ night</span></div>
                    <p>Wake up to breathtaking panoramic ocean views from your private balcony. This elegant room features floor-to-ceiling windows and premium amenities.</p>
                    <ul class="amenities-list">
                        <li><i class="fas fa-check-circle"></i> Ocean View Balcony</li>
                        <li><i class="fas fa-check-circle"></i> Mini Bar</li>
                        <li><i class="fas fa-check-circle"></i> 55" Smart TV</li>
                        <li><i class="fas fa-check-circle"></i> Rainfall Shower</li>
                        <li><i class="fas fa-check-circle"></i> Nespresso Machine</li>
                    </ul>
                    <a href="index.jsp#booking" class="btn-book-room" data-room="ocean-view-king" data-price="299">
                        Book This Room <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Beachfront Villa -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=800&q=80" 
                     class="card-img-top" 
                     alt="Luxury Beachfront Villa with private terrace on white sand beach"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="room-badge">Luxury Choice</span>
                    <h3 class="card-title">Beachfront Villa</h3>
                    <div class="room-details">
                        <span class="room-detail-item"><i class="fas fa-users"></i> 4 Guests</span>
                        <span class="room-detail-item"><i class="fas fa-bed"></i> 2 Queen Beds</span>
                        <span class="room-detail-item"><i class="fas fa-square"></i> 1200 sq ft</span>
                    </div>
                    <div class="room-price">$499 <span>/ night</span></div>
                    <p>Step directly onto pristine white sands from your private villa featuring a plunge pool, outdoor shower, and dedicated butler service.</p>
                    <ul class="amenities-list">
                        <li><i class="fas fa-check-circle"></i> Private Plunge Pool</li>
                        <li><i class="fas fa-check-circle"></i> Direct Beach Access</li>
                        <li><i class="fas fa-check-circle"></i> Butler Service</li>
                        <li><i class="fas fa-check-circle"></i> Outdoor Shower</li>
                        <li><i class="fas fa-check-circle"></i> Jacuzzi Tub</li>
                    </ul>
                    <a href="index.jsp#booking" class="btn-book-room" data-room="beachfront-villa" data-price="499">
                        Book This Villa <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Deluxe Suite -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80" 
                     class="card-img-top" 
                     alt="Spacious Deluxe Suite with king bed and luxury living area"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="room-badge">Premium</span>
                    <h3 class="card-title">Deluxe Suite</h3>
                    <div class="room-details">
                        <span class="room-detail-item"><i class="fas fa-users"></i> 3 Guests</span>
                        <span class="room-detail-item"><i class="fas fa-bed"></i> 1 King + Sofa</span>
                        <span class="room-detail-item"><i class="fas fa-square"></i> 850 sq ft</span>
                    </div>
                    <div class="room-price">$399 <span>/ night</span></div>
                    <p>Sophisticated suite featuring separate living and sleeping areas, perfect for business travelers or small families seeking extra space.</p>
                    <ul class="amenities-list">
                        <li><i class="fas fa-check-circle"></i> Separate Living Area</li>
                        <li><i class="fas fa-check-circle"></i> Walk-in Closet</li>
                        <li><i class="fas fa-check-circle"></i> 65" Smart TV</li>
                        <li><i class="fas fa-check-circle"></i> Work Desk</li>
                        <li><i class="fas fa-check-circle"></i> Complimentary WiFi</li>
                    </ul>
                    <a href="index.jsp#booking" class="btn-book-room" data-room="deluxe-suite" data-price="399">
                        Book This Suite <i class="fas fa-arrow-right"></i>
                    </a>
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
                   <i class="fas fa-envelope"></i> reservations@azuresands.com</p>
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
</body>
</html>