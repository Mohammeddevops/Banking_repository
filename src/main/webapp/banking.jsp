<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account List</title>
</head>
<body>
    <h1>Account List</h1>
    
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
                        <a href="<c:url value='/account/viewAccount/${account.accountNumber}'/>">View</a>
                        <a href="<c:url value='/account/updateAccount/${account.accountNumber}'/>">Edit</a>
                        <a href="<c:url value='/account/deleteAccount/${account.accountNumber}'/>">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <br>
    <a href="<c:url value='/account/createAccount'/>">Create New Account</a>
</body>
</html>
