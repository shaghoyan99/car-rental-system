<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Car" %>
<%@ page import="com.carrental.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Booking - CARLY</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main id="content" class="form-main">
    <div class="form-container">
        <div class="form-header">
            <h1>📅 Create New Booking</h1>
            <p>Book a vehicle for a customer</p>
        </div>

        <% String msg = (String) request.getAttribute("message");
           if (msg != null && !msg.isEmpty()) {
        %>
        <div class="alert-message">
            <div class="alert-icon-circle">⚠️</div>
            <p class="alert-text"><%= msg %></p>
        </div>
        <% } %>

        <form method="POST" action="<%= request.getContextPath() %>/addRental" class="form-content">
            <div class="input-group">
                <label class="input-label" for="carId">
                    <span class="input-icon">🚗</span> Vehicle
                </label>
                <select class="input-field" id="carId" name="carId" required>
                    <option value="">Select a vehicle</option>
                    <% 
                       List<Car> cars = (List<Car>) request.getAttribute("cars");
                       String selectedCarId = request.getParameter("carId");
                       if (cars != null) {
                           for (Car car : cars) {
                               String selected = selectedCarId != null && selectedCarId.equals(String.valueOf(car.getId())) ? "selected" : "";
                    %>
                    <option value="<%= car.getId() %>" <%= selected %>>
                        <%= car.getBrand() %> <%= car.getModel() %> (<%= car.getYear() %>) - $<%= car.getDailyRate() %>/day
                    </option>
                    <% }
                       } %>
                </select>
            </div>

            <div class="input-group">
                <label class="input-label" for="customerId">
                    <span class="input-icon">👤</span> Customer
                </label>
                <select class="input-field" id="customerId" name="customerId" required>
                    <option value="">Select a customer</option>
                    <% 
                       List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                       if (customers != null) {
                           for (Customer customer : customers) {
                    %>
                    <option value="<%= customer.getId() %>">
                        <%= customer.getName() %> <%= customer.getSurname() %> - <%= customer.getEmail() != null ? customer.getEmail() : customer.getPhone() %>
                    </option>
                    <% }
                       } %>
                </select>
            </div>

            <div class="input-group">
                <label class="input-label" for="startDate">
                    <span class="input-icon">📅</span> Start Date
                </label>
                <input class="input-field" type="date" id="startDate" name="startDate" 
                       min="<%= java.time.LocalDate.now() %>" required>
            </div>

            <div class="input-group">
                <label class="input-label" for="endDate">
                    <span class="input-icon">📅</span> End Date
                </label>
                <input class="input-field" type="date" id="endDate" name="endDate" required>
            </div>

            <div class="form-actions">
                <a href="<%= request.getContextPath() %>/rentals" class="cly-btn-outline">Cancel</a>
                <button type="submit" class="cly-btn-primary">✓ Create Booking</button>
            </div>
        </form>
    </div>
</main>

<script>
    // Update end date min when start date changes
    document.getElementById('startDate').addEventListener('change', function() {
        const endDate = document.getElementById('endDate');
        endDate.min = this.value;
        if (endDate.value && endDate.value < this.value) {
            endDate.value = this.value;
        }
    });
</script>

</body>
</html>
