<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>

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
h1{
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

/* Update button */
.btn-update{
    width: 100%;
    padding: 10px;
    background: #4CAF50;
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 15px;
    cursor: pointer;
    margin-bottom: 10px;
}

.btn-update:hover{
    background: #43a047;
}

/* Delete button */
.delete-btn{
    width: 100%;
    padding: 10px;
    background: #e53935;
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 15px;
    cursor: pointer;
}

.delete-btn:hover{
    background: #d32f2f;
}
</style>
</head>
<body>

<div class="container">

<h1>Edit Data</h1>

<form action="update" method="post">
    <input type="hidden" name="id" value="${student.id}">

    <label>Name</label>
    <input type="text" name="name" value="${student.name}" required>

    <label>Email</label>
    <input type="email" name="email" value="${student.email}" required>

    <label>Course</label>
    <input type="text" name="course" value="${student.course}" required>

    <input type="submit" value="Update" class="btn-update">
</form>

<form action="delete" method="post">
    <input type="hidden" name="id" value="${student.id}">
    <button type="submit" class="delete-btn">Delete</button>
</form>

</div>

</body>
</html>
