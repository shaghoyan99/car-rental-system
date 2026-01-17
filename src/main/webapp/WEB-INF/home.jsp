<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.carrental.model.User" %>
<%@ page import="com.carrental.model.enums.UserRole" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CARLY - Premium Car Rental Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="home-container">
    <!-- Hero Banner -->
    <section class="hero-banner">
        <div class="hero-content">
            <h1>🏎️ Premium Car Rental Experience</h1>
            <p>Book luxury vehicles for any occasion. Fast, reliable, and affordable.</p>
            <div class="hero-cta">
                <a href="<%= request.getContextPath() %>/addRental" class="cly-btn-primary btn-lg">📅 Book Now</a>
                <a href="<%= request.getContextPath() %>/cars" class="cly-btn-outline btn-lg">🚗 Browse Fleet</a>
            </div>
        </div>
        <div class="hero-visual">
            <span class="hero-emoji">🚗</span>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="stat-item">
            <div class="stat-icon">🚙</div>
            <div class="stat-number">500+</div>
            <div class="stat-label">Vehicles Available</div>
        </div>
        <div class="stat-item">
            <div class="stat-icon">👥</div>
            <div class="stat-number">10K+</div>
            <div class="stat-label">Happy Customers</div>
        </div>
        <div class="stat-item">
            <div class="stat-icon">⭐</div>
            <div class="stat-number">4.9</div>
            <div class="stat-label">Average Rating</div>
        </div>
        <div class="stat-item">
            <div class="stat-icon">🌍</div>
            <div class="stat-number">24/7</div>
            <div class="stat-label">Support Team</div>
        </div>
    </section>

    <!-- Services Grid -->
    <section class="services-grid">
        <h2>🎯 Our Services</h2>
        <p class="section-subtitle">Everything you need for a seamless car rental experience</p>

        <div class="services-container">
            <div class="service-card">
                <div class="service-icon">🏎️</div>
                <h3>Premium Vehicle Fleet</h3>
                <p>Browse our extensive collection of premium vehicles from economy to luxury cars</p>
                <a href="<%= request.getContextPath() %>/cars" class="service-link">View Fleet →</a>
            </div>

            <div class="service-card">
                <div class="service-icon">📅</div>
                <h3>Easy Booking</h3>
                <p>Simple and secure booking process with flexible dates and instant confirmation</p>
                <a href="<%= request.getContextPath() %>/addRental" class="service-link">Create Booking →</a>
            </div>

            <div class="service-card">
                <div class="service-icon">👥</div>
                <h3>Customer Management</h3>
                <p>Manage customer profiles, view rental history, and track all reservations</p>
                <a href="<%= request.getContextPath() %>/customers" class="service-link">View Customers →</a>
            </div>

            <% User usr = (User) session.getAttribute("authUser");
               if (usr != null && usr.getRole() == UserRole.ADMIN) { %>
            <div class="service-card admin-card">
                <div class="service-icon">⚙️</div>
                <h3>Admin Panel</h3>
                <p>Manage system users, permissions, and access control with ease</p>
                <a href="<%= request.getContextPath() %>/users" class="service-link">Manage Users →</a>
            </div>
            <% } %>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
        <h2>✨ Why Choose CARLY?</h2>
        <p class="section-subtitle">Experience the difference with our premium service</p>

        <div class="features-grid">
            <div class="feature-item">
                <div class="feature-number">01</div>
                <h4>🏆 Premium Fleet</h4>
                <p>Hand-picked, well-maintained vehicles</p>
            </div>
            <div class="feature-item">
                <div class="feature-number">02</div>
                <h4>💰 Competitive Rates</h4>
                <p>Best prices in the market guaranteed</p>
            </div>
            <div class="feature-item">
                <div class="feature-number">03</div>
                <h4>🕐 24/7 Support</h4>
                <p>Always here when you need us</p>
            </div>
            <div class="feature-item">
                <div class="feature-number">04</div>
                <h4>🛡️ Insurance Included</h4>
                <p>Complete coverage on all rentals</p>
            </div>
            <div class="feature-item">
                <div class="feature-number">05</div>
                <h4>🔄 Flexible Booking</h4>
                <p>Easy changes and cancellations</p>
            </div>
            <div class="feature-item">
                <div class="feature-number">06</div>
                <h4>🚀 Fast Delivery</h4>
                <p>Same-day delivery available</p>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="cta-content">
            <h2>🎉 Ready to Book Your Next Adventure?</h2>
            <p>Get started in minutes with our simple booking process</p>
            <a href="<%= request.getContextPath() %>/addRental" class="cly-btn-primary btn-lg cta-button">📅 Book Now</a>
        </div>
    </section>
</main>

</body>
</html>
