<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Car" %>
<%@ page import="com.carrental.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Rental</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container">
    <h2>Create Rental</h2>

    <form method="POST" action="/addRental">

        <label>Car</label>
        <select name="carId"><
            <%
                List<Car> cars = (List<Car>) request.getAttribute("cars");
                for (Car car : cars) {
            %>
            <option value="<%= car.getId() %>">
                <%= car.getBrand() %> <%= car.getModel() %>
            </option>
            <% } %>
        </select>

        <label>Customer</label>
        <select name="customerId">
            <%
                List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                for (Customer customer : customers) {
            %>
            <option value="<%= customer.getId() %>">
                <%= customer.getName() %> <%= customer.getSurname() %>
            </option>
            <% } %>
        </select>

        <label>Start Date</label>
        <input type="date" name="startDate">

        <label>End Date</label>
        <input type="date" name="endDate">

        <button type="submit">Save</button>
    </form>
</div>

</body>
</html>
