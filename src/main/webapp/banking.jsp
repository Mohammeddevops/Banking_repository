<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Banking Application</title>
</head>
<body>
    <h1>Welcome to the Banking Application</h1>
    
    <h2>Account List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Customer Name</th>
                <th>Customer Address</th>
                <th>Contact Number</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${accountList}" var="account">
                <tr>
                    <td>${account.accountNumber}</td>
                    <td>${account.customerName}</td>
                    <td>${account.customerAddress}</td>
                    <td>${account.contactNumber}</td>
                    <td>
                        <a href="/account/viewAccount/${account.accountNumber}">View</a>
                        <a href="/account/updateAccount/${account.accountNumber}">Update</a>
                        <a href="/account/deleteAccount/${account.accountNumber}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Create Account</h2>
    <form action="/account/createAccount" method="post">
        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required><br>

        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" required><br>

        <label for="customerAddress">Customer Address:</label>
        <input type="text" id="customerAddress" name="customerAddress" required><br>

        <label for="contactNumber">Contact Number:</label>
        <input type="text" id="contactNumber" name="contactNumber" required><br>

        <button type="submit">Create Account</button>
    </form>

    <h2>View Account</h2>
    <!-- Add the form for viewing account details here -->
    <!-- You can use the account details retrieved from the controller -->
</body>
</html>
