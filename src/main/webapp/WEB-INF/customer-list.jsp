<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="list-main">
    <div class="list-header">
        <div class="header-content">
            <h1>👥 Customers</h1>
            <p>Manage customer profiles and information</p>
        </div>
        <a href="<%= request.getContextPath() %>/addCustomer" class="cly-btn-primary btn-lg">+ Add Customer</a>
    </div>

    <section class="list-container">
        <% List<Customer> customers = (List<Customer>) request.getAttribute("customers");
           if (customers == null || customers.isEmpty()) { %>

        <div class="empty-state">
            <div class="empty-icon">👥</div>
            <h3>No Customers</h3>
            <p>There are currently no customers registered</p>
            <a href="<%= request.getContextPath() %>/addCustomer" class="cly-btn-primary btn-lg">Add Your First Customer</a>
        </div>

        <% } else { %>

        <div class="list-grid">
            <% for (Customer customer : customers) { %>
            <div class="list-item">
                <div class="item-card">
                    <div class="item-image customer-icon">
                        <span class="customer-emoji">👤</span>
                    </div>
                    <div class="item-content">
                        <h3 class="item-title"><%= customer.getName() %> <strong><%= customer.getSurname() %></strong></h3>
                        <p class="item-meta">📧 <%= customer.getEmail() != null ? customer.getEmail() : "N/A" %> • 📞 <%= customer.getPhone() != null ? customer.getPhone() : "N/A" %></p>
                        <div class="item-details">
                            <div class="detail-row">
                                <span class="detail-icon">🪪</span>
                                <div class="detail-info">
                                    <span class="detail-label">License</span>
                                    <p class="detail-value"><%= customer.getLicenseNumber() != null ? customer.getLicenseNumber() : "N/A" %></p>
                                </div>
                            </div>
                        </div>
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
