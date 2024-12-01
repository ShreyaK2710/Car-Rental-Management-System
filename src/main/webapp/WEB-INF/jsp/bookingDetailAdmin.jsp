<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <style>
        /* General Reset */
        body, h1, h2, h3, p, a {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            text-decoration: none;
            box-sizing: border-box;
        }

        /* Header */
        header {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar {
            display: flex;
            gap: 15px;
        }

        .btn, .logout-btn {
            color: white;
            background-color: #555;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: 0.3s ease;
        }

        .btn:hover, .logout-btn:hover {
            background-color: #777;
        }

        /* Booking Container */
        .booking-detail-container {
            padding: 20px;
            background-color: #f9f9f9;
        }

        .booking-heading {
            text-align: center;
            font-size: 28px;
            color: #444;
            margin-bottom: 20px;
        }

        /* Sections */
        .booking-main-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .section {
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .section:last-child {
            border-bottom: none;
        }

        .section-heading {
            font-size: 22px;
            color: #333;
            margin-bottom: 10px;
        }

        /* Details */
        .detail-item {
            margin: 5px 0;
            font-size: 16px;
        }

        .detail-value {
            color: #555;
            font-weight: bold;
        }

        /* Status Colors */
        #confirmed {
            color: green;
            font-weight: bold;
        }

        #pending {
            color: orange;
            font-weight: bold;
        }

        #cancelled {
            color: red;
            font-weight: bold;
        }

        #returned {
            color: blue;
            font-weight: bold;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 10px;
            }

            .booking-main-container {
                padding: 15px;
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
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="booking-detail-container">
        <h3 class="booking-heading">Booking Report</h3>
        <div class="booking-main-container">
            <div class="section booking-details" id="bk-section">
                <h2 class="section-heading">Booking Information:</h2>
                <p class="detail-item" id="bk-detail-item"><strong>Booking ID:</strong> <span class="detail-value">${booking.bookingId}</span></p>
                <p class="detail-item" id="bk-detail-item"><strong>Start Date:</strong> <span class="detail-value">${booking.fromDate}</span></p>
                <p class="detail-item" id="bk-detail-item"><strong>End Date:</strong> <span class="detail-value">${booking.toDate}</span></p>
                <p class="detail-item" id="bk-detail-item"><strong>Status:</strong>
                    <span class="detail-value">
                        <c:choose>
                            <c:when test="${booking.status == 'CNF'}"><span id="confirmed">Confirmed</span></c:when>
                            <c:when test="${booking.status == 'P'}"><span id="pending">Pending</span></c:when>
                            <c:when test="${booking.status == 'C'}"><span id="cancelled">Cancelled</span></c:when>
                            <c:when test="${booking.status == 'R'}"><span id="returned">Returned</span></c:when>
                            <c:otherwise>Unknown Status</c:otherwise>
                        </c:choose>
                    </span>
                </p>
            </div>

            <div class="section car-details" id="bk-section">
                <h2 class="section-heading">Car Details:</h2>
                <p class="detail-item"><strong>Car Number:</strong> <span class="detail-value">${car.carNumber}</span></p>
                <p class="detail-item"><strong>Car Name:</strong> <span class="detail-value">${car.carName}</span></p>
                <p class="detail-item"><strong>Car Color:</strong> <span class="detail-value">${car.carColor}</span></p>
                <p class="detail-item"><strong>Manufacturer:</strong> <span class="detail-value">${car.manufacturer}</span></p>
                <p class="detail-item"><strong>Rent Rate (per day):</strong> <span class="detail-value">₹${car.rentRate}</span></p>
                <p class="detail-item"><strong>Variant Name:</strong> <span class="detail-value">${variant.variantName}</span></p>
                <p class="detail-item"><strong>Number of Seats:</strong> <span class="detail-value">${variant.numberOfSeat}</span></p>
                <p class="detail-item"><strong>Fuel Type:</strong> <span class="detail-value">${variant.fuel}</span></p>
            </div>

            <div class="section payment-info" id="bk-section">
                <h2 class="section-heading">Payment Information:</h2>
                <p class="detail-item" id="bk-detail-item"><strong>Total Payment:</strong> <span class="detail-value">₹${booking.totalPayment}</span></p>
                <p class="detail-item"><strong>Advance Payments:</strong> <span class="detail-value">₹${booking.advancePayment}</span></p>
                <p class="detail-item"><strong>Pending Payments:</strong> <span class="detail-value">₹${booking.pendingPayment}</span></p>
            </div>
        </div>
    </div>
</body>
</html>
