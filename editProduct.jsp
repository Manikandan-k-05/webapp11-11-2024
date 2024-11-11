<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dao.UserRegistrationDAO" %>
<%@ page import="bean.RegisterBean" %>

<%
    String email = (String) session.getAttribute("userEmail");
    if (email == null) {
        response.sendRedirect("log.jsp");
        return;
    }

    // Retrieve product details (assuming 'productId' is passed as a parameter)
    int productId = Integer.parseInt(request.getParameter("productId"));
    ProductDAO productDAO = new ProductDAO();
    ProductBean product = productDAO.getProductById(productId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <a class="navbar-brand text-danger" href="#">Sports World</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link text-danger" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="profile.jsp">Profile</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="cart.jsp">Cart</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Edit Product Form Section -->
    <div class="container my-5">
        <h2 class="text-center text-danger mb-4">Edit Product</h2>
        <form action="UpdateProductServlet" method="post" class="needs-validation" novalidate enctype="multipart/form-data">
            <input type="hidden" name="productId" value="<%= product.getId() %>">
            
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" class="form-control" id="productName" name="productName" value="<%= product.getName() %>" required>
                <div class="invalid-feedback">Please enter the product name.</div>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" required><%= product.getDescription() %></textarea>
                <div class="invalid-feedback">Please enter a description.</div>
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required>
                <div class="invalid-feedback">Please enter the product price.</div>
            </div>

            <div class="form-group">
                <label for="status">Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="Available" <%= product.getStatus().equals("Available") ? "selected" : "" %>>Available</option>
                    <option value="Out of Stock" <%= product.getStatus().equals("Out of Stock") ? "selected" : "" %>>Out of Stock</option>
                </select>
                <div class="invalid-feedback">Please select a status.</div>
            </div>

            <div class="form-group">
                <label for="image">Product Image</label>
                <input type="file" class="form-control-file" id="image" name="image">
                <small class="form-text text-muted">Leave blank if you don't want to update the image.</small>
            </div>

            <button type="submit" class="btn btn-danger btn-block">Update Product</button>
        </form>
    </div>

    <!-- Footer -->
    <footer class="bg-danger text-white text-center py-3">
        <p>&copy; 2024 Sports World. All Rights Reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Form Validation Script -->
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>

</body>
</html>
 --%>