<%@ page import="com.carrental.model.User" %>
<%@ page import="com.carrental.model.enums.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">

<% User user = (User) session.getAttribute("authUser"); %>

<header class="topbar">
    <div class="topbar-inner">
        <!-- Logo Section -->
        <div class="brand">
            <div class="logo">
                <svg width="28" height="28" viewBox="0 0 28 28" fill="none" style="display: inline; margin-right: 8px;">
                    <circle cx="14" cy="14" r="12" fill="url(#grad1)" />
                    <path d="M10 14 L18 14 M14 10 L14 18" stroke="white" stroke-width="2" stroke-linecap="round"/>
                    <defs>
                        <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="100%">
                            <stop offset="0%" style="stop-color:#ffd166;stop-opacity:1" />
                            <stop offset="100%" style="stop-color:#06a77d;stop-opacity:1" />
                        </linearGradient>
                    </defs>
                </svg>
                CARLY
            </div>
            <div class="tag">Luxury Rentals</div>
        </div>

        <!-- Navigation -->
        <nav class="main-nav">
            <a href="<%= request.getContextPath() %>/home" title="Home">
                <span>🏠</span> Dashboard
            </a>
            <a href="<%= request.getContextPath() %>/cars" title="Browse vehicles">
                <span>🏎️</span> Vehicles
            </a>
            <a href="<%= request.getContextPath() %>/customers" title="Manage customers">
                <span>👥</span> Customers
            </a>
            <a href="<%= request.getContextPath() %>/rentals" title="View bookings">
                <span>📅</span> Bookings
            </a>
            <% if (user != null && user.getRole() == UserRole.ADMIN) { %>
            <a href="<%= request.getContextPath() %>/users" title="Manage system users">
                <span>⚙️</span> Users
            </a>
            <% } %>
        </nav>

        <!-- User Actions -->
        <div class="actions">
            <% if (user == null) { %>
            <!-- Not Logged In -->
            <a class="cly-btn-outline" href="<%= request.getContextPath() %>/login">
                Sign In
            </a>
            <a class="cly-btn-primary" href="<%= request.getContextPath() %>/register">
                Create Account
            </a>
            <% } else { %>
            <!-- Logged In -->
            <div class="user-menu">
                <div class="user-badge">
                    <span class="avatar"><%= user.getName().charAt(0) %></span>
                    <span class="user-name"><%= user.getName() %></span>
                    <% if (user.getRole() == UserRole.ADMIN) { %>
                    <span class="admin-tag">ADMIN</span>
                    <% } %>
                </div>
                <form method="get" action="<%= request.getContextPath() %>/logout" style="margin: 0;">
                    <button type="submit" class="cly-btn-outline" title="Sign out">
                        Logout
                    </button>
                </form>
            </div>
            <% } %>
        </div>
    </div>
</header>

<script defer src="<%= request.getContextPath() %>/assets/app.js"></script>
