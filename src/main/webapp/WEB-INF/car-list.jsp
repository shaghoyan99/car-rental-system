<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Car" %>
<%@ page import="com.carrental.model.User" %>
<%@ page import="com.carrental.model.enums.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Fleet - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="list-main">
    <!-- Page Header -->
    <div class="list-header">
        <div class="header-content">
            <h1>🏎️ Premium Vehicle Fleet</h1>
            <p>Browse and manage our luxury vehicle collection</p>
        </div>
        <% User user = (User) session.getAttribute("authUser");
           if (user != null && user.getRole() == UserRole.ADMIN) { %>
        <a href="<%= request.getContextPath() %>/addCar" class="cly-btn-primary btn-lg">+ Add Vehicle</a>
        <% } %>
    </div>

    <!-- List Container -->
    <section class="list-container">
        <% List<Car> allCars = (List<Car>) request.getAttribute("allCars");
           if (allCars == null || allCars.isEmpty()) { %>

        <!-- Empty State -->
        <div class="empty-state">
            <div class="empty-icon">🚗</div>
            <h3>No Vehicles Available</h3>
            <p>There are currently no vehicles in our fleet</p>
            <% if (user != null && user.getRole() == UserRole.ADMIN) { %>
            <a href="<%= request.getContextPath() %>/addCar" class="cly-btn-primary btn-lg">Add Your First Vehicle</a>
            <% } %>
        </div>

        <% } else { %>

        <!-- Items Grid -->
        <div class="list-grid">
            <% for (Car car : allCars) { %>
            <div class="list-item">
                <div class="item-card">
                    <!-- Vehicle Icon -->
                    <div class="item-image vehicle-icon">
                        <span class="vehicle-emoji">🚗</span>
                    </div>

                    <!-- Vehicle Info -->
                    <div class="item-content">
                        <h3 class="item-title"><%= car.getBrand() %> <strong><%= car.getModel() %></strong></h3>
                        <p class="item-meta">📅 <%= car.getYear() %> • 💵 $<%= car.getDailyRate() %>/day</p>

                        <!-- Vehicle Details -->
                        <div class="item-details">
                            <div class="detail-row">
                                <span class="detail-icon">📊</span>
                                <div class="detail-info">
                                    <span class="detail-label">Status</span>
                                    <p class="detail-value">
                                        <span class="cly-status-badge cly-status-<%= car.getStatus() %>"><%= car.getStatus() %></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="item-action">
                        <% if (car.getStatus().toString().equals("AVAILABLE")) { %>
                        <a href="<%= request.getContextPath() %>/addRental?carId=<%= car.getId() %>" class="cly-btn-primary btn-compact">
                            📅 Book Now
                        </a>
                        <% } else { %>
                        <button class="cly-btn-outline btn-compact" disabled>
                            🚫 Unavailable
                        </button>
                        <% } %>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } %>
    </section>
</main>

</body>
</html>
