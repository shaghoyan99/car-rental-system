<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Car" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inventory — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<section id="content" class="cly-grid-page">
    <div class="cly-page-actions">
        <a class="cly-btn-primary" href="<%= request.getContextPath() %>/addCar">Add new car</a>
    </div>

    <div class="cly-grid">
        <%
            List<Car> allCars = (List<Car>) request.getAttribute("allCars");
            for (Car car : allCars) {
        %>
        <article class="cly-vehicle-card" data-id="<%= car.getId() %>">
            <div class="cly-vehicle-header">
                <h4><%= car.getBrand() %> <span class="cly-muted"><%= car.getModel() %></span></h4>
                <span class="cly-meta">Year <%= car.getYear() %></span>
            </div>
            <div class="cly-vehicle-body">
                <p>Daily: <strong><%= car.getDailyRate() %></strong></p>
                <p class="cly-status-pill cly-status-<%= car.getStatus() %>"><%= car.getStatus() %></p>
            </div>
        </article>
        <% } %>
    </div>
</section>

</body>
</html>
