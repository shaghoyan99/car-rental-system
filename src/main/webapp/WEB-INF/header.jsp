<%@ page import="com.carrental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/modern.css">

<%User user = (User) session.getAttribute("authUser");%>
<header class="topbar" role="banner">
    <div class="topbar-inner">
        <div class="brand" aria-hidden="false">
            <span class="logo">Carly</span>
            <small class="tag">rental</small>
        </div>

        <button id="cly-nav-toggle" class="cly-nav-toggle" aria-controls="cly-main-nav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="hamburger" aria-hidden="true"></span>
        </button>

        <nav id="cly-main-nav" class="main-nav" role="navigation" aria-label="Main Navigation">
            <a href="<%= request.getContextPath() %>/">Overview</a>
            <a href="<%= request.getContextPath() %>/cars">Inventory</a>
            <a href="<%= request.getContextPath() %>/customers">Clients</a>
            <a href="<%= request.getContextPath() %>/rentals">Bookings</a>
        </nav>

        <div class="actions">
            <%if (user == null) { %>
            <a class="cly-btn-outline" href="<%= request.getContextPath() %>/login" aria-label="Login">Login</a>
            <a class="cly-btn-primary" href="<%= request.getContextPath() %>/register"
               aria-label="Register">Register</a>
            <%} else { %>
            <span class="cly-user-greeting">Hello, <strong><%= user.getName() %></strong></span>
            <form method="get" action="<%= request.getContextPath() %>/logout" class="cly-inline-form"
                  aria-label="Logout form">
                <button class="cly-btn-outline" type="submit">Logout</button>
            </form>
            <%} %>

        </div>
    </div>
</header>

<script defer src="<%= request.getContextPath() %>/assets/main.js"></script>
