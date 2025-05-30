<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Employee Salary Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
            margin: 0 0 30px 0;
            font-size: 2rem;
            font-weight: 800;
            color: #d35400;
        }

        .nav-row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .nav-card {
            background: #d35400; /* matches heading color */
            border-radius: 10px;
            width: 120px;
            height: 70px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff;
            font-weight: 600;
            font-size: 1rem;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(211, 84, 0, 0.25); /* matched shadow */
        }

        .nav-card:hover {
            background: #b84300; /* darker tone on hover */
            box-shadow: 0 6px 15px rgba(211, 84, 0, 0.35);
            transform: scale(1.05);
        }

        .loading-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 220, 180, 0.8);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .loading-content {
            background: #fff0e0;
            padding: 30px 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(255, 165, 0, 0.3);
            color: #a84300;
            font-weight: 600;
        }

        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid #fff4e6;
            border-top: 4px solid #ff9933;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 15px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        @media (max-width: 600px) {
            .nav-card {
                width: 45vw;
                max-width: 130px;
                height: 65px;
                font-size: 0.95rem;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
</head>
<body>

<div class="header">
    <h1>Employee Salary Management System</h1>
    <div class="nav-row">
        <a href="empadd.jsp" class="nav-card">Add</a>
        <a href="empupdate.jsp" class="nav-card">Update</a>
        <a href="empdelete.jsp" class="nav-card">Delete</a>
        <a href="empdisplay.jsp" class="nav-card">View</a>
        <a href="reports.jsp" class="nav-card">Reports</a>
    </div>
</div>

<div class="loading-overlay" id="loadingOverlay">
    <div class="loading-content">
        <div class="spinner"></div>
        <p>Loading, please wait...</p>
    </div>
</div>

<script>
    document.querySelectorAll('.nav-card').forEach(card => {
        card.addEventListener('click', () => {
            document.getElementById('loadingOverlay').style.display = 'flex';
        });
    });
</script>

</body>
</html>
