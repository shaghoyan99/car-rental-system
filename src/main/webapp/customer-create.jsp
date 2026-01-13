<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container">
    <h2>Add New Customer</h2>

    <form method="POST" action="/addCustomer">
        <label>Name</label>
        <input type="text" name="name">

        <label>Surname</label>
        <input type="text" name="surname">

        <label>License Number</label>
        <input type="text" name="license_number">

        <label>Email</label>
        <input type="email" name="email">

        <label>Phone</label>
        <input type="text" name="phone">

        <button type="submit">Save</button>
    </form>
</div>
</body>
</html>
