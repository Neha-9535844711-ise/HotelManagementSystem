// Image Slider Functionality
document.addEventListener('DOMContentLoaded', function() {
    // Initialize slider
    const slides = document.querySelectorAll('.slide');
    const prevBtn = document.querySelector('.prev');
    const nextBtn = document.querySelector('.next');
    const dotsContainer = document.querySelector('.slider-dots');
    
    let currentSlide = 0;
    let slideInterval;
    const slideIntervalTime = 5000; // 5 seconds
    
    // Create dots
    if (slides.length > 0 && dotsContainer) {
        slides.forEach((_, index) => {
            const dot = document.createElement('div');
            dot.classList.add('dot');
            if (index === 0) dot.classList.add('active');
            dot.addEventListener('click', () => goToSlide(index));
            dotsContainer.appendChild(dot);
        });
    }
    
    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active');
            if (dotsContainer) {
                const dots = dotsContainer.children;
                if (dots[i]) dots[i].classList.remove('active');
            }
        });
        
        slides[index].classList.add('active');
        if (dotsContainer && dotsContainer.children[index]) {
            dotsContainer.children[index].classList.add('active');
        }
        currentSlide = index;
    }
    
    function nextSlide() {
        let newIndex = currentSlide + 1;
        if (newIndex >= slides.length) newIndex = 0;
        showSlide(newIndex);
    }
    
    function prevSlide() {
        let newIndex = currentSlide - 1;
        if (newIndex < 0) newIndex = slides.length - 1;
        showSlide(newIndex);
    }
    
    function goToSlide(index) {
        showSlide(index);
        resetInterval();
    }
    
    function startInterval() {
        slideInterval = setInterval(nextSlide, slideIntervalTime);
    }
    
    function resetInterval() {
        clearInterval(slideInterval);
        startInterval();
    }
    
    // Add event listeners if buttons exist
    if (prevBtn) prevBtn.addEventListener('click', () => { prevSlide(); resetInterval(); });
    if (nextBtn) nextBtn.addEventListener('click', () => { nextSlide(); resetInterval(); });
    
    // Start the slider if there are slides
    if (slides.length > 0) {
        startInterval();
    }
    
    // Close alert messages
    const closeButtons = document.querySelectorAll('.close-alert');
    closeButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            this.parentElement.style.display = 'none';
        });
    });
    
    // Auto-hide alerts after 5 seconds
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(() => {
            alert.style.opacity = '0';
            setTimeout(() => {
                if (alert.parentElement) alert.style.display = 'none';
            }, 300);
        }, 5000);
    });
    
    // Form validation
    const bookingForm = document.querySelector('.booking-form');
    if (bookingForm) {
        bookingForm.addEventListener('submit', function(e) {
            const guestName = this.querySelector('[name="guestName"]');
            const roomNumber = this.querySelector('[name="roomNumber"]');
            const contactNumber = this.querySelector('[name="contactNumber"]');
            
            if (guestName && guestName.value.trim() === '') {
                e.preventDefault();
                showError(guestName, 'Please enter guest name');
            }
            
            if (roomNumber && roomNumber.value.trim() === '') {
                e.preventDefault();
                showError(roomNumber, 'Please select room number');
            }
            
            if (contactNumber && contactNumber.value.trim() === '') {
                e.preventDefault();
                showError(contactNumber, 'Please enter contact number');
            }
        });
    }
    
    function showError(input, message) {
        const formGroup = input.closest('.form-group');
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.style.color = '#dc3545';
        errorDiv.style.fontSize = '0.85rem';
        errorDiv.style.marginTop = '0.3rem';
        errorDiv.textContent = message;
        
        const existingError = formGroup.querySelector('.error-message');
        if (existingError) existingError.remove();
        
        formGroup.appendChild(errorDiv);
        input.style.borderColor = '#dc3545';
        
        setTimeout(() => {
            errorDiv.remove();
            input.style.borderColor = '#e0e0e0';
        }, 3000);
    }
    
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    // Navbar scroll effect
    const navbar = document.querySelector('.navbar');
    if (navbar) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 100) {
                navbar.style.background = 'rgba(255, 255, 255, 0.98)';
                navbar.style.boxShadow = '0 4px 20px rgba(0,0,0,0.1)';
            } else {
                navbar.style.background = 'rgba(255, 255, 255, 0.95)';
                navbar.style.boxShadow = '0 2px 10px rgba(0,0,0,0.05)';
            }
        });
    }
});

// Admin dashboard functions
function openEditModal(id, guestName, roomNumber, contactNumber, status, roomType, guests, destination, specialRequests) {
    const modal = document.getElementById('editModal');
    if (!modal) return;
    
    document.getElementById('editId').value = id;
    document.getElementById('editGuestName').value = guestName;
    document.getElementById('editRoomNumber').value = roomNumber;
    document.getElementById('editContactNumber').value = contactNumber;
    document.getElementById('editStatus').value = status;
    document.getElementById('editRoomType').value = roomType || 'standard';
    document.getElementById('editGuests').value = guests || 2;
    
    if (document.getElementById('editDestination')) {
        document.getElementById('editDestination').value = destination || '';
    }
    if (document.getElementById('editSpecialRequests')) {
        document.getElementById('editSpecialRequests').value = specialRequests || '';
    }
    
    modal.style.display = 'block';
}

function closeModal() {
    const modal = document.getElementById('editModal');
    if (modal) modal.style.display = 'none';
}

// Close modal when clicking outside
window.onclick = function(event) {
    const modal = document.getElementById('editModal');
    if (event.target === modal) {
        closeModal();
    }
}

// Delete confirmation
function confirmDelete(reservationId, guestName) {
    return confirm(`⚠️ Cancel Reservation\n\nAre you sure you want to cancel ${guestName}'s reservation?\n\nThis action cannot be undone!`);
}