<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Azure Sands</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700;900&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .error-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .error-card {
            background: white;
            padding: 3rem;
            border-radius: 20px;
            text-align: center;
            max-width: 500px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        .error-code {
            font-size: 6rem;
            font-weight: 900;
            color: var(--coral-accent);
            margin-bottom: 1rem;
        }
        .error-icon {
            font-size: 4rem;
            color: var(--coral-accent);
            margin-bottom: 1rem;
        }
        .btn-home {
            display: inline-block;
            margin-top: 2rem;
            padding: 1rem 2rem;
            background: var(--gradient-coral);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-home:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(255,107,53,0.3);
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-card">
            <div class="error-icon">
                <i class="fas fa-exclamation-triangle"></i>
            </div>
            <div class="error-code">
                <%= request.getAttribute("javax.servlet.error.status_code") != null ? 
                    request.getAttribute("javax.servlet.error.status_code") : "Error" %>
            </div>
            <h2>Oops! Something went wrong</h2>
            <p>We apologize for the inconvenience. Please try again later or return to the homepage.</p>
            <a href="index.jsp" class="btn-home"><i class="fas fa-home"></i> Return to Home</a>
        </div>
    </div>
</body>
</html>