<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Application</title>
    <style>
        /* Reset some default styles */
        body, h1, h2, p {
            margin: 0;
            padding: 0;
        }

        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
        }

        /* Header Styles */
        header {
            background-color: #0044cc;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        header h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        /* Container Styles */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Button Styles */
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0044cc;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-right: 10px;
        }

        .button:hover {
            background-color: #002b88;
        }

        /* Account Card Styles */
        .account-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .account-card h3 {
            font-size: 24px;
            color: #0044cc;
        }

        .account-card p {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Banking Application</h1>
        <p>Welcome to our online banking portal</p>
    </header>

    <div class="container">
        <h2>Account List</h2>

        <!-- Sample Account Cards (Replace with dynamic data) -->
        <div class="account-card">
            <h3>John Doe</h3>
            <p>Account Number: 1001</p>
            <p>Customer Address: 123 Main St</p>
            <p>Contact Number: 555-1234</p>
            <a class="button" href="#">View Details</a>
        </div>

        <div class="account-card">
            <h3>Jane Smith</h3>
            <p>Account Number: 1002</p>
            <p>Customer Address: 456 Elm St</p>
            <p>Contact Number: 555-5678</p>
            <a class="button" href="#">View Details</a>
        </div>

        <!-- Repeat account cards for each account -->

        <a class="button" href="#">Create New Account</a>
    </div>
</body>
</html>
