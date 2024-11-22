<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    </head>
<body>
    <div align="center">
        <h1><u>Car Report</u></h1>
        <br/>
        <h2>
        <table border="2">
            <tr>
                <th>Car Number</th>
                <th>Car Name</th>
                <th>Car Color</th>
                <th>Manufacturer</th>
                <th>MFG Year</th>
                <th>Variant Details</th>
                <th>Rent/Hour</th>
                <th>Available</th>
                <th>Deletion</th>
                <th>Updation</th>
            </tr>
            
            <c:forEach items="${carList}" var="car">
                <tr>
                    <td>${car.carNumber}</td>
                    <td>${car.carName}</td>
                    <td>${car.carColor}</td>
                    <td>${car.manufacturer}</td>
                    <td>${car.yearOfMfg}</td>
                    <td>
                    <table>
                    <c:forEach items="${carMap}" var="cmp">
                    <c:if test="${car.variantId==cmp.key}">
                    <tr>
                    <td>Variant Name:</td>
                    <td>${cmp.value.variantName}</td>
                    </tr>
                    <tr>
                    <td>Number of Seats:</td>
                    <td>${cmp.value.numberOfSeat}</td>
                    </tr>
                    <tr>
                    <td>Fuel:</td>
                    <td>${cmp.value.fuel}</td>
                    </tr>
                    </c:if>
                    </c:forEach>
                    </table>
                    </h3>
                    </td>
                    <td>${car.rentRate}</td>
                    <td>${car.available}</td>
                    <td><a href="carDeletion/${car.carNumber}">Car Deletion</a></td>
                    <td><a href="carUpdate/${car.carNumber}">Car Update</a></td>
            </c:forEach>
            </table>
            </h2>
            <br/>
    </div>
</body>
</html>