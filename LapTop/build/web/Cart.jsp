
<%@page import="java.util.List"%>
<%@page import="model.Item"%>
<%@page import="model.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <title>Bootstrap Sign up Form Horizontal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style> 
            @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

            body {
                background-color: #eeeeee;
                font-family: 'Open Sans', serif;
                font-size: 14px;
                margin-left: 2%;
            }

            .container-fluid {
                margin-top: 70px
            }

            .card-body {
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1.40rem
            }

            .img-sm {
                width: 80px;
                height: 80px
            }

            .itemside .info {
                padding-left: 15px;
                padding-right: 7px
            }

            .table-shopping-cart .price-wrap {
                line-height: 1.2
            }

            .table-shopping-cart .price {
                font-weight: bold;
                margin-right: 5px;
                display: block
            }

            .text-muted {
                color: #969696 !important
            }

            a {
                text-decoration: none !important
            }

            .card {
                position: relative;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, .125);
                border-radius: 0px
            }

            .itemside {
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                width: 100%
            }

            .dlist-align {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex
            }

            [class*="dlist-"] {
                margin-bottom: 5px
            }

            .coupon {
                border-radius: 1px
            }

            .price {
                font-weight: 600;
                color: #212529
            }

            .btn.btn-out {
                outline: 1px solid #fff;
                outline-offset: -5px;
                    width: 30%;
    margin-left: 2%;
            }

            .btn-main {
                border-radius: 2px;
                text-transform: capitalize;
                font-size: 15px;
                padding: 10px 19px;
                cursor: pointer;
                color: #fff;
                width: 100%
            }

            .btn-light {
                color: #ffffff;
                background-color: #F44336;
                border-color: #f8f9fa;
                font-size: 12px
            }

            .btn-light:hover {
                color: #ffffff;
                background-color: #F44336;
                border-color: #F44336
            }

            .btn-apply {
                font-size: 11px
            }	
        
            a{
                text-decoration: none;
                color: chocolate;
                font-size: 22px;
                font-weight: bold;
            }
            table{
                border-collapse: collapse;
                width: 800px;
            }
            .ta{
                text-align: right
            }
           
        </style>
    <script >
    
    </script>
    </head>
    <body>
        <div class="container-fluid">
        <h1 style="color: #007bff">Shopping cart online</h1>
        <table border="1px" width="40%">
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Image</th>
                <th>Quantity</th>
                
                <th>Price</th>
                <th>Total money</th>
                
                <th>Action</th>
            </tr>
            <c:set var="o" value="${sessionScope.cart}"/>
            <c:set var="t" value="0"/>
                <c:forEach items="${o.items}" var="i"> 
                <c:set var="t" value="${t+1}"/>               
            <tr>                
                <td>${t}</td>
                <td>${i.product.name_pro}</td>
                <td>
                   <img src="${i.product.images}"  width="100" height="50">    
                </td>
                <td style="text-align: center">
                    <button ><a href="process?num=-1&id=${i.product.id_pro}">-</a></button>
                    <input type="text" readonly  value="${i.quantity}"/>
                    <button><a href="process?num=1&id=${i.product.id_pro}">+</a></button>
                    
                </td>
                
                <td class="ta">
                    $<fmt:formatNumber pattern="##.#" value="${i.price}"/>
                </td>
                <td class="ta">
                    $<fmt:formatNumber pattern="##.#" value="${i.quantity*i.price}"/>
                </td>
                <td style="text-align: center">
                    <form action="process" method="post">
                        <input type="hidden" name="id" value="${i.product.id_pro}"/>
                        <input type="submit" value="Remove"/>   
                    </form>    
                </td>
            </tr>
            </c:forEach>                    
        </table>
            Total Money:  <input style="margin-top: 10px" type="text" name="totalprice" value=" ${o.getToTalMoney()}$" >
                <p></p>        
        
            <a href="#addEmployeeModal" class="btn btn-out btn-primary btn-square btn-main" data-abc="true" data-toggle="modal"> Make Purchase </a> 
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="checkout" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title"></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">	
                               
                                <div class="form-group">
                                    <label>First name</label>
                                    <input name="Fname" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input name="Lname" type="text" class="form-control" required>
                                </div>
                                
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input name="phone" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Delivery Address</label>
                                    <textarea name="address" class="form-control" required></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Put">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        
        <hr/>        
         <a href="home" class="btn btn-out btn-success btn-square btn-main mt-2" data-abc="true">Continue Shopping</a>
    </div>
        </body>
</html>
    