<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- admin -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Rental Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
    }

    .navbar {
      overflow: hidden;
      background-color: #333;
    }

    .navbar a {
      float: left;
      font-size: 16px;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    .dropdown {
      float: left;
      overflow: hidden;
    }

    .dropdown .dropbtn {
      font-size: 16px;
      border: none;
      outline: none;
      color: white;
      padding: 14px 16px;
      background-color: inherit;
      font-family: inherit;
      margin: 0;
    }

    .navbar a:hover, .dropdown:hover .dropbtn {
      background-color: red;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1;
    }
    .dropdown-content a {
      float: none;
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
      text-align: left;
    }

    .dropdown-content a:hover {
      background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }
    </style>
</head>

<body>
    <div align="center">
        <h1>Welcome To Car Rental Page</h1>
        <div class="navbar">
            <div class="dropdown">
                <button class="dropbtn">Customer</button>
                <div class="dropdown-content">
                   <!--   <a href="/customerAdd">Customer Addition</a>-->
                    <a href="/customerReport">Customer Reports</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn">Variant</button>
                <div class="dropdown-content">
                    <a href="/variantAdd">Variant Addition</a>
                    <a href="/variantDelete">Variant Deletion</a>
                    <a href="/variantReport">Variant Reports</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn">Car</button>
                <div class="dropdown-content">
                    <a href="/carAdd">Car Addition</a>
                    <!-- <a href="/">Car Update</a>-->
                     <!--<a href="/">Car Deletion</a>-->
                    <a href="/carReport">Car Report</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn">Booking</button>
                <div class="dropdown-content">
                    <a href="/">New Booking</a>
                    <a href="/">Booking Update</a>
                    <a href="/">Cancellation</a>
                    <a href="/">Booking Report</a>
                </div>
            </div>
            <a href="/logout" class="logout">Logout</a>
        </div>
    </div>
</body>
</html>
