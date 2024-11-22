<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Report</title>
</head>
<body>
    <div align="center">
        <h1><u>Customer Report</u></h1>
        <br/>
        <h2>
        <table border="2">
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>License</th>
                <th>Expiry Date</th>
                <th>Mobile</th>
                <th>Status</th>
                <th>Deletion</th>
                <th>Updation</th>
            </tr>
            
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.username}</td>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.address}</td>
                    <td>${customer.email}</td>
                    <td>${customer.license}</td>
                    <td>${customer.expiryDate}</td>
                    <td>${customer.mobile}</td>
                    <td>${customer.status}</td>
                    <td><a href="customerDelete/${customer.username}">Delete</a></td>
                    <td><a href="customerUpdate/${customer.username}">Update</a></td>
                </tr>
            </c:forEach>
        </table>
        </h2>
        <br/>
    </div>
</body>
</html>