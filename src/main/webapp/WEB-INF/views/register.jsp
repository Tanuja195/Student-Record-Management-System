<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<style>
body{
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: #121212;
    color: #f1f1f1;
}

/* Container */
.container{
    width: 400px;
    margin: 80px auto;
    padding: 25px 30px;
    background: #1e1e1e;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.6);
}

/* Heading */
h2{
    text-align: center;
    margin-bottom: 25px;
    color: #4CAF50;
}

/* Labels */
label{
    display: block;
    margin-bottom: 6px;
    font-size: 14px;
}

/* Inputs */
input[type="text"],
input[type="email"]{
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: 1px solid #444;
    background: #2a2a2a;
    color: #fff;
    font-size: 14px;
}

input:focus{
    outline: none;
    border-color: #4CAF50;
}

/* Register button */
.btn-register{
    width: 100%;
    padding: 10px;
    background: #4CAF50;
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 15px;
    cursor: pointer;
}

.btn-register:hover{
    background: #43a047;
}

/* View button */
.view-btn{
    width: 100%;
    margin-top: 12px;
    padding: 10px;
    background: #2196F3;
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 15px;
    cursor: pointer;
}

.view-btn:hover{
    background: #1e88e5;
}

a{
    text-decoration: none;
}
</style>

</head>
<body>

<div class="container">

    <h2>Student Registration</h2>

    <form action="registerStudent" method="post">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Course</label>
        <input type="text" name="course" required>

        <input type="submit" value="Register" class="btn-register">
    </form>

    <a href="viewStudent">
        <button class="view-btn">View All Students</button>
    </a>

</div>

</body>
</html>
