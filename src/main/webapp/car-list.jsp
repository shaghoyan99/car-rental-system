<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Car" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cars</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container">
    <h2>Cars</h2>
    <a href="/addCar">Add Car</a>

    <table>
        <tr>
            <th>Brand</th>
            <th>Model</th>
            <th>Year</th>
            <th>Daily Rate</th>
            <th>Status</th>
        </tr>

        <%
            List<Car> allCars = (List<Car>) request.getAttribute("allCars");
            for (Car car : allCars) {
        %>
        <tr>
            <td><%= car.getBrand()%>
            </td>
            <td><%= car.getModel()%>
            </td>
            <td><%= car.getYear()%>
            </td>
            <td><%= car.getDailyRate()%>
            </td>
            <td class="status-<%= car.getStatus()%>">
                <%= car.getStatus()%>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
