<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Employee Reports</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Poppins', sans-serif;
            background: #fff4e6;
            color: #5c3c00;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 30px 15px;
            box-sizing: border-box;
        }

        .header {
            background: #ffdab9;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            width: 90vw;
            max-width: 600px;
            box-shadow: 0 4px 20px rgba(255, 165, 0, 0.2);
            margin-bottom: 30px;
        }

        .header h1 {
            margin: 0 0 20px 0;
            font-size: 2rem;
            font-weight: 800;
            color: #d35400;
        }

        .back-link {
            display: inline-block;
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.2);
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .back-link:hover {
            background: rgba(255,255,255,0.3);
            transform: translateX(-5px);
        }

        .reports-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 90vw;
            max-width: 600px;
            margin-bottom: 25px;
        }

        .reports-section h2 {
            color: #d35400;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 700;
        }

        .report-link {
            display: block;
            background: #d35400;
            color: white;
            text-decoration: none;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
            font-weight: 600;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(211, 84, 0, 0.2);
        }

        .report-link:hover {
            background: #b84300;
            transform: scale(1.03);
            box-shadow: 0 6px 15px rgba(211, 84, 0, 0.35);
        }

        .info-card {
            background: #e8f4f8;
            border: 1px solid #81c784;
            border-radius: 15px;
            padding: 20px;
            width: 90vw;
            max-width: 600px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .info-card h4 {
            color: #2e7d32;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .info-card p {
            color: #2d3748;
            font-size: 14px;
            line-height: 1.6;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Employee Reports</h1>
        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>

    <div class="reports-section">
        <h2>Available Reports</h2>
        <a href="report_form.jsp?action=NameFilter" class="report-link">Employees with Name Starting Letter</a>
        <a href="report_form.jsp?action=ServiceFilter" class="report-link">Employees with N or More Years of Service</a>
        <a href="report_form.jsp?action=SalaryFilter" class="report-link">Employees with Salary Greater Than</a>
    </div>

    <div class="info-card">
        <h4>Report Information</h4>
        <p>
            • Generate filtered employee reports<br>
            • Filter by name, service years, or salary<br>
            • Export-ready report formats<br>
            • Real-time data from database
        </p>
    </div>

</body>
</html>
