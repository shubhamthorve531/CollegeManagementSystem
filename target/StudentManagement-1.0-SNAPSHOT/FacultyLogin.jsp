<%-- 
    Document   : FacultyLogin
    Created on : 04-Oct-2020, 7:25:42 PM
    Author     : smasher
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Login-College Management</title>
        <style>
            body {
                background-image: url('img/Login.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">

                        <div class="card-header text-center " style="background-color:lightsteelblue">
                            <h3>Admin / Faculty Login</h3>
                        </div>

                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <%@include file="components/alert.jsp" %>
                            <form action="FacultyLoginServlet" method="post" >
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="Email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="Password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <!--                            <div class="form-group row">
                                                                <label for="exampleFormControlSelect1">Select Login Type</label>
                                                                <div class="col-md-10">
                                                                    <select class="form-control" id="exampleFormControlSelect1">
                                                                        <option>Faculty</option>
                                                                        <option>Admin</option>
                                                                    </select>
                                                                </div>
                                                            </div>-->

                                <a href="registerFaculty.jsp">If not registered click here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn " style="background-color:lightsteelblue">Login</button>
                                </div>

                            </form> 

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
