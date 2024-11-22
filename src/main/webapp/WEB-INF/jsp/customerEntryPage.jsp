<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Entry Page</title>
</head>
<body>
  <div align="center">
  <h1><u>Customer Entry Page</u></h1>
  <h2>
  <form:form action="/customerAdd" method="post" modelAttribute="customerRecord">
            <form:hidden path="username"/>
                <form:hidden path="email"/>
                <form:hidden path="status"/>
  		User Name<form:input path="username" disabled="true" />
  		<br/><br/>
  		Email: <form:input path="email" disabled="true"/>
  		<br/><br/>
  		Enter First Name: <form:input path="firstName" />
  		<br/><br/>
  		Enter Last Name:<form:input path="lastName" />
  		<br/><br/>
  		Enter Address: <form:input path="address" />
  		<br/><br/>
  		Enter Mobile Number: <form:input path="mobile" />
  		<br/><br/>
  		Enter License Number: <form:input path="license" />
  		<br/><br/>
  		Status:<form:input path="status" disabled="false"/>
  		<br/><br/>
  		Enter License Expiry Date: <form:input type="date" placeholder="dd-mm-yyyy" path="expiryDate" />
  		<br/><br/>
  		<button type="submit">Submit</button>
  		<button type="reset">Reset</button>
  </form:form>
  </h2>
  </div>
</body>
</html >