<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Update Page</title>
</head>
<body>
<div align ="center">
    <h1><u>Customer Update Page</u></h1>
    <form:form action="/customerUpdate" method="post" modelAttribute="customerRecord">
    	<form:hidden path="username"/>
    	<form:hidden path="email"/>
    	<form:hidden path="status" />
    	<form:hidden path="firstName" />
    	<form:hidden path="mobile" />
    	<form:hidden path="license" />
        User Name:<form:input path="username"  disabled="true"/>
        <br/><br/>

        Email:<form:input path="email"  disabled="true"/>
        <br/><br/>
        

        First Name:<form:input path="firstName"  disabled="true"/>
        <br/><br/>
        

        Update Last Name:<form:input path="lastName" />
        <br/><br/>
       

        Update Address:<form:input path="address"/>
        <br/><br/>
        
        
        Mobile Number:<form:input path="mobile" disabled="true" />
        <br/><br/>
        
        
        License Number:<form:input path="license" disabled="true"/>
        <br/><br/>
        
        
        Update License Expiry Date:<form:input type="date" placeholder="dd-mm-yy" path="expiryDate" />
        <br/><br/>
        
        Status:<form:input path="status" disabled="true"/>
        
        <div class="button-container">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        
       </form:form> 
       
       
</body>
</html>