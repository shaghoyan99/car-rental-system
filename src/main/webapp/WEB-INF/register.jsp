<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="cly-form-card" role="main">
    <h2>Create account</h2>

    <% String msg = (String) request.getAttribute("message");
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

    <form method="post" action="<%= request.getContextPath() %>/register" class="cly-form" aria-label="Register form">
        <fieldset>
            <legend class="cly-sr-only">Register a new account</legend>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Name
                        <input class="cly-input" type="text" name="name" required autocomplete="name">
                    </label>
                </div>

                <div class="cly-form-group">
                    <label class="cly-label">Surname
                        <input class="cly-input" type="text" name="surname" required autocomplete="surname">
                    </label>
                </div>
            </div>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Username
                        <input class="cly-input" type="text" name="username" required autocomplete="username">
                    </label>
                </div>

                <div class="cly-form-group">
                    <label class="cly-label">Password
                        <input class="cly-input" type="password" name="password" required autocomplete="password">
                    </label>
                </div>
            </div>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Role
                        <select class="cly-input" name="role" aria-label="Select user role">
                            <option value="USER" selected>User</option>
                        </select>
                    </label>
                </div>
            </div>

            <div class="cly-form-actions">
                <button class="cly-btn-primary" type="submit">Register</button>
            </div>

            <p style="margin-top:14px;color:var(--cly-muted);">Already have an account? <a href="<%= request.getContextPath() %>/login" style="color:var(--cly-accent);text-decoration:none;">Sign in</a></p>
        </fieldset>
    </form>
</main>

</body>
</html>
