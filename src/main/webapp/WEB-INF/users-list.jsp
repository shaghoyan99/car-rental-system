<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="cly-grid-page">
    <div class="cly-page-actions">
        <a class="cly-btn-primary" href="<%= request.getContextPath() %>/register">Add user</a>
    </div>

    <section class="cly-grid">
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            for (User u : users) {
        %>
        <article class="cly-card">
            <h4><%= u.getUsername() %></h4>
            <p class="cly-muted"><%= u.getName() %> <%= u.getSurname() %></p>

            <form method="post" action="<%= request.getContextPath() %>/updateUserRole" class="cly-inline-form" aria-label="Change role for <%= u.getUsername() %>">
                <input type="hidden" name="userId" value="<%= u.getId() %>">
                <label class="cly-label" style="margin-right:8px">
                    Role
                    <select name="role" class="cly-input">
                        <option value="USER" <%= u.getRole() == null || u.getRole().toString().equals("USER") ? "selected" : "" %>>User</option>
                        <option value="ADMIN" <%= u.getRole() != null && u.getRole().toString().equals("ADMIN") ? "selected" : "" %>>Admin</option>
                    </select>
                </label>
                <button type="submit" class="cly-btn-primary">Save</button>
            </form>
        </article>
        <% } %>
    </section>
</main>

</body>
</html>
