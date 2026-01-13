<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Car Create</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container">
    <h2>Add New Car</h2>
    <form method="post" action="/addCar">
        <label>Brand</label>
        <input type="text" name="brand" required>

        <label>Model</label>
        <input type="text" name="model" required>

        <label>Year</label>
        <input type="number" name="year" required>

        <label>Daily Rate</label>
        <input type="number" step="0.01" name="daily" required>

        <button type="submit">Save</button>
    </form>
</div>
</body>
</html>
