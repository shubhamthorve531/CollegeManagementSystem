<%-- 
    Document   : register
    Created on : 02-Oct-2020, 10:03:15 AM
    Author     : smasher
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <style>
            body {
                background-image: url('img/back.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container-fluid">

            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card ">
                        <div class="card-header text-center " style="background-color:lightsteelblue">
                            <h3>Faculty Registration Form</h3>
                        </div>
                        <%@include file = "components/message.jsp" %>
                        <%@include file = "components/alert.jsp" %>
                        <div class="card-body px-5">

                            <!--                            <div class="container text-center ">
                                                            <img src="img/teacher1.png" alt="..." class = "rounded col-md-3">
                                                        </div>-->

                            <form action="RegisterFacultyServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="operation" value="registerfaculty">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input name="Faculty_Name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">

                                </div> 
                                <div class="form-group">
                                    <label for="Email">Email Address</label>
                                    <input name="Faculty_Email" type="email" class="form-control" id="Email" placeholder="Enter here" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>

                                </div> 
                                <div class="form-group">
                                    <label for="MobileNumber">Enter Mobile Number</label>
                                    <input name="Faculty_Mobile" type="number" class="form-control" id="MobileNumber" placeholder="Enter here" >
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your number with anyone else.</small>
                                </div>



                                <div class="form-group">
                                    <label for="Address">Address</label>
                                    <textarea name="Faculty_Address" class="form-control" placeholder="Enter Your Address"></textarea>

                                </div> 

                                <div class="form-group">
                                    <label for="Jobrole">Enter Job Role</label>
                                    <input name="Faculty_Role" type="text" class="form-control" placeholder="Enter Job Role">
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Choose a Course:</label>
                                    <div class="col-sm-12">
                                        <select name="Faculty_Course" class="form-control " >
                                            <%  for (Course c : clist) {
                                            %>
                                            <option> <%= c.getCourseName()%> </option>    
                                            <%}%> 
                                        </select> 
                                    </div>
                                </div> 

                                <div class="form-group">
                                    <label for="inputPassword6">Password</label>
                                    <input name="Faculty_Password" type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
                                    <small id="passwordHelpInline" class="text-muted">
                                        Must be 8-20 characters long.
                                    </small>
                                </div>

                                <div class="form-group">
                                    <label for="inputPhoto">Insert Your Photo</label>
                                    <br>
                                    <input type="file" name="Faculty_Pic"  required/>
                                </div>

                                <!--                      <div class="form-row">
                                                   <label for="exampleFormControlFile1">Upload Photo</label>
                                                   <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                                 </div>-->

                                <div class="container text-center mt-3">
                                    <button class="btn btn-outline-success" style="background-color:lightsteelblue;">Register</button>
                                    <button class="btn btn-outline-warning" style="background-color:lightsteelblue;">Reset</button>
                                </div>




                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>