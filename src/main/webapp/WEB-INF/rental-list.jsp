<%@ page import="java.util.List" %>
<%@ page import="com.carrental.dto.RentalDetails" %>
<%@ page import="com.carrental.model.enums.RentalStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bookings — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<section id="content" class="cly-bookings">
    <div class="cly-page-actions">
        <a class="cly-btn-primary" href="<%= request.getContextPath() %>/addRental">New Booking</a>
    </div>

    <div class="cly-bookings-list">
        <%
            List<RentalDetails> rentals = (List<RentalDetails>) request.getAttribute("rentals");
            for (RentalDetails rental : rentals) {
        %>
        <article class="cly-booking-card" data-id="<%= rental.getRental().getId() %>">
            <div class="left">
                <h4><%= rental.getCar().getBrand() %> <%= rental.getCar().getModel()%></h4>
                <p class="cly-muted">Customer: <%= rental.getCustomer().getName()%> <%= rental.getCustomer().getSurname()%></p>
                <p>Period:
                    <time class="cly-date" datetime="<%= rental.getRental().getStartDate() %>" data-date="<%= rental.getRental().getStartDate() %>"><%= rental.getRental().getStartDate() %></time>
                    <span class="cly-date-sep"> — </span>
                    <time class="cly-date" datetime="<%= rental.getRental().getEndDate() %>" data-date="<%= rental.getRental().getEndDate() %>"><%= rental.getRental().getEndDate() %></time>
                </p>
            </div>
            <div class="right">
                <p class="cly-price">Total: <strong><%= rental.getRental().getTotalCost()%></strong></p>
                <p class="cly-status-pill cly-status-<%= rental.getRental().getRentalStatus()%>"><%= rental.getRental().getRentalStatus()%></p>

                <div class="cly-actions">
                    <form method="post" action="/updateRentalStatus" class="cly-inline-form" aria-label="Update rental status">
                        <input type="hidden" name="rentalId" value="<%= rental.getRental().getId() %>">
                        <% if (rental.getRental().getRentalStatus() == RentalStatus.ACTIVE) { %>
                        <input type="hidden" name="status" value="CANCELED">
                        <button class="cly-btn-outline" type="submit">Cancel</button>
                        <% } else { %>
                        <input type="hidden" name="status" value="ACTIVE">
                        <button class="cly-btn-outline" type="submit">Activate</button>
                        <% } %>
                    </form>
                </div>
            </div>
        </article>
        <% } %>
    </div>
</section>

</body>
</html>
