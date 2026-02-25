<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Data</title>

<style>
body{
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: #121212;
    color: #f1f1f1;
}

/* Page heading */
h2{
    text-align: center;
    margin-top: 40px;
    color: #4CAF50;
}

/* Table styling */
table{
    width: 80%;
    margin: 30px auto;
    border-collapse: collapse;
    background: #1e1e1e;
    box-shadow: 0 0 12px rgba(0,0,0,0.6);
}

th, td{
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #333;
}

th{
    background: #2a2a2a;
    color: #4CAF50;
    font-size: 14px;
}

tr:hover{
    background: #2f2f2f;
}

/* Buttons */
.btn-edit{
    padding: 6px 12px;
    background: #4CAF50;
    border: none;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    font-size: 13px;
}

.btn-edit:hover{
    background: #43a047;
}

.btn-delete{
    padding: 6px 12px;
    background: #e53935;
    border: none;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    font-size: 13px;
}

.btn-delete:hover{
    background: #d32f2f;
}

/* Add new button */
.add-btn{
    display: block;
    width: 200px;
    margin: 20px auto;
    padding: 10px;
    background: #2196F3;
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 15px;
    cursor: pointer;
}

.add-btn:hover{
    background: #1e88e5;
}

a{
    text-decoration: none;
}
</style>

</head>
<body>

<h2>Registered Students</h2>

<table>
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>COURSE</th>
        <th>ACTION</th>
    </tr>

    <c:forEach var="s" items="${students}">
        <tr>
            <td>${s.id}</td>
            <td>${s.name}</td>
            <td>${s.email}</td>
            <td>${s.course}</td>
            <td>
                <form action="edit" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="${s.id}">
                    <button type="submit" class="btn-edit">Edit</button>
                </form>

                <form action="delete" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${s.id}">
                    <button type="submit" class="btn-delete">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="register">
    <button class="add-btn">Add New Student</button>
</a>

</body>
</html>
