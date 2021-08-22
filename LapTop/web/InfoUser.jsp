<%-- 
    Document   : InfoUser
    Created on : Jul 5, 2021, 1:58:23 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <table border="1">
                <caption align="top" style="font-size: 30px;color: red">Information </caption>
                <tr>
                    <th>ID</th>
                    <td>${acc.id_user}</td>
                </tr>
                <tr>
                    <th>UserName</th>
                    <td>${acc.username}</td>
                </tr>
                <tr>
                    <th>PassWord</th>
                    <td>${acc.password}</td>
                </tr>
<!--                <tr>
                    <th>Date of Birth</th>
                    <td>${acc.dob}</td>
                </tr>-->
                <tr>
                    <th>Gender</th>
                    <td>${acc.gender}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${acc.email}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>${acc.phone}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${acc.address}</td>
                </tr>
            </table>
            <h4>
                <a href="ManagerUser.jsp?id_pro=${id_pro}"><span>Update</span></a>                    
            </h4>
            <h5>
                <a href="home">Back</a>
            </h5>
        </div>
    </body>
</html>
