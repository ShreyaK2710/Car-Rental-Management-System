<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h1><u>Car Variant Report</u></h1>
<br/>
<h2>
<table border="2">
<tr>
<th> Variant Id</th>
<th> Variant Name</th>
<th> Number of Seat</th>
<th> Fuel Usage</th>
</tr>
<c:forEach items="${variantList}" var="variant">
<tr>
<td>${variant.variantId}</td>
<td>${variant.variantName}</td>
<td>${variant.numberOfSeat}</td>
<td>${variant.fuel}</td>
<td><a href="/variantDeletion/${variant.variantId}">Variant Deletion</a></td>
</tr>
</c:forEach>
</table></h2>
<br/>
<h3><a href="/index">Return</a></h3>
</div>
</body>
</html>