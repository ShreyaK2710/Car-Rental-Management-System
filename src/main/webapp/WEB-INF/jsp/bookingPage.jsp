<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Booking</title>
</head>
<body>
    <header>
        <style>
            .header-content {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 30px;
                background-color: #333;
                color: white;
            }

            .navbar {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
            }

            .btn, .logout-btn {
                text-decoration: none;
                padding: 10px 15px;
                background-color: #007BFF;
                color: white;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn:hover, .logout-btn:hover {
                background-color: #0056b3;
            }
        </style>
        <div class="header-content">
            <div class="navbar">
                <h1 class="logo">Car Rental System</h1>
                <a href="/index" class="btn" id="home-btn">Home</a>
            </div>
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="form-container">
        <style>
            .form-container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
            }

            .form-heading {
                text-align: center;
                font-size: 24px;
                margin-bottom: 20px;
                color: #333;
            }

            .label {
                display: block;
                font-size: 16px;
                margin-bottom: 8px;
                color: #555;
            }

            .input {
                width: 100%;
                padding: 10px;
                font-size: 14px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            .input:focus {
                border-color: #007BFF;
                outline: none;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

            .submit-button {
                width: 100%;
                padding: 12px;
                font-size: 16px;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .submit-button:hover {
                background-color: #0056b3;
            }
        </style>
        <h2 class="form-heading">New Booking</h2>

		<form:form action="/createBooking" method="post" modelAttribute="carBooking">
		           <label class="label" for="bookingId">Booking Id:</label>
		           <form:input path="bookingId" id="bookingId" class="input" placeholder="Booking ID" />

		           <label class="label" for="carNumber">Car Number:</label>
		           <form:input path="carNumber" id="carNumber" class="input" placeholder="Car Number" />

		           <label class="label" for="username">Username:</label>
		           <form:input path="username" id="username" class="input" placeholder="Username" />

		           <label class="label" for="rentRate">Rent Rate (per day):</label>
		           <input type="text" id="rentRate" value="${rentRate}" disabled="true" class="input" />

		           <!-- Native HTML Date Picker -->
		           <label class="label" for="fromDate">Enter From Date:</label>
		           <form:input path="fromDate" id="fromDate" class="input" type="date" />

		           <label class="label" for="toDate">Enter To Date:</label>
		           <form:input path="toDate" id="toDate" class="input" type="date" />

		           <button class="submit-button btn" type="submit">Proceed to Payment</button>
		       </form:form>
    </div>
</body>
</html>
