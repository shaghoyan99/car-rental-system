<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="cly-form-card" role="main">
    <h2>Sign in</h2>

    <% String msg = (String) session.getAttribute("message");
        if (msg == null || msg.isEmpty()) {
            msg = (String) session.getAttribute("message");
            if (msg != null) session.removeAttribute("message");
        }
    %>
    <% if (msg != null && !msg.isEmpty()) { %>
    <div role="alert" class="cly-alert" style="background:#3e1f00;color:#fff;padding:10px;border-radius:8px;margin-bottom:12px;">
        <p><%= msg %></p>
    </div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/login" class="cly-form" aria-label="Login form">
        <fieldset>
            <legend class="cly-sr-only">Login to your account</legend>

            <div class="cly-form-group">
                <label class="cly-label">Username
                    <input class="cly-input" type="text" name="username" autocomplete="username" required>
                </label>
            </div>

            <div class="cly-form-group">
                <label class="cly-label">Password
                    <input class="cly-input" type="password" name="password" autocomplete="current-password" required>
                </label>
            </div>

            <div class="cly-form-row" style="align-items:center;justify-content:space-between;">
                <label style="display:inline-flex;align-items:center;gap:8px;color:var(--cly-muted)">
                    <input type="checkbox" name="remember"> Remember me
                </label>
                <a href="#" class="cly-btn-outline" style="text-decoration:none;">Forgot?</a>
            </div>

            <div class="cly-form-actions">
                <button class="cly-btn-primary" type="submit">Sign in</button>
            </div>

            <p style="margin-top:14px;color:var(--cly-muted);">Don't have an account? <a
                    href="<%= request.getContextPath() %>/register"
                    style="color:var(--cly-accent);text-decoration:none;">Register</a></p>
        </fieldset>
    </form>
</main>

</body>
</html>
