<%-- 
    Document   : Register
    Created on : Jun 12, 2021, 7:51:25 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/register.css">
       
    </head>
    <body >
        <%
            String err = "";
            if (request.getAttribute("err") != null) {
                err = (String) request.getAttribute("err");
            }
        %>
        <div class="d-flex align-items-center light-blue-gradient" style="height: 100vh;">
            <div class="container" >
                <div class="d-flex justify-content-center">
                    <div class="col-md-6">
                        <div class="card rounded-0 shadow">
                            <div class="card-body">
                                <h3>Sign Up</h3>
                                <form action="register" method="post">
                                    <div class="form-group">
                                         <li style="color: red"><%=err%></li>
                                        <label for="exampleInputEmail1">Username: </label>
                                        <input type="text" name="username"   class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter username">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password: </label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address:</label>
                                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputDate1">Date of Birth:</label><br>
                                        <input type="date" value="" name="dob">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputGender1">Gender:</label><br>
                                        <input type="text"  list="exampleList"
                                        name="gender" > 
                                        <datalist id="exampleList">
                                            <option value="Male">
                                            <option value="Female">
                                        </datalist>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPhone1">Phone:</label><br>
                                        <input type="text" value=""				
                               name="phone">
                                    </div>
                                         <div class="form-group">
                                        <label for="exampleInputAddress1">Address:</label><br>
                                        <input type="text" value=""				
                               name="address">
                                    </div>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" checked>
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                     <a  href="home"><button type="button" class="btn btn-primary">Back</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Optional JavaScript -->
                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            </div>
    </body>
</html>
