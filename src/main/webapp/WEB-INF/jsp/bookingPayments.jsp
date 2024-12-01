<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Payments - Admin</title>
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

    <div class="main-container" id="bookingPaymentsMainContainer">
        <style>
            .main-container {
                padding: 20px 40px;
                font-family: Arial, sans-serif;
            }

            .primary-heading {
                font-size: 28px;
                color: #333;
                text-align: center;
                margin-bottom: 20px;
            }

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

            .action-cell {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .action-btn {
                text-decoration: none;
                padding: 8px 12px;
                border-radius: 5px;
                color: white;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            .approve-btn {
                background-color: #28a745;
            }

            .approve-btn:hover {
                background-color: #218838;
            }

            .reject-btn {
                background-color: #dc3545;
            }

            .reject-btn:hover {
                background-color: #c82333;
            }

            .return-link {
                text-decoration: none;
                color: #007BFF;
                font-size: 18px;
            }

            .return-link:hover {
                color: #0056b3;
            }
        </style>

        <h1 class="primary-heading">Booking Payments - Admin</h1>
        <br />
        <div class="table-container">
            <table class="table">
                <tr class="table-header">
                    <th>Transaction ID</th>
                    <th>Payment Reference No.</th>
                    <th>Booking ID</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

                <c:forEach items="${transactions}" var="transaction">
                    <tr class="table-row">
                        <td>${transaction.transactionId}</td>
                        <td>${transaction.paymentRefNo}</td>
                        <td>${transaction.bookingId}</td>
                        <td>₹${transaction.amount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${transaction.approved == null}">Pending</c:when>
                                <c:when test="${transaction.approved == false}">Rejected</c:when>
                                <c:when test="${transaction.approved == true}">Approved</c:when>
                            </c:choose>
                        </td>
                        <td class="action-cell">
                            <c:choose>
                                <c:when test="${transaction.approved == null}">
                                    <a href="/updatePaymentStatus/${transaction.transactionId}/approve" class="action-btn approve-btn">Approve</a>
                                    <a href="/updatePaymentStatus/${transaction.transactionId}/reject" class="action-btn reject-btn">Reject</a>
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
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
