<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Employee" %>

<%
    String action = request.getParameter("action");
    Object obj = session.getAttribute("filteredEmployees");
    List<Employee> employees = null;
    if (obj != null && obj instanceof List<?>) {
        employees = (List<Employee>) obj;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= (employees == null || employees.isEmpty()) ? "No Data Found" : "Report Results" %></title>
    <style>
        /* Put your common CSS here or separated for each case */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fff4e6;
            color: #5c3c00;
            text-align: center;
            padding: 50px 20px;
            margin: 0;
        }
        .message-box, .container {
            background: #ffdab9;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(255, 165, 0, 0.3);
            max-width: 900px;
            margin: auto;
            text-align: left;
        }
        .message-box h3 {
            margin: 0 0 20px 0;
            text-align: center;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            background: #d35400;
            color: #fff;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 600;
            text-decoration: none;
            transition: background 0.3s, transform 0.2s;
        }
        .back-link:hover {
            background: #b84300;
            transform: translateY(-2px);
        }
        /* Add table styles only if needed */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff7f0;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(255, 165, 0, 0.15);
        }
        th {
            background-color: #d35400;
            color: white;
            font-weight: 600;
            padding: 14px;
            text-align: left;
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #ffe5cc;
        }
        tr:nth-child(even) {
            background-color: #fff0e0;
        }
        tr:hover {
            background-color: #ffefdb;
            transition: background-color 0.3s;
        }
    </style>
</head>
<body>
<%
    if (employees == null || employees.isEmpty()) {
%>
    <div class="message-box">
        <h3>No data found. Please generate a report first.</h3>
        <a href="reports.jsp" class="back-link">← Back to Reports</a>
    </div>
<%
    } else {
%>
    <div class="container">
        <h2 style="text-align:center; color:#d35400; margin-bottom:20px; font-weight:800; border-bottom: 3px solid #d35400; padding-bottom:10px;">
            Report Results
        </h2>

        <p style="font-size:16px; background-color:#ffe5cc; padding:12px; border-left:4px solid #d35400; border-radius:6px; margin:20px 0; font-weight:500;">
            Filter Type: <b><%= (action != null) ? action : "N/A" %></b>
        </p>

        <table>
            <tr>
                <th>Emp No</th>
                <th>Name</th>
                <th>Date of Joining</th>
                <th>Gender</th>
                <th>Salary</th>
            </tr>
            <%
                for (Employee e : employees) {
            %>
            <tr>
                <td><%= e.getId() %></td>
                <td><%= e.getName() %></td>
                <td><%= e.getDoj() %></td>
                <td><%= e.getGender() %></td>
                <td><%= e.getSalary() %></td>
            </tr>
            <%
                }
            %>
        </table>

        <a href="report_form.jsp?action=<%= action %>" class="back-link">&#8592; Back to Filter</a>
    </div>
<%
    }
%>
</body>
</html>
