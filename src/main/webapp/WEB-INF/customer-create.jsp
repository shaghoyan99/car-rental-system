<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New client — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<section id="content" class="cly-form-card cly-small">
    <h2>Add client</h2>
    <form id="customerForm" method="POST" action="/addCustomer" role="form" aria-label="Add client form" class="cly-form">
        <fieldset>
            <legend class="cly-sr-only">Customer details</legend>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Name
                        <input class="cly-input" type="text" name="name" required>
                    </label>
                </div>

                <div class="cly-form-group">
                    <label class="cly-label">Surname
                        <input class="cly-input" type="text" name="surname" required>
                    </label>
                </div>
            </div>

            <div class="cly-form-group">
                <label class="cly-label">License Number
                    <input class="cly-input" type="text" name="license_number" required>
                </label>
            </div>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Email
                        <input class="cly-input" type="email" name="email" required>
                    </label>
                </div>

                <div class="cly-form-group">
                    <label class="cly-label">Phone
                        <input class="cly-input" type="text" name="phone" required>
                    </label>
                </div>
            </div>

            <div class="cly-form-actions">
                <button class="cly-btn-primary" type="submit">Create</button>
            </div>
        </fieldset>
    </form>
</section>

</body>
</html>
