<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Carly Dashboard</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="cly-dashboard">
    <section class="cly-cards">
        <article class="cly-card">
            <h3>Fleet</h3>
            <p class="cly-muted">View and manage available cars</p>
            <a class="cly-card-link" href="<%= request.getContextPath() %>/cars">Open Inventory</a>
        </article>
        <article class="cly-card">
            <h3>Clients</h3>
            <p class="cly-muted">Customer list and details</p>
            <a class="cly-card-link" href="<%= request.getContextPath() %>/customers">Open Clients</a>
        </article>
        <article class="cly-card">
            <h3>Bookings</h3>
            <p class="cly-muted">Active and past rentals</p>
            <a class="cly-card-link" href="<%= request.getContextPath() %>/rentals">Open Bookings</a>
        </article>
    </section>
</main>

</body>
</html>