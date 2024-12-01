<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make Payment</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        /* Header Styling */
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

        /* Form Container Styling */
        .form-container {
            width: 60%;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        .form-heading {
            font-size: 28px;
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        /* Label and Input Fields */
        .label {
            font-size: 18px;
            margin-bottom: 8px;
            color: #333;
        }

        .input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .input:disabled {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }

        .input::placeholder {
            color: #888;
        }

        /* Payment Details */
        .detail-item {
            font-size: 18px;
            margin-bottom: 12px;
        }

        .detail-value {
            font-weight: bold;
            color: #007BFF;
        }

        .description {
            font-size: 16px;
            color: #555;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        /* Button Styling */
        .submit-button, .reset-button {
            padding: 12px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .submit-button {
            background-color: #28a745;
            color: white;
        }

        .submit-button:hover {
            background-color: #218838;
        }

        .reset-button {
            background-color: #ffc107;
            color: white;
            margin-left: 10px;
        }

        .reset-button:hover {
            background-color: #e0a800;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }

            .form-heading {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="navbar">
                <h1 class="logo">Car Rental System</h1>
                <a href="/index" class="btn" id="home-btn">Home</a>
            </div>
            </div>
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="form-container" id="payment-form-container">
        <h2 class="form-heading">Make Payment</h2>
        <form:form action="/makePayment" method="post" modelAttribute="transaction">
            <p class="detail-item"><strong>Booking ID:</strong> <span class="detail-value">${transaction.bookingId}</span></p>
            <p class="detail-item"><strong>Total Payment:</strong> <span class="detail-value">${totalPayment}</span></p>
            <p class="detail-item"><strong>Pending Payment:</strong> <span class="detail-value">${pendingPayment}</span></p>
            <p class="description"><strong>Make a payment on <span>RoadTripRental@upi</span> using your preferred UPI app and fill the form below!</strong></p>

            <form:hidden path="bookingId"/>
            <form:hidden path="transactionId" />

            <label class="label" for="transactionId">Transaction Id:</label>
            <form:input path="transactionId" id="transactionId" class="input" disabled="true"/>
            <br /><br />

            <label class="label" for="amount">Amount paid:</label>
            <form:input path="amount" id="amount" class="input" placeholder="Enter payment amount"/>
            <br /><br />

            <label class="label" for="paymentRefNo">Payment Reference Number:</label>
            <form:input path="paymentRefNo" id="paymentRefNo" class="input" placeholder="Enter payment reference number" />
            <br /><br />

            <button class="submit-button btn" type="submit">Make Payment</button>
            <button class="reset-button btn" type="reset">Reset</button>
        </form:form>
    </div>
</body>
</html>
