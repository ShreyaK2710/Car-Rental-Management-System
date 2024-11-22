<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Variant Entry Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #d4d4d4, #999999, #666666);
            height: 100vh; /* Full viewport height */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden; /* Prevent scrolling */
        }
        .container {
            width: 40%; /* Adjust box size */
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.85); /* Transparent white */
            border-radius: 15px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
            border: 1px solid #ccc;
        }
        h1 {
            color: #444;
            font-size: 2em;
            margin-bottom: 20px;
            text-decoration: underline;
        }
        h2 {
            color: #333;
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        form label {
            width: 100%;
            font-size: 1.1em;
            margin-bottom: 10px;
            color: #555;
        }
        form input {
            padding: 10px;
            width: 100%;
            border-radius: 8px;
            border: 1px solid #aaa;
            margin-bottom: 15px;
            box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 1em;
        }
        form button {
            padding: 12px 30px;
            margin: 10px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 45%;
        }
        form button:hover {
            background-color: #004d99;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        form button[type="reset"] {
            background-color: #777;
        }
        form button[type="reset"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Car Variant Entry Page</h1>
        <h2>
            <form:form action="/variantAdd" method="post" modelAttribute="variantRecord">
                <form:hidden path="variantId"/>
                <label>Variant Id: <form:input path="variantId" disabled="true"/></label>
                <label>Enter Variant Name: <form:input path="variantName"/></label>
                <label>Enter Number of Seats: <form:input path="numberOfSeat"/></label>
                <label>Enter Type of Fuel: <form:input path="fuel"/></label>
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </form:form>
        </h2>
    </div>
</body>
</html>
