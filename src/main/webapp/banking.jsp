<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Banking Application</title>
</head>
<body>
    <form action="/account/createAccount" id="accountForm" method="POST">
        <br>
        Enter account number: <input type="text" name="accountNumber" size="20">
        <br>
        Enter customer name: <input type="text" name="customerName" size="20">
        <br>
        Enter customer address: <input type="text" name="customerAddress" size="50">
        <br>
        Enter contact number: <input type="text" name="contactNumber" size="50">
        
        <table>
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Customer Name</th>
                    <th>Customer Address</th>
                    <th>Contact Number</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${accountList}" var="account">
                    <tr>
                        <td>${account.accountNumber}</td>
                        <td>${account.customerName}</td>
                        <td>${account.customerAddress}</td>
                        <td>${account.contactNumber}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <input type="submit" value="Create Account" />
        <input type="button" value="Update Account" onclick="updateAccount()" />
        <input type="button" value="Delete Account" onclick="deleteAccount()" />
    </form>

    <script>
        function updateAccount() {
            var form = document.getElementById("accountForm");
            form.action = "/account/updateAccount";
            form.method = "POST";
            form.submit();
        }

        function deleteAccount() {
            var form = document.getElementById("accountForm");
            form.action = "/account/deleteAccount";
            form.method = "POST";
            form.submit();
        }
    </script>
</body>
</html>
