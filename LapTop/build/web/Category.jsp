<%-- 
    Document   : left
    Created on : Jun 5, 2021, 7:38:44 PM
    Author     : asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
 
        <!------ Include the above in your HEAD tag ---------->
       
        <!-- Default stylesheets-->
<!--        <link href="assets2/lib/flexslider/flexslider.css" rel="stylesheet">
        <link href="assets2/css3/style.css" rel="stylesheet">-->
<!--<div id='content_left_menu'>
    <div class="categories" style="color:green">ALL CATEGORIES </div>
    <ul>



        <c:forEach items="${listC}" var='o'>
            <li class="${tag==o.id_cat?"active":"" }"  ><a  href="category?id_cat=${o.id_cat}"><span>${o.name_cat}</span></a></li>
                    </c:forEach>

        </li>

    </ul>
    <div class="categories" style="color:green">NEWEST PRODUCT </div>

    <div ><img src="${p.images}" class="img-responsive" width=" 250px" height="280px"  > </div>

    <div class="content-right-product-h4" >
        <a href="detail?pid=${p.id_pro}">${p.name_pro}</a>
    </div>

    <div class="content-right-product-p">${p.infor}</div>


    <div class="content-right-product-amount"><i class="fa fa-inr" style="color:#df001a;"></i> ${p.price} </div>
    <div class="cart" align="center"><a href="" class="btn">Add to Cart</a></div>



</div>-->
<style>
    .bg-primary{
        background-color: greenyellow;
        color:red;
        margin-top :17px;
        margin-bottom: 70px;
         padding-top: 10px;
         font-size: 23px;
         padding-bottom: 10px;
         
    }
    .list-group-item{
        padding:16px 16px;       
        
    }
    .list-group-item a{
        color: red;
    }
    .bg-success{
         background-color: greenyellow;
        color:red;
         font-size: 23px;
    }
   
 </style>
<div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listC}" var="o">
                                <li class="list-group-item text-white ${tag == o.id_cat ? "active" : ""}"><a href="category?cid=${o.id_cat}">${o.name_cat}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div  class="card-header bg-success text-white text-uppercase" >New product</div>
                        <div class="card-body" style="">
                            <img class="img-fluid" width="200px" heigh="200px" src="${p.images}" />
                            <h5 class="card-title">${p.name_pro}</h5>
                            <p class="card-text">${p.infor}</p>
                            <div class="ratings" style="color: yellow">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                            </div>
                            <p class="bloc_left_price">$${p.price} </p>
                            <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v11.0&appId=401359887932617&autoLogAppEvents=1" nonce="k4lHbSnP"></script>
                       <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="200px" data-layout="standard" data-action="like" data-size="small" data-share="true"></div>
                        </div>
                        
                    </div>
