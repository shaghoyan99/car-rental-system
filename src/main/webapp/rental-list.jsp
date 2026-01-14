<%@ page import="java.util.List" %>
<%@ page import="com.carrental.dto.RentalDetails" %>
<%@ page import="com.carrental.model.enums.RentalStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rentals</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="page-header">
    <button class="btn btn-primary">
        <a href="<%= request.getContextPath() %>/addRental">
            ADD
        </a>
    </button>
</div>

<div class="container">
    <h2>Rentals</h2>

    <table>
        <tr>
            <th>Car Information</th>
            <th>Customer Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Total Cost</th>
            <th>Status</th>
            <th>Change Status</th>
        </tr>

        <%
            List<RentalDetails> rentals = (List<RentalDetails>) request.getAttribute("rentals");
            for (RentalDetails rental : rentals) {
        %>
        <tr>
            <td><%=rental.getCar().getBrand() %><%=rental.getCar().getModel()%>
            </td>
            <td><%=rental.getCustomer().getName()%>
            </td>
            <td><%=rental.getRental().getStartDate()%>
            </td>
            <td><%=rental.getRental().getEndDate()%>
            </td>
            <td><%=rental.getRental().getTotalCost()%>
            </td>
            <td class="status-<%=rental.getRental().getRentalStatus()%>"><%=rental.getRental().getRentalStatus()%>
            </td>

            <td>
                <% if (rental.getRental().getRentalStatus() == RentalStatus.ACTIVE) { %>
                <form method="post" action="/updateRentalStatus">
                    <input type="hidden" name="rentalId" value="<%= rental.getRental().getId() %>">
                    <input type="hidden" name="status" value="CANCELED">
                    <button type="submit">Rent</button>
                </form>
                <% } else { %>
                <form method="post" action="/updateRentalStatus">
                    <input type="hidden" name="rentalId" value="<%= rental.getRental().getId() %>">
                    <input type="hidden" name="status" value="ACTIVE">
                    <button type="submit">Return</button>
                </form>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
