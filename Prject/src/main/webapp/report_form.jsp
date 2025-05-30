<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String action = request.getParameter("action");
String actionTitle = "";
if ("NameFilter".equals(action)) {
    actionTitle = "Filter by Name Starting Letter";
} else if ("ServiceFilter".equals(action)) {
    actionTitle = "Filter by Years of Service";
} else if ("SalaryFilter".equals(action)) {
    actionTitle = "Filter by Minimum Salary";
}
%>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= actionTitle %> - Report Filter</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        html, body {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Poppins', sans-serif;
            background: #fff4e6;
            color: #5c3c00;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 480px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .header {
            background: #f2911b;
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            font-weight: 800;
            font-size: 1.5rem;
        }

        .back-link {
            color: #f2911b;
            text-decoration: none;
            font-weight: 600;
            text-align: center;
            margin-top: 10px;
            display: block;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #e87700;
            text-decoration: underline;
        }

        h2 {
            margin-bottom: 15px;
            font-weight: 700;
            color: #5c3c00;
            text-align: center;
        }

        label {
            font-weight: 600;
            font-size: 14px;
            color: #5c3c00;
            display: block;
            margin-bottom: 6px;
        }
        .required::after {
            content: "*";
            color: #e87700;
            margin-left: 3px;
            font-weight: 800;
        }

        input[type="text"],
        input[type="number"] {
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
        input[type="text"]:focus,
        input[type="number"]:focus {
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

        .info-card {
            background: #e8f4f8;
            border: 1px solid #81c784;
            border-radius: 10px;
            padding: 20px;
            color: #2d3748;
            font-size: 14px;
            line-height: 1.5;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="header"><%= actionTitle %></div>
        <a href="reports.jsp" class="back-link">← Back to Reports</a>

        <h2>Generate Report</h2>
        <form action="ReportServlet" method="get" novalidate>
            <input type="hidden" name="action" value="<%= action %>" />

            <% if ("NameFilter".equals(action)) { %>
            <label for="startsWith" class="required">Enter Starting Letter</label>
            <input type="text" id="startsWith" name="startsWith" required maxlength="1" pattern="[A-Za-z]"
                placeholder="Enter a single letter (e.g., A)" oninput="this.value = this.value.toUpperCase();">
            <% } else if ("ServiceFilter".equals(action)) { %>
            <label for="years" class="required">Enter Minimum Years of Service</label>
            <input type="number" id="years" name="years" required min="0" placeholder="Enter minimum years (e.g., 5)">
            <% } else if ("SalaryFilter".equals(action)) { %>
            <label for="salary" class="required">Enter Minimum Salary</label>
            <input type="number" id="salary" name="salary" required step="0.01" min="0"
                placeholder="Enter minimum salary (e.g., 50000.00)">
            <% } %>

            <input type="submit" value="Generate Report" class="submit-btn">
        </form>

        <div class="info-card">
            <h4>Filter Guidelines</h4>
            <p>
                <% if ("NameFilter".equals(action)) { %>
                    • Enter a single letter (A-Z)<br>
                    • Case insensitive search<br>
                    • Shows employees whose name starts with the letter<br>
                    • Example: Enter 'J' to find John, Jane, etc.
                <% } else if ("ServiceFilter".equals(action)) { %>
                    • Enter number of years (0 or greater)<br>
                    • Shows employees with equal or more service years<br>
                    • Based on date of joining<br>
                    • Example: Enter '5' for 5+ years of service
                <% } else if ("SalaryFilter".equals(action)) { %>
                    • Enter minimum salary amount<br>
                    • Shows employees earning equal or more<br>
                    • Use decimal format for precision<br>
                    • Example: Enter '50000' for ₹50,000 and above
                <% } else { %>
                    Please select a valid filter option.
                <% } %>
            </p>
        </div>
    </div>
</body>
</html>
