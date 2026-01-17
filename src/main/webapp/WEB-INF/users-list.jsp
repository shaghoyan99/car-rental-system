<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.User" %>
<%@ page import="com.carrental.model.enums.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="list-main">
    <div class="list-header">
        <div class="header-content">
            <h1>⚙️ System Users</h1>
            <p>Manage user accounts and permissions</p>
        </div>
    </div>

    <section class="list-container">
        <% List<User> users = (List<User>) request.getAttribute("users");
           if (users == null || users.isEmpty()) { %>

        <div class="empty-state">
            <div class="empty-icon">👥</div>
            <h3>No Users</h3>
            <p>There are no users in the system</p>
        </div>

        <% } else { %>

        <div class="list-grid">
            <% for (User user : users) { %>
            <div class="list-item">
                <div class="item-card">
                    <div class="item-image user-icon">
                        <span class="user-emoji">👤</span>
                    </div>
                    <div class="item-content">
                        <h3 class="item-title"><%= user.getName() %> <strong><%= user.getSurname() %></strong></h3>
                        <p class="item-meta">📝 <%= user.getUsername() %></p>
                        <div class="item-details">
                            <div class="detail-row">
                                <span class="detail-icon">🔐</span>
                                <div class="detail-info">
                                    <span class="detail-label">Role</span>
                                    <p class="detail-value">
                                        <span class="cly-status-badge <%= user.getRole() == UserRole.ADMIN ? "cly-status-ADMIN" : "cly-status-USER" %>">
                                            <%= user.getRole() %>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item-action">
                        <form method="POST" action="<%= request.getContextPath() %>/updateUserRole" style="display: inline;">
                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                            <select name="role" class="input-field" style="display: inline-block; width: auto; margin-right: 10px;" onchange="this.form.submit()">
                                <option value="USER" <%= user.getRole() == UserRole.USER ? "selected" : "" %>>USER</option>
                                <option value="ADMIN" <%= user.getRole() == UserRole.ADMIN ? "selected" : "" %>>ADMIN</option>
                            </select>
                        </form>
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
