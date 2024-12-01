<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Report</title>
    <style>
        /* Header styling */
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

        .btn, .myaccount-btn, .logout-btn {
            text-decoration: none;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover, .myaccount-btn:hover, .logout-btn:hover {
            background-color: #0056b3;
        }

        /* Main container styling */
        .main-container {
            padding: 20px 40px;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .primary-heading {
            font-size: 28px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table container styling */
        .table-container {
            overflow-x: auto;
            margin: 20px auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 90%;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .table-header {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
        }

        .table-row:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table-row:hover {
            background-color: #f1f1f1;
        }

        /* Action button styling */
        .action-cell {
            display: flex;
            justify-content: center;
        }

        .action-btn {
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            background-color: #28a745;
            transition: background-color 0.3s ease;
        }

        .action-btn:hover {
            background-color: #218838;
        }

        /* Return link styling */
        .return-link {
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
        }

        .return-link:hover {
            color: #0056b3;
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

    <div class="main-container" id="bookingReportMainContainer">
        <h1 class="primary-heading">Booking Report</h1>
        <br />
        <div class="table-container">
            <table class="table">
                <tr class="table-header">
                    <th>Booking ID</th>
                    <th>Car Number</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>Status</th>
                    <th>Pending Payment</th>
                    <th>Action</th>
                </tr>

                <c:forEach items="${bookings}" var="booking">
                    <tr class="table-row">
                        <td>${booking.bookingId}</td>
                        <td>${booking.carNumber}</td>
                        <td>${booking.fromDate}</td>
                        <td>${booking.toDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${booking.status == 'CNF'}">Confirmed</c:when>
                                <c:when test="${booking.status == 'P'}">Pending</c:when>
                                <c:when test="${booking.status == 'C'}">Cancelled</c:when>
                                <c:when test="${booking.status == 'R'}">Returned</c:when>
                            </c:choose>
                        </td>
                        <td>₹${booking.pendingPayment}</td>
                        <td class="action-cell">
                            <a href="/bookingReport/${booking.bookingId}" class="action-btn details-btn">Details</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br />
        <h3><a class="return-link" href="/index">Return</a></h3>
    </div>
</body>
</html>
