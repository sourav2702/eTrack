<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Monthly Expense Report</title>
</head>
<body>
    <h1>Monthly Expense Report</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Purchase Date</th>
        </tr>
        <c:forEach var="expense" items="${expenses}">
            <tr>
                <td>${expense.id}</td>
                <td>${expense.productName}</td>
                <td>${expense.price}</td>
                <td>${expense.purchaseDate}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="view-expenses.jsp">Back to Expenses</a>
</body>
</html>
