<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.*,com.model.Employee, com.dao.EmployeeDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
<style>
/* Reset & base */
* { margin: 0; padding: 0; box-sizing: border-box; }
body { 
    font-family: 'Poppins', sans-serif; 
    background: #fff4e6;
    min-height: 100vh;
    padding: 20px;
    color: #5c3c00;
    display: flex;
    justify-content: center;
    align-items: center;
}
.container { 
    width: 100%; 
    max-width: 600px; 
    background: white;
    padding: 30px 40px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    gap: 25px;
}
.header {
    text-align: center;
    font-family: 'Poppins', sans-serif;
}
.header h1 {
    font-weight: 800;
    color: #5c3c00;
    margin-bottom: 10px;
}
.back-link {
    display: inline-block;
    color: #f2911b;
    text-decoration: none;
    font-weight: 600;
    margin-bottom: 25px;
    transition: color 0.3s ease;
}
.back-link:hover {
    color: #e87700;
    text-decoration: underline;
}
.form-section {
    display: flex;
    flex-direction: column;
    gap: 15px;
}
h2 {
    color: #5c3c00;
    font-weight: 800;
    margin-bottom: 20px;
}
.form-group {
    margin-bottom: 20px;
}
label { 
    font-weight: 600;
    color: #5c3c00;
    display: block; 
    margin-bottom: 8px;
}
.required::after {
    content: " *";
    color: #e87700;
    margin-left: 2px;
    font-weight: 800;
}
input[type="number"] {
    width: 100%; 
    padding: 12px 15px; 
    font-size: 14px;
    border: 1.8px solid #f2911b;
    border-radius: 6px;
    font-weight: 600;
    color: #5c3c00;
    box-sizing: border-box;
    outline: none;
    transition: 0.3s;
}
input[type="number"]:focus {
    border-color: #e87700;
    box-shadow: 0 0 6px #f2911b;
}
.submit-btn { 
    background-color: #f2911b;
    border: none;
    padding: 15px 30px;
    border-radius: 6px;
    cursor: pointer; 
    font-size: 16px;
    font-weight: 700;
    color: white;
    width: 100%;
    transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(242, 145, 27, 0.25);
}
.submit-btn:hover {
    background-color: #e87700;
    transform: scale(1.05);
    box-shadow: 0 6px 15px rgba(232, 119, 0, 0.35);
}
.error { 
    background: #fed7d7;
    color: #c53030;
    padding: 15px;
    border-radius: 6px;
    border-left: 4px solid #e53e3e;
    margin: 15px 0;
    text-align: center;
    font-weight: 600;
}
.success { 
    background: #c6f6d5;
    color: #276749;
    padding: 15px;
    border-radius: 6px;
    border-left: 4px solid #38a169;
    margin: 15px 0;
    text-align: center;
    font-weight: 600;
}
.info-card {
    background: #fff1e6;
    border: 1px solid #f3b36b;
    border-radius: 10px;
    padding: 20px;
    color: #5c3c00;
    font-family: 'Poppins', sans-serif;
}
.info-card h4 {
    color: #f2911b;
    font-weight: 700;
    margin-bottom: 10px;
}
.info-card p {
    font-size: 14px;
    line-height: 1.5;
}
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Delete Employee</h1>
            <a href="index.jsp" class="back-link">← Back to Home</a>
        </div>
        
        <div class="form-section">
            <h2>Delete Employee</h2>
            
            <%-- Display message if exists --%>
            <%
            String msg = (String) request.getAttribute("message");
            if (msg != null) {
                String msgClass = msg.toLowerCase().contains("success") || msg.toLowerCase().contains("deleted") ? "success" : "error";
            %>
            <div class="<%= msgClass %>"><%= msg %></div>
            <% } %>

            <form method="post" action="DeleteEmployeeServlet">
                <div class="form-group">
                    <label for="empno" class="required">Employee Number</label>
                    <input type="number" id="empno" name="empno" required min="1" placeholder="Enter employee ID to delete">
                </div>

                <input type="submit" value="Delete Employee" class="submit-btn" onclick="return confirm('Are you sure you want to delete this employee?')">
            </form>
        </div>
        
        <div class="info-card">
            <h4>⚠️ Warning</h4>
            <p>• This action cannot be undone<br>
            • Make sure you have the correct Employee ID<br>
            • Employee data will be permanently removed<br>
            • Double-check before confirming deletion</p>
        </div>
    </div>
</body>
</html>
