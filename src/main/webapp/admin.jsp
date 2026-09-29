<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Reservation" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Azure Sands Resort</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;900&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .admin-nav {
            background: var(--night-sky);
        }
        .admin-nav .logo h1, 
        .admin-nav .nav-menu a {
            color: white;
        }
        .admin-nav .nav-menu a:hover {
            color: var(--coral-accent);
        }
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        .stat-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: transform 0.3s;
        }
        .stat-box:hover {
            transform: translateY(-5px);
        }
        .stat-box.orange {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }
        .stat-box.teal {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }
        .stat-info h3 {
            font-size: 0.9rem;
            opacity: 0.9;
            margin-bottom: 0.5rem;
        }
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
        }
        .stat-icon {
            font-size: 3rem;
            opacity: 0.8;
        }
        .search-section {
            background: white;
            padding: 1.5rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .search-form {
            display: flex;
            gap: 1rem;
            align-items: flex-end;
        }
        .search-form .form-group {
            flex: 1;
            margin-bottom: 0;
        }
        .btn-search, .btn-reset {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-search {
            background: var(--gradient-coral);
            color: white;
        }
        .btn-reset {
            background: #6c757d;
            color: white;
            text-decoration: none;
            display: inline-block;
        }
        .btn-search:hover, .btn-reset:hover {
            transform: translateY(-2px);
        }
        .export-buttons {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            justify-content: flex-end;
        }
        .btn-export {
            padding: 0.5rem 1rem;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
        }
        .btn-export.csv {
            background: #17a2b8;
        }
        .btn-export:hover {
            opacity: 0.9;
        }
        .table-wrapper {
            overflow-x: auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .data-table {
            width: 100%;
            border-collapse: collapse;
        }
        .data-table th {
            background: var(--night-sky);
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 600;
        }
        .data-table td {
            padding: 1rem;
            border-bottom: 1px solid #e0e0e0;
        }
        .data-table tr:hover {
            background: #f8f9fa;
        }
        .status-badge {
            display: inline-block;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
        }
        .status-confirmed {
            background: #d4edda;
            color: #155724;
        }
        .status-checked_in {
            background: #d1ecf1;
            color: #0c5460;
        }
        .status-checked_out {
            background: #f8d7da;
            color: #721c24;
        }
        .status-cancelled {
            background: #e2e3e5;
            color: #383d41;
        }
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        .btn-edit {
            background: #ffc107;
            color: #333;
            padding: 0.4rem 0.8rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.85rem;
            transition: all 0.3s;
        }
        .btn-delete {
            background: #dc3545;
            color: white;
            padding: 0.4rem 0.8rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.85rem;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        .btn-edit:hover, .btn-delete:hover {
            transform: translateY(-2px);
        }
        .no-data {
            text-align: center;
            padding: 3rem;
            color: #666;
        }
        @media (max-width: 768px) {
            .search-form {
                flex-direction: column;
            }
            .data-table th,
            .data-table td {
                padding: 0.5rem;
                font-size: 0.85rem;
            }
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar admin-nav">
        <div class="nav-container">
            <div class="logo">
                <i class="fas fa-chart-line"></i>
                <h1>AZURE <span>SANDS</span></h1>
            </div>
            <ul class="nav-menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="admin.jsp" class="active">Dashboard</a></li>
                <li><a href="rooms.jsp">Rooms</a></li>
                <li><a href="dining.jsp">Dining</a></li>
                <li><a href="spa.jsp">Spa</a></li>
            </ul>
            <a href="index.jsp" class="book-now-btn"><i class="fas fa-home"></i> Back to Site</a>
        </div>
    </nav>

    <div class="admin-container">
        <div class="admin-header">
            <h1><i class="fas fa-tachometer-alt"></i> Admin Dashboard</h1>
            <p>Manage reservations, view statistics, and control operations</p>
        </div>

        <!-- Statistics Cards -->
        <div class="stats-container">
            <div class="stat-box">
                <div class="stat-info">
                    <h3>Total Reservations</h3>
                    <div class="stat-number"><%= request.getAttribute("totalReservations") != null ? request.getAttribute("totalReservations") : 0 %></div>
                </div>
                <div class="stat-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
            </div>
            <div class="stat-box orange">
                <div class="stat-info">
                    <h3>Total Revenue</h3>
                    <div class="stat-number">
                        <% 
                            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.US);
                            Object revenue = request.getAttribute("totalRevenue");
                            if (revenue != null) {
                                out.print(currencyFormat.format(revenue));
                            } else {
                                out.print("$0");
                            }
                        %>
                    </div>
                </div>
                <div class="stat-icon">
                    <i class="fas fa-dollar-sign"></i>
                </div>
            </div>
            <div class="stat-box teal">
                <div class="stat-info">
                    <h3>Occupancy Rate</h3>
                    <div class="stat-number">78%</div>
                </div>
                <div class="stat-icon">
                    <i class="fas fa-bed"></i>
                </div>
            </div>
        </div>

        <!-- Alert Messages -->
        <% if (session.getAttribute("message") != null) { %>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <%= session.getAttribute("message") %>
                <% session.removeAttribute("message"); %>
            </div>
        <% } %>
        
        <% if (session.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> <%= session.getAttribute("error") %>
                <% session.removeAttribute("error"); %>
            </div>
        <% } %>

        <!-- Search and Export Section -->
        <div class="search-section">
            <div class="export-buttons">
                <button class="btn-export" onclick="exportToPDF()"><i class="fas fa-file-pdf"></i> Export PDF</button>
                <button class="btn-export csv" onclick="exportToCSV()"><i class="fas fa-file-excel"></i> Export CSV</button>
            </div>
            <form action="${pageContext.request.contextPath}/admin" method="GET" class="search-form">
                <input type="hidden" name="action" value="search">
                <div class="form-group">
                    <label><i class="fas fa-search"></i> Search by Guest Name</label>
                    <input type="text" name="searchName" placeholder="Enter guest name..." value="${param.searchName}">
                </div>
                <button type="submit" class="btn-search"><i class="fas fa-search"></i> Search</button>
                <a href="${pageContext.request.contextPath}/admin" class="btn-reset"><i class="fas fa-sync-alt"></i> Reset</a>
            </form>
        </div>

        <!-- Reservations Table -->
        <div class="table-wrapper">
            <table class="data-table" id="reservationTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Guest Name</th>
                        <th>Room #</th>
                        <th>Room Type</th>
                        <th>Guests</th>
                        <th>Contact</th>
                        <th>Check-in Date</th>
                        <th>Status</th>
                        <th>Amount</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% @SuppressWarnings("unchecked")
                        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                        if (reservations != null && !reservations.isEmpty()) {
                            for (Reservation res : reservations) {
                    %>
                    <tr>
                        <td><%= res.getId() %></td>
                        <td><%= res.getGuestName() %></td>
                        <td><%= res.getRoomNumber() %></td>
                        <td><%= res.getRoomType() != null ? res.getRoomType().replace("-", " ") : "Standard" %></td>
                        <td><%= res.getNumberOfGuests() %></td>
                        <td><%= res.getContactNumber() %></td>
                        <td><%= res.getReservationDate() != null ? res.getReservationDate().toLocalDate() : "N/A" %></td>
                        <td>
                            <span class="status-badge status-<%= res.getStatus().toLowerCase().replace("_", "-") %>">
                                <%= res.getStatus() %>
                            </span>
                        </td>
                        <td><%= currencyFormat.format(res.getTotalAmount()) %></td>
                        <td class="action-buttons">
                            <button onclick="openEditModal(<%= res.getId() %>, '<%= res.getGuestName() %>', 
                                    <%= res.getRoomNumber() %>, '<%= res.getContactNumber() %>', 
                                    '<%= res.getStatus() %>', '<%= res.getRoomType() != null ? res.getRoomType() : "standard" %>', 
                                    <%= res.getNumberOfGuests() %>)" class="btn-edit">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <a href="${pageContext.request.contextPath}/delete-reservation?id=<%= res.getId() %>" 
                               onclick="return confirmDelete(<%= res.getId() %>, '<%= res.getGuestName() %>')" 
                               class="btn-delete">
                                <i class="fas fa-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="10" class="no-data">
                            <i class="fas fa-inbox"></i> No reservations found
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2><i class="fas fa-edit"></i> Edit Reservation</h2>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>
            <form action="${pageContext.request.contextPath}/update-reservation" method="POST">
                <input type="hidden" id="editId" name="id">
                
                <div class="form-group">
                    <label><i class="fas fa-user"></i> Guest Name</label>
                    <input type="text" id="editGuestName" name="guestName" required>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label><i class="fas fa-door-open"></i> Room Number</label>
                        <input type="number" id="editRoomNumber" name="roomNumber" required>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-users"></i> Number of Guests</label>
                        <input type="number" id="editGuests" name="numberOfGuests" min="1" max="6">
                    </div>
                </div>
                
                <div class="form-group">
                    <label><i class="fas fa-bed"></i> Room Type</label>
                    <select id="editRoomType" name="roomType">
                        <option value="standard">Standard Room</option>
                        <option value="ocean-view-king">Ocean View King</option>
                        <option value="beachfront-villa">Beachfront Villa</option>
                        <option value="deluxe-suite">Deluxe Suite</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label><i class="fas fa-phone"></i> Contact Number</label>
                    <input type="text" id="editContactNumber" name="contactNumber" required>
                </div>
                
                <div class="form-group">
                    <label><i class="fas fa-tag"></i> Status</label>
                    <select id="editStatus" name="status">
                        <option value="CONFIRMED">Confirmed</option>
                        <option value="CHECKED_IN">Checked In</option>
                        <option value="CHECKED_OUT">Checked Out</option>
                        <option value="CANCELLED">Cancelled</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label><i class="fas fa-map-marker-alt"></i> Destination</label>
                    <input type="text" id="editDestination" name="destination" placeholder="Optional">
                </div>
                
                <div class="form-group">
                    <label><i class="fas fa-pen"></i> Special Requests</label>
                    <textarea id="editSpecialRequests" name="specialRequests" rows="2" placeholder="Any special requests?"></textarea>
                </div>
                
                <button type="submit" class="btn-book"><i class="fas fa-save"></i> Update Reservation</button>
            </form>
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
                    <h3>Admin Access</h3>
                    <p>Secure Management Portal<br>Version 2.0</p>
                </div>
                <div class="footer-section">
                    <h3>Support</h3>
                    <p><i class="fas fa-envelope"></i> admin@azuresands.com</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Azure Sands Resort. Confidential Admin Dashboard</p>
            </div>
        </div>
    </footer>

    <script>
        function openEditModal(id, guestName, roomNumber, contactNumber, status, roomType, guests) {
            document.getElementById('editId').value = id;
            document.getElementById('editGuestName').value = guestName;
            document.getElementById('editRoomNumber').value = roomNumber;
            document.getElementById('editContactNumber').value = contactNumber;
            document.getElementById('editStatus').value = status;
            document.getElementById('editRoomType').value = roomType || 'standard';
            document.getElementById('editGuests').value = guests || 2;
            document.getElementById('editModal').style.display = 'block';
        }
        
        function closeModal() {
            document.getElementById('editModal').style.display = 'none';
        }
        
        function confirmDelete(reservationId, guestName) {
            return confirm(`⚠️ Cancel Reservation\n\nAre you sure you want to cancel ${guestName}'s reservation?\n\nThis action cannot be undone!`);
        }
        
        function exportToPDF() {
            window.print();
        }
        
        function exportToCSV() {
            let table = document.getElementById('reservationTable');
            let csv = [];
            for (let i = 0; i < table.rows.length; i++) {
                let row = table.rows[i];
                let rowData = [];
                for (let j = 0; j < row.cells.length - 1; j++) {
                    rowData.push('"' + row.cells[j].innerText.replace(/"/g, '""') + '"');
                }
                csv.push(rowData.join(','));
            }
            let csvContent = csv.join('\n');
            let blob = new Blob([csvContent], { type: 'text/csv' });
            let link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'reservations_export.csv';
            link.click();
        }
        
        window.onclick = function(event) {
            const modal = document.getElementById('editModal');
            if (event.target === modal) {
                closeModal();
            }
        }
        
        // Auto-hide alerts after 5 seconds
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                setTimeout(() => {
                    alert.style.opacity = '0';
                    setTimeout(() => alert.remove(), 300);
                }, 5000);
            });
        }, 100);
    </script>
</body>
</html>