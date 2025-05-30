<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.Employee, com.dao.EmployeeDAO, java.text.*" %>
<html>
<head>
    <title>Update Employee</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        /* Full page with background and font */
        html, body {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Poppins', sans-serif;
            background: #fff4e6;
            color: #5c3c00;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Container box centered */
        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 450px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            font-weight: 800;
            margin-bottom: 20px;
            color: #5c3c00;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            color: #f2911b;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #e87700;
            text-decoration: underline;
        }

        label {
            font-weight: 600;
            font-size: 14px;
            color: #5c3c00;
            display: block;
            margin-bottom: 8px;
        }

        input, select {
            border: 1.8px solid #f2911b;
            border-radius: 6px;
            padding: 12px 15px;
            font-size: 14px;
            width: 100%;
            margin-bottom: 18px;
            font-weight: 600;
            color: #5c3c00;
            box-sizing: border-box;
            outline: none;
            transition: 0.3s;
        }

        input:focus, select:focus {
            border-color: #e87700;
            box-shadow: 0 0 6px #f2911b;
        }

        .submit-btn {
            background-color: #f2911b;
            border: none;
            padding: 14px 20px;
            font-weight: 700;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            color: white;
            width: 100%;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
        .submit-btn:hover {
            background-color: #e87700;
        }

        .reset-btn {
            background-color: #666;
            border: none;
            padding: 14px 20px;
            font-weight: 700;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            color: white;
            width: 100%;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
        .reset-btn:hover {
            background-color: #555;
        }

        .required::after {
            content: "*";
            color: #e87700;
            margin-left: 2px;
            font-weight: 800;
        }

        .error, .success, .info {
            padding: 12px 15px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-weight: 600;
            text-align: center;
        }
        .error {
            background: #fed7d7;
            color: #c53030;
            border-left: 4px solid #e53e3e;
        }
        .success {
            background: #c6f6d5;
            color: #276749;
            border-left: 4px solid #38a169;
        }
        .info {
            background: #dbeefd;
            color: #3178c6;
            border-left: 4px solid #3182ce;
        }

        input:disabled {
            background: #f5f5f5 !important;
            color: #666;
        }

        .info-card {
            background: #e8f4f8;
            border: 1px solid #81c784;
            border-radius: 10px;
            padding: 15px 20px;
            margin-top: 20px;
            color: #2d3748;
            font-size: 14px;
            line-height: 1.4;
        }
        .info-card h4 {
            color: #2e7d32;
            margin-bottom: 10px;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Employee</h1>
        <a href="index.jsp" class="back-link">← Back to Home</a>

        <!-- Search Employee Form -->
        <form method="get">
            <label for="id" class="required">Employee ID</label>
            <input type="number" id="id" name="id" required min="1" placeholder="Enter employee ID to search"
                   value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>">
            <input type="submit" value="Search Employee" class="submit-btn">
        </form>

        <%
        String idParam = request.getParameter("id");
        Employee emp = null;
        boolean found = false;
        String error = "";

        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                int empId = Integer.parseInt(idParam);
                emp = EmployeeDAO.getEmployeeById(empId);
                found = emp != null;
                if (!found) error = "Employee with ID " + empId + " not found!";
            } catch (Exception e) {
                error = "Error: " + e.getMessage();
            }
        }
        %>

        <% if (!error.isEmpty()) { %>
            <div class="error"><%= error %></div>
        <% } %>

        <% 
        String successMessage = (String) request.getAttribute("message");
        String successParam = request.getParameter("success");
        if ((successMessage != null && (successMessage.toLowerCase().contains("success") || successMessage.toLowerCase().contains("updated"))) || "true".equals(successParam)) {
        %>
            <div class="success">✅ Employee Updated Successfully!</div>
        <% } %>

        <% if (found && emp != null) { %>
            <div class="info">
                <strong>Found:</strong> <%= emp.getName() %> (ID: <%= emp.getId() %>)
            </div>

            <!-- Update Employee Form -->
            <form action="UpdateEmployeeServlet" method="post">
                <input type="hidden" name="id" value="<%= emp.getId() %>">

                <label for="emp_id">Employee ID</label>
                <input type="text" id="emp_id" value="<%= emp.getId() %>" disabled>

                <label for="name" class="required">Full Name</label>
                <input type="text" id="name" name="name" required value="<%= emp.getName() %>" placeholder="Enter employee full name">

                <label for="doj" class="required">Date of Joining</label>
                <input type="date" id="doj" name="doj" required value="<%= emp.getDoj() %>">

                <label for="gender" class="required">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="" disabled>Select Gender</option>
                    <option value="Male" <%= "Male".equals(emp.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(emp.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(emp.getGender()) ? "selected" : "" %>>Other</option>
                </select>

                <label for="salary" class="required">Monthly Salary</label>
                <input type="number" id="salary" name="salary" required step="0.01" min="0" value="<%= emp.getSalary() %>" placeholder="0.00">

                <input type="submit" value="Update Employee" class="submit-btn">
                <input type="reset" value="Reset Form" class="reset-btn">
            </form>
        <% } %>

        <div class="info-card">
            <h4>Guidelines</h4>
            <p>• Search for employee by ID first<br>
               • All fields marked with * are required<br>
               • Changes will be saved permanently<br>
               • Employee ID cannot be changed
            </p>
        </div>
    </div>
</body>
</html>
