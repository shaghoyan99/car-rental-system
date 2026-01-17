<%@ page import="java.util.List" %>
<%@ page import="com.carrental.dto.RentalDetails" %>
<%@ page import="com.carrental.model.enums.RentalStatus" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="list-main">
    <div class="list-header">
        <div class="header-content">
            <h1>📅 Bookings</h1>
            <p>View and manage all rental bookings</p>
        </div>
        <a href="<%= request.getContextPath() %>/addRental" class="cly-btn-primary btn-lg">+ New Booking</a>
    </div>

    <section class="list-container">
        <% List<RentalDetails> rentals = (List<RentalDetails>) request.getAttribute("rentals");
           if (rentals == null || rentals.isEmpty()) { %>

        <div class="empty-state">
            <div class="empty-icon">📅</div>
            <h3>No Bookings</h3>
            <p>There are currently no rental bookings</p>
            <a href="<%= request.getContextPath() %>/addRental" class="cly-btn-primary btn-lg">Create Your First Booking</a>
        </div>

        <% } else { %>

        <div class="list-grid">
            <% for (RentalDetails details : rentals) { %>
            <div class="list-item">
                <div class="item-card">
                    <div class="item-image rental-icon">
                        <span class="rental-emoji">🚗</span>
                    </div>
                    <div class="item-content">
                        <h3 class="item-title"><%= details.getCar().getBrand() %> <strong><%= details.getCar().getModel() %></strong></h3>
                        <p class="item-meta">👤 <%= details.getCustomer().getName() %> <%= details.getCustomer().getSurname() %></p>
                        <div class="item-details">
                            <div class="detail-row">
                                <span class="detail-icon">📅</span>
                                <div class="detail-info">
                                    <span class="detail-label">Period</span>
                                    <p class="detail-value"><%= details.getRental().getStartDate() %> to <%= details.getRental().getEndDate() %></p>
                                </div>
                            </div>
                            <div class="detail-row">
                                <span class="detail-icon">💰</span>
                                <div class="detail-info">
                                    <span class="detail-label">Total Cost</span>
                                    <p class="detail-value">$<%= details.getRental().getTotalCost() %></p>
                                </div>
                            </div>
                            <div class="detail-row">
                                <span class="detail-icon">📊</span>
                                <div class="detail-info">
                                    <span class="detail-label">Status</span>
                                    <p class="detail-value">
                                        <span class="cly-status-badge cly-status-<%= details.getRental().getRentalStatus() %>"><%= details.getRental().getRentalStatus() %></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item-action">
                        <% if (details.getRental().getRentalStatus() == RentalStatus.ACTIVE) { %>
                        <form method="POST" action="<%= request.getContextPath() %>/updateRentalStatus" style="display: inline;">
                            <input type="hidden" name="rentalId" value="<%= details.getRental().getId() %>">
                            <input type="hidden" name="status" value="COMPLETED">
                            <button type="submit" class="cly-btn-primary btn-compact">✓ Complete</button>
                        </form>
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
