<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
        }

        h3 {
            margin-bottom: 20px;
            color: #333;
            font-size: 1.5em;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        h2 {
            margin-top: 20px;
            font-size: 1em;
        }

        h2 a {
            text-decoration: none;
            color: #007BFF;
        }

        h2 a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h3>Login</h3>
            <form action="/login" method="post">
                Enter User Id:<input type="text" name="username" placeholder="User ID"/>
                <br/>
                Enter Password:<input type="password" name="password" placeholder="Password"/>
                <br/>
                <input type="submit" value="Submit"/>
            </form>
            <h2>
                <a href="/register">Register for new User</a>
            </h2>
        </div>
    </div>
</body>
</html>