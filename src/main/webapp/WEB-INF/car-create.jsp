<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.carrental.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="form-main">
    <div class="form-container">
        <div class="form-header">
            <h1>🚗 Add New Vehicle</h1>
            <p>Add a new vehicle to the fleet</p>
        </div>

        <form method="POST" action="<%= request.getContextPath() %>/addCar" class="form-content">
            <div class="input-group">
                <label class="input-label" for="brand">
                    <span class="input-icon">🏷️</span> Brand
                </label>
                <input class="input-field" type="text" id="brand" name="brand" placeholder="e.g., Toyota, BMW" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="model">
                    <span class="input-icon">🚙</span> Model
                </label>
                <input class="input-field" type="text" id="model" name="model" placeholder="e.g., Camry, X5" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="year">
                    <span class="input-icon">📅</span> Year
                </label>
                <input class="input-field" type="number" id="year" name="year" placeholder="e.g., 2023" min="1900" max="<%= java.time.Year.now().getValue() + 1 %>" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="daily">
                    <span class="input-icon">💰</span> Daily Rate ($)
                </label>
                <input class="input-field" type="number" id="daily" name="daily" placeholder="e.g., 50.00" step="0.01" min="0" required>
            </div>

            <div class="form-actions">
                <a href="<%= request.getContextPath() %>/cars" class="cly-btn-outline">Cancel</a>
                <button type="submit" class="cly-btn-primary">✓ Add Vehicle</button>
            </div>
        </form>
    </div>
</main>

</body>
</html>
