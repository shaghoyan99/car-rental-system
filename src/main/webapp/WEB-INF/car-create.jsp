<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New vehicle — Carly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<jsp:include page="header.jsp"/>

<section id="content" class="cly-form-card">
    <h2>Add vehicle</h2>
    <form id="carForm" method="post" action="/addCar" role="form" aria-label="Add vehicle form" class="cly-form">
        <fieldset>
            <legend class="cly-sr-only">Car details</legend>

            <div class="cly-form-group">
                <label class="cly-label">Brand
                    <input class="cly-input" type="text" name="brand" required>
                </label>
            </div>

            <div class="cly-form-group">
                <label class="cly-label">Model
                    <input class="cly-input" type="text" name="model" required>
                </label>
            </div>

            <div class="cly-form-row">
                <div class="cly-form-group">
                    <label class="cly-label">Year
                        <input class="cly-input" type="number" name="year" min="1900" required>
                    </label>
                </div>

                <div class="cly-form-group">
                    <label class="cly-label">Daily Rate
                        <input class="cly-input" type="number" name="daily" step="0.01" min="0" required>
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
