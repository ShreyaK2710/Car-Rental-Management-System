<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function passwordCheck(){
	var pass1=(document.getElementById("pass1").value).toString();
    var pass2=(document.getElementById("pass2").value).toString();
    if(pass1.length<5 || pass1.length>10){
    	alert("Password must be between 5 to 10 character long");
    	return;
    }
	 if(pass1===pass2)
		 document.getElementById("registrationForm").submit();
	 /*else if(pass1.length<5 || pass1.length>10)
		  alert("Password must be between 5 to 10 character long");*/
	 else
		  alert("Passwords are not matched");
}
</script>
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>
<form:form id="registrationForm" method="post" action="/register" modelAttribute="userRecord">
<br/><br/>
  Enter User Id:<form:input path="username"/>
<br/><br/>
  Enter Password:<form:input type="password" path="password" id="pass1"/>
<br/><br/>
  Re-type Password:<input type="password" id="pass2"/>
<br/><br/>
  Enter email:<form:input path="email"/>
<br/><br/>
  Select User Type:<form:input list="types" name="type" id="type" path="role"/>
<datalist id="types">
<option value="Customer">
<option value="Admin">
</datalist>
<br/><br/>
<button type="button" onclick="passwordCheck();">Submit</button>
<button type="reset">Reset</button>
</form:form>
</h2>
</div>
</body>
</html>