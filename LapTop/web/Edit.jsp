

<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="update" method="post">
                        <div class="modal-header">						
                            <h4 style="color:green"  class="modal-title">Update Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                             
                            <div class="form-group">
                                <label>ID</label>
                                <input name="id_pro" type="text" class="form-control" value="${detail.id_pro}"  readonly required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name_pro" value="${detail.name_pro}" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="images" value="${detail.images}" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price_$</label>
                                <input name="price" value="${detail.price}" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" value="${detail.quantity}" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Supplier</label>
                                <textarea name="supplier"  class="form-control" required>${detail.supplier}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="infor"  class="form-control" required>${detail.infor}</textarea>
                            </div>
                            <div class="form-group">
                                <label >Category</label>
                                <select     name="id_cat" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="o">
                                        <option      value="${o.id_cat}">${o.name_cat}</option>
                                    </c:forEach>
                                   
                                </select>				
                           </div>
                            </div>
                        <div class="modal-footer">
                             <a  href="manager"><button type="button" class="btn btn-primary">Back</button>
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        
  
    <script src="js/manager.js" type="text/javascript"></script>
</body>
</html>