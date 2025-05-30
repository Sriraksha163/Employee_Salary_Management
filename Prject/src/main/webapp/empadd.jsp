<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Employee</title>
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
            width: 420px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            font-weight: 800;
            margin-bottom: 20px;
            color: #5c3c00;
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
        }

        .submit-btn:hover {
            background-color: #e87700;
        }

        .required::after {
            content: "*";
            color: #e87700;
            margin-left: 2px;
            font-weight: 800;
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

        .error, .success {
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Employee</h1>
        <a href="index.jsp" class="back-link">← Back to Home</a>

        <%-- Display error message if exists --%>
        <%
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) {
        %>
        <div class="error"><%= error %></div>
        <%
        }
        %>

        <%-- Display success message if exists --%>
        <%
        String success = (String) request.getAttribute("successMessage");
        String successParam = request.getParameter("success");
        if (success != null || "true".equals(successParam)) {
        %>
        <div class="success">✅ Employee Added Successfully!</div>
        <%
        }
        %>

        <form action="AddEmployeeServlet" method="post">
            <label for="id" class="required">Employee ID</label>
            <input type="number" id="id" name="id" placeholder="Enter unique employee ID" min="1" required>

            <label for="name" class="required">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter employee full name" required>

            <label for="doj" class="required">Date of Joining</label>
            <input type="date" id="doj" name="doj" required>

            <label for="gender" class="required">Gender</label>
            <select id="gender" name="gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="salary" class="required">Monthly Salary</label>
            <input type="number" id="salary" name="salary" step="0.01" placeholder="0.00" min="0" required>

            <input type="submit" value="Add Employee" class="submit-btn">
        </form>
    </div>
</body>
</html>
