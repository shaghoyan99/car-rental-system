<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="form-main">
    <div class="form-container">
        <div class="form-header">
            <h1>👥 Add New Customer</h1>
            <p>Register a new customer in the system</p>
        </div>

        <form method="POST" action="<%= request.getContextPath() %>/addCustomer" class="form-content">
            <div class="input-group">
                <label class="input-label" for="name">
                    <span class="input-icon">👤</span> First Name
                </label>
                <input class="input-field" type="text" id="name" name="name" placeholder="Enter first name" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="surname">
                    <span class="input-icon">👤</span> Last Name
                </label>
                <input class="input-field" type="text" id="surname" name="surname" placeholder="Enter last name" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="license_number">
                    <span class="input-icon">🪪</span> License Number
                </label>
                <input class="input-field" type="text" id="license_number" name="license_number" placeholder="Enter license number" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="phone">
                    <span class="input-icon">📞</span> Phone
                </label>
                <input class="input-field" type="tel" id="phone" name="phone" placeholder="Enter phone number" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="email">
                    <span class="input-icon">📧</span> Email
                </label>
                <input class="input-field" type="email" id="email" name="email" placeholder="Enter email address" required>
            </div>

            <div class="form-actions">
                <a href="<%= request.getContextPath() %>/customers" class="cly-btn-outline">Cancel</a>
                <button type="submit" class="cly-btn-primary">✓ Add Customer</button>
            </div>
        </form>
    </div>
</main>

</body>
</html>
