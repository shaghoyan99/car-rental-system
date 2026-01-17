<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="login-page-wrapper">
    <div class="login-container">
        <!-- Header Section -->
        <div class="login-header">
            <div class="login-icon">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                </svg>
            </div>
            <h1>🔐 Welcome Back</h1>
            <p>Sign in to access your account</p>
        </div>

        <!-- Body Section -->
        <div class="login-body">
            <!-- Alert Message -->
            <% String msg = (String) session.getAttribute("message");
                if (msg != null && !msg.isEmpty()) {
                    session.removeAttribute("message");
            %>
            <div class="alert-message">
                <div class="alert-icon-circle">⚠️</div>
                <p class="alert-text"><%= msg %></p>
            </div>
            <% } %>

            <!-- Login Form -->
            <form method="POST" action="<%= request.getContextPath() %>/login" class="login-form">
                <fieldset style="border: none; padding: 0; margin: 0;">
                    <legend style="position: absolute; width: 1px; height: 1px; overflow: hidden;">Login to your account</legend>

                    <!-- Username Field -->
                    <div class="input-group">
                        <label class="input-label" for="username">
                            <span class="input-icon">👤</span> Username
                        </label>
                        <input class="input-field" type="text" id="username" name="username" placeholder="Enter your username" autocomplete="username" required>
                    </div>

                    <!-- Password Field -->
                    <div class="input-group">
                        <label class="input-label" for="password">
                            <span class="input-icon">🔒</span> Password
                        </label>
                        <input class="input-field" type="password" id="password" name="password" placeholder="Enter your password" autocomplete="current-password" required>
                    </div>

                    <!-- Remember Me -->
                    <div class="remember-checkbox">
                        <input type="checkbox" name="remember" id="remember">
                        <label for="remember">Remember me</label>
                    </div>

                    <!-- Submit Button -->
                    <button class="login-button" type="submit">
                        ✓ Sign In
                    </button>

                    <!-- Register Link -->
                    <div class="login-footer">
                        <p>Don't have an account? <a href="<%= request.getContextPath() %>/register">Create Account</a></p>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>

</body>
</html>
