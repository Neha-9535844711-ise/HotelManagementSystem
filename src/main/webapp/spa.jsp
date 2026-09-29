<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Serenity Spa - Azure Sands Resort</title>
    
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
        
        .treatment-duration {
            display: inline-block;
            background: #f8f9fa;
            color: #ff6b35;
            padding: 0.3rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .treatment-price {
            font-size: 1.8rem;
            font-weight: 700;
            color: #ff6b35;
            margin: 1rem 0;
        }
        
        .treatment-price span {
            font-size: 0.9rem;
            font-weight: 400;
            color: #666;
        }
        
        .benefits-list {
            list-style: none;
            padding: 0;
            margin: 1rem 0;
        }
        
        .benefits-list li {
            padding: 0.3rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.85rem;
        }
        
        .benefits-list li i {
            color: #ff6b35;
            width: 20px;
        }
        
        .btn-book-spa {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 0.8rem;
            border-radius: 10px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s;
        }
        
        .btn-book-spa:hover {
            transform: translateX(5px);
            background: linear-gradient(135deg, #764ba2, #667eea);
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
        
        .modal-content {
            border-radius: 15px;
        }
        
        @media (max-width: 768px) {
            .page-header h1 {
                font-size: 2rem;
            }
            .card-title {
                font-size: 1.2rem;
            }
            .treatment-price {
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
                    <a class="nav-link" href="rooms.jsp">Rooms</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="dining.jsp">Dining</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="spa.jsp">Spa</a>
                </li>
            </ul>
            <a href="index.jsp#booking" class="btn btn-book ms-lg-3 mt-3 mt-lg-0">BOOK NOW</a>
        </div>
    </div>
</nav>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <h1><i class="fas fa-spa"></i> Serenity Spa</h1>
        <p class="lead">Discover harmony and rejuvenation through our signature wellness treatments</p>
    </div>
</section>

<!-- Spa Packages Grid -->
<div class="container mb-5">
    <div class="row g-4">
        
        <!-- Traditional Balinese Massage -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=800&q=80" 
                     class="card-img-top" 
                     alt="Traditional Balinese Massage - Peaceful luxury massage with aromatic oils and hot stones"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="treatment-duration"><i class="fas fa-clock"></i> 60 / 90 min</span>
                    <h3 class="card-title">Traditional Balinese Massage</h3>
                    <p>Ancient healing technique combining acupressure, skin rolling, and gentle stretches using aromatic essential oils to release tension and restore energy flow.</p>
                    <div class="treatment-price">$89 <span>/ 60 min</span> | $119 <span>/ 90 min</span></div>
                    <ul class="benefits-list">
                        <li><i class="fas fa-check-circle"></i> Relieves muscle tension</li>
                        <li><i class="fas fa-check-circle"></i> Improves circulation</li>
                        <li><i class="fas fa-check-circle"></i> Reduces stress & anxiety</li>
                        <li><i class="fas fa-check-circle"></i> Includes herbal tea service</li>
                    </ul>
                    <button class="btn-book-spa" onclick="openSpaBooking('Traditional Balinese Massage', 89)">
                        Book This Treatment <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Couples Retreat Package -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1515377905703-c4788e51af15?auto=format&fit=crop&w=800&q=80" 
                     class="card-img-top" 
                     alt="Couples Retreat Package - Romantic couples spa suite with rose petal flower bath"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="treatment-duration"><i class="fas fa-clock"></i> 120 min</span>
                    <h3 class="card-title">Couples Retreat Package</h3>
                    <p>Romantic spa experience for two including simultaneous massages, rose petal foot soak, and private relaxation with champagne.</p>
                    <div class="treatment-price">$249 <span>/ per couple</span></div>
                    <ul class="benefits-list">
                        <li><i class="fas fa-check-circle"></i> 60-min side-by-side massage</li>
                        <li><i class="fas fa-check-circle"></i> Champagne & chocolates</li>
                        <li><i class="fas fa-check-circle"></i> Private couples suite</li>
                        <li><i class="fas fa-check-circle"></i> Rose petal bath ritual</li>
                    </ul>
                    <button class="btn-book-spa" onclick="openSpaBooking('Couples Retreat Package', 249)">
                        Book Romantic Escape <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Deep Tissue Therapy -->
        <div class="col-md-6 col-lg-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1600334129128-685c5582fd35?auto=format&fit=crop&w=800&q=80" 
                     class="card-img-top" 
                     alt="Deep Tissue Therapy - Therapeutic deep muscle massage in peaceful luxury environment"
                     style="height: 250px; object-fit: cover; width: 100%;">
                <div class="card-body">
                    <span class="treatment-duration"><i class="fas fa-clock"></i> 75 / 90 min</span>
                    <h3 class="card-title">Deep Tissue Therapy</h3>
                    <p>Intense therapeutic massage targeting deep muscle layers to release chronic tension, knots, and improve mobility for active individuals.</p>
                    <div class="treatment-price">$109 <span>/ 75 min</span> | $139 <span>/ 90 min</span></div>
                    <ul class="benefits-list">
                        <li><i class="fas fa-check-circle"></i> Targets chronic pain</li>
                        <li><i class="fas fa-check-circle"></i> Releases muscle knots</li>
                        <li><i class="fas fa-check-circle"></i> Improves flexibility</li>
                        <li><i class="fas fa-check-circle"></i> Post-sports recovery</li>
                    </ul>
                    <button class="btn-book-spa" onclick="openSpaBooking('Deep Tissue Therapy', 109)">
                        Book Deep Tissue <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
        
    </div>
</div>

<!-- Booking Modal -->
<div class="modal fade" id="spaBookingModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Book Your Spa Treatment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="spaBookingForm">
                    <input type="hidden" id="treatmentName" name="treatmentName">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="guestName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Preferred Date</label>
                        <input type="date" class="form-control" id="preferredDate" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Preferred Time</label>
                        <select class="form-select" id="preferredTime" required>
                            <option value="">Select time</option>
                            <option value="09:00">09:00 AM</option>
                            <option value="10:00">10:00 AM</option>
                            <option value="11:00">11:00 AM</option>
                            <option value="13:00">01:00 PM</option>
                            <option value="14:00">02:00 PM</option>
                            <option value="15:00">03:00 PM</option>
                            <option value="16:00">04:00 PM</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Special Requests</label>
                        <textarea class="form-control" rows="2" placeholder="Any allergies or preferences?"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="submitSpaBooking()">Confirm Booking</button>
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
                   <i class="fas fa-envelope"></i> spa@azuresands.com</p>
            </div>
            <div class="col-md-4">
                <h5>Spa Hours</h5>
                <p>Daily: 9:00 AM - 9:00 PM<br>By appointment only</p>
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
    let currentTreatment = "";
    
    function openSpaBooking(treatment, price) {
        currentTreatment = treatment;
        document.getElementById('treatmentName').value = treatment + " ($" + price + ")";
        new bootstrap.Modal(document.getElementById('spaBookingModal')).show();
    }
    
    function submitSpaBooking() {
        const name = document.getElementById('guestName').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const date = document.getElementById('preferredDate').value;
        const time = document.getElementById('preferredTime').value;
        
        if (!name || !email || !phone || !date || !time) {
            alert('Please fill in all required fields.');
            return;
        }
        
        alert(`Thank you ${name}!\n\nYour ${currentTreatment} booking request has been submitted.\n\nOur spa concierge will contact you within 24 hours to confirm your appointment at ${time} on ${date}.`);
        
        bootstrap.Modal.getInstance(document.getElementById('spaBookingModal')).hide();
        document.getElementById('spaBookingForm').reset();
    }
    
    const dateInput = document.getElementById('preferredDate');
    if (dateInput) {
        const today = new Date().toISOString().split('T')[0];
        dateInput.min = today;
    }
</script>
</body>
</html>