<%@ page import="java.sql.*, java.util.*, java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        html, body {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Poppins', sans-serif;
            background: #fff4e6;
            color: #5c3c00;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 0;
        }

        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 900px;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            font-weight: 800;
            margin-bottom: 30px;
            color: #5c3c00;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-weight: 600;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1.5px solid #f2911b;
            color: #5c3c00;
            font-size: 14px;
        }

        th {
            background-color: #f2911b;
            color: white;
            font-weight: 700;
            border-bottom: none;
        }

        tr:hover {
            background-color: #fff1e6;
            cursor: default;
        }

        .message {
            text-align: center;
            padding: 15px;
            font-size: 16px;
            font-weight: 600;
        }

        .error {
            background: #fed7d7;
            color: #c53030;
            border-left: 4px solid #e53e3e;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-weight: 600;
            text-align: center;
        }

        .back-link {
            display: block;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
            color: #f2911b;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #e87700;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Employee List</h2>
        <a href="index.jsp" class="back-link">← Back to Home</a>

        <%
            // JDBC setup
            String url = "jdbc:mysql://localhost:3306/employeedb";
            String user = "root";
            String pass = "";
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, pass);
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM Employee");

                if (!rs.isBeforeFirst()) {
        %>
                    <div class="message">No employees found.</div>
        <%
                } else {
        %>
                    <table>
                        <thead>
                            <tr>
                                <th>Emp No</th>
                                <th>Name</th>
                                <th>Date of Joining</th>
                                <th>Gender</th>
                                <th>Salary</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            while (rs.next()) {
                        %>
                            <tr>
                                <td><%= rs.getInt("Empno") %></td>
                                <td><%= rs.getString("EmpName") %></td>
                                <td><%= rs.getDate("DoJ") %></td>
                                <td><%= rs.getString("Gender") %></td>
                                <td><%= String.format("%.2f", rs.getDouble("Bsalary")) %></td>
                            </tr>
                        <%
                            } // end while
                        %>
                        </tbody>
                    </table>
        <%
                } // end else
            } catch (Exception e) {
        %>
                <div class="error">Error: <%= e.getMessage() %></div>
        <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        %>
    </div>
</body>
</html>
