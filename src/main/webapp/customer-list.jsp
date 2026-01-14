<%@ page import="java.util.List" %>
<%@ page import="com.carrental.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customers</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>


<div class="page-header">
    <button class="btn btn-primary">
        <a href="<%= request.getContextPath() %>/addCar">
            ADD
        </a>
    </button>
</div>

<div class="container">
    <h2>Customers</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Surname</th>
            <th>License Number</th>
            <th>Phone</th>
            <th>Email</th>
        </tr>

        <%
            List<Customer> customers = (List<Customer>) request.getAttribute("customers");
            for (Customer customer : customers) {
        %>
        <tr>
            <td><%=customer.getName()%>
            </td>
            <td><%=customer.getSurname()%>
            </td>
            <td><%=customer.getLicenseNumber()%>
            </td>
            <td><%=customer.getPhone()%>
            </td>
            <td><%=customer.getEmail()%>
            </td>
        </tr>

        <% } %>
    </table>

</div>
</body>
</html>
