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
    <h1 color="#fff"><u>Car Report</u></h1>
    <br/>
    <h2 color="#fff">Car Details</h2>
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
              <c:forEach items="${variantMap}" var="cmp">
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
          </td>
          <td>${car.rentRate}</td>
          <td>${car.available}</td>
          <td><a href="carBooking/${car.carNumber}" style="color: blue; text-decoration: underline;">Car Booking</a></td>
        </tr>
      </c:forEach>
    </table>
    <h3 color="#fff"><a href="/index">Return</a></h3>
  </div>
</body>
</html>