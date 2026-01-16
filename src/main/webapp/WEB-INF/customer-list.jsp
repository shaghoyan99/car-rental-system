<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clients — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<section id="content" class="cly-grid-page">
    <div class="cly-page-actions">
        <a class="cly-btn-primary" href="<%= request.getContextPath() %>/addCustomer">Add client</a>
    </div>

    <div class="cly-grid cly-small">
        <%
            List<Customer> customers = (List<Customer>) request.getAttribute("customers");
            for (Customer customer : customers) {
        %>
        <article class="cly-client-card">
            <h4><%= customer.getName() %> <%= customer.getSurname() %></h4>
            <p class="cly-muted">License: <%= customer.getLicenseNumber() %></p>
            <p class="cly-muted">Email: <%= customer.getEmail() %></p>
        </article>
        <% } %>
    </div>
</section>

</body>
</html>
