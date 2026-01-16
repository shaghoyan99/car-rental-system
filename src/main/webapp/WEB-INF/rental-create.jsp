<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Car" %>
<%@ page import="com.carrental.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New booking — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<section id="content" class="cly-form-card">
    <h2>Create booking</h2>
    <form method="POST" action="/addRental" role="form" aria-label="Create booking form" class="cly-form">
        <fieldset>
            <legend class="cly-sr-only">Booking details</legend>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Car
                        <select class="cly-input" name="carId">
                            <%
                                List<Car> cars = (List<Car>) request.getAttribute("cars");
                                for (Car car : cars) {
                            %>
                            <option value="<%= car.getId() %>" data-rate="<%= car.getDailyRate() %>"><%= car.getBrand() %> <%= car.getModel() %></option>
                            <% } %>
                        </select>
                    </label>
                </div>

                <div class="cly-form-group">
                    <label class="cly-label">Customer
                        <select class="cly-input" name="customerId">
                            <%
                                List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                                for (Customer customer : customers) {
                            %>
                            <option value="<%= customer.getId() %>"><%= customer.getName() %> <%= customer.getSurname() %></option>
                            <% } %>
                        </select>
                    </label>
                </div>
            </div>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Start date
                        <input class="cly-input" type="date" name="startDate">
                    </label>
                </div>
                <div class="cly-form-group">
                    <label class="cly-label">End date
                        <input class="cly-input" type="date" name="endDate">
                    </label>
                </div>
            </div>

            <div class="cly-form-actions">
                <button class="cly-btn-primary" type="submit">Book</button>
            </div>
        </fieldset>
    </form>
</section>

</body>
</html>
