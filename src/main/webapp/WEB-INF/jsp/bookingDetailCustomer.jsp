<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <style>
        /* Header Styles */
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

        .btn, .logout-btn, .myaccount-btn {
            text-decoration: none;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover, .logout-btn:hover, .myaccount-btn:hover {
            background-color: #0056b3;
        }

        /* Container Styles */
        .booking-detail-container {
            padding: 20px 40px;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .booking-heading {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        .booking-main-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .section {
            flex: 1;
            min-width: 300px;
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .section-heading {
            font-size: 20px;
            margin-bottom: 10px;
            color: #007BFF;
        }

        .detail-item {
            margin: 8px 0;
            font-size: 16px;
        }

        .detail-value {
            color: #555;
        }

        /* Action Links Styles */
        .action-links {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
        }

        .action-link {
            text-decoration: none;
            font-weight: bold;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .action-link:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .action-links {
                flex-direction: column;
                align-items: center;
                gap: 10px;
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
                <p class="detail-item"><strong>Booking ID:</strong> <span class="detail-value">${booking.bookingId}</span></p>
                <p class="detail-item"><strong>Start Date:</strong> <span class="detail-value">${booking.fromDate}</span></p>
                <p class="detail-item"><strong>End Date:</strong> <span class="detail-value">${booking.toDate}</span></p>
                <p class="detail-item"><strong>Status:</strong>
                    <span class="detail-value">
                        <c:choose>
                            <c:when test="${booking.status == 'CNF'}"><span style="color: green;">Confirmed</span></c:when>
                            <c:when test="${booking.status == 'P'}"><span style="color: orange;">Pending</span></c:when>
                            <c:when test="${booking.status == 'C'}"><span style="color: red;">Cancelled</span></c:when>
                            <c:when test="${booking.status == 'R'}"><span style="color: blue;">Returned</span></c:when>
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
                <p class="detail-item"><strong>Total Payment:</strong> <span class="detail-value">₹${booking.totalPayment}</span></p>
                <p class="detail-item"><strong>Advance Payments:</strong> <span class="detail-value">₹${booking.advancePayment}</span></p>
                <p class="detail-item"><strong>Pending Payments:</strong> <span class="detail-value">₹${booking.pendingPayment}</span></p>
            </div>
        </div>

        <div class="section action" id="bk-action">
            <div class="action-links">
                <c:if test="${booking.pendingPayment > 0 && booking.status != 'C' && booking.status != 'R'}">
                    <a href="/makePayment/${booking.bookingId}" class="btn action-link">Pay dues</a>
                </c:if>
                <c:if test="${booking.status == 'CNF' && booking.pendingPayment == 0}">
                    <a href="/returnBooking/${booking.bookingId}" class="btn action-link">Return</a>
                </c:if>
                <c:if test="${booking.status == 'P' || (booking.advancePayment == 0 && booking.status != 'C')}">
                    <a href="/cancelBooking/${booking.bookingId}" class="btn action-link">Cancel</a>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
