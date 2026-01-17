<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="login-page-wrapper">
    <div class="login-container">
        <div class="login-header">
            <div class="login-icon">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                </svg>
            </div>
            <h1>✨ Create Account</h1>
            <p>Join CARLY and start renting premium vehicles</p>
        </div>

        <div class="login-body">
            <% String msg = (String) request.getAttribute("message");
                if (msg != null && !msg.isEmpty()) {
            %>
            <div class="alert-message">
                <div class="alert-icon-circle">⚠️</div>
                <p class="alert-text"><%= msg %></p>
            </div>
            <% } %>

            <form method="POST" action="<%= request.getContextPath() %>/register" class="login-form">
                <div class="input-group">
                    <label class="input-label" for="name">
                        <span class="input-icon">👤</span> First Name
                    </label>
                    <input class="input-field" type="text" id="name" name="name" placeholder="Enter your first name" required>
                </div>

                <div class="input-group">
                    <label class="input-label" for="surname">
                        <span class="input-icon">👤</span> Last Name
                    </label>
                    <input class="input-field" type="text" id="surname" name="surname" placeholder="Enter your last name" required>
                </div>

                <div class="input-group">
                    <label class="input-label" for="username">
                        <span class="input-icon">📝</span> Username
                    </label>
                    <input class="input-field" type="text" id="username" name="username" placeholder="Choose a username" required>
                </div>

                <div class="input-group">
                    <label class="input-label" for="password">
                        <span class="input-icon">🔒</span> Password
                    </label>
                    <input class="input-field" type="password" id="password" name="password" placeholder="Create a password" required>
                </div>

                <button class="login-button" type="submit">✓ Create Account</button>

                <div class="login-footer">
                    <p>Already have an account? <a href="<%= request.getContextPath() %>/login">Sign In</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
