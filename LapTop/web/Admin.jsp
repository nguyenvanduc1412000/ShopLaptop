<%-- 
    Document   : Admin
    Created on : Jul 8, 2021, 10:03:38 PM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/style2.css" rel="stylesheet">
        <link href="css/colors.css" rel="stylesheet">
    </head>
    <body>
        
        
        
        <div class="container-fluid text-center"    >
        <table class="table table-bordered table-hover">
            <a href="blockAcc">Enable User</a>
            <tr class="table-inverse">
                <th>Account</th>
                <th>Password</th>               
                <th>Phone</th>
                <th>Address</th>
                <th>Email</th>
                <th>Controller</th>
                
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.us}" var="c" varStatus="loop">
                
                <tr>
                    <td>${c.username}</td>
                    <td><input type="password" value="${c.password}" readonly></td>
                    <td>${c.phone}</td>
                    <td>${c.address}</td>
                    <td>${c.email}</td>
                    <td>${c.role}</td>
                    
                    <td> <a href="admin?aid=${c.id_user}">Block</a></td>
                </tr>
            </c:forEach>
           
        </table>
        <a href="home" class="btn btn-gradient grd4 withradius secbtn">HOME</a>
        
    </body>
</html>

