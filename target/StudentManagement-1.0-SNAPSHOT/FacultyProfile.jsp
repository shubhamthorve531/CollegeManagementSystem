<%-- 
    Document   : FacultyProfile
    Created on : 11-Dec-2020, 12:24:20 am
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Faculty faculty = (Faculty) session.getAttribute("current-user");
    if (faculty == null) {
        session.setAttribute("alert", "You are not logged in !! Login first");
        response.sendRedirect("FacultyLogin.jsp");
    } else {
        if (faculty.getFacultyType().endsWith("Admin")) {

            session.setAttribute("alert", "You are not Teacher! Do not access this page");
            response.sendRedirect("FacultyLogin.jsp");

            return;
        }
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Profile</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/autoscroll.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>

        <%@include file="components/navbar.jsp"%>
        <%@include file="components/FacultySidebar.jsp"%>

        <div class="container-fluid course">
            <div class="row-ml-auto">
                <div class="card">
                    <div class="card-header text-center " style="background-color:black ; height: 1px">
                        <h3>title</h3>
                    </div>
                </div>
            </div>


            <div class="row mt-100">
                <div class="card col-md-8 offset-md-3" >
                    <div class ="card-header text-center mt-2" style="background-color: #D8D8D8">
                        <h4>Profile Info</h4>
                    </div>

                    <div class="card-body">
                        <form>
                            <div class="form-row">
                                <div class="col-md-3">
                                    <img src="img/Faculties/<%=faculty.getFacultyPic()%>" style=" max-height:210px; max-width: 210px; border-image: fill; " >
                                    <h5 class="text-center">Photo</h5>
                                </div>
                                <div class="col-md-8 offset-md-1">
                                    <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <th scope="row">Name :</th>
                                                <td><%=faculty.getFacultyName()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Department :</th>
                                                <td><%=faculty.getFacultyCourse()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Designation :</th>
                                                <td><%=faculty.getFacultyRole()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Mobile Number :</th>
                                                <td><%=faculty.getFacultyMobile()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email Id :</th>
                                                <td><%=faculty.getFacultyEmail()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Address :</th>
                                                <td><%=faculty.getFacultyAddr()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
