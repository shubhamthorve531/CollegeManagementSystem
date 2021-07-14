<%-- 
    Document   : register
    Created on : 02-Oct-2020, 10:03:15 AM
    Author     : smasher
--%>

<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.StudentDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Student"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%  
    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Student Admission</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <style>
            body {
                background-image: url('img/back.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
        <script>
		function printDiv(divName){
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;

			document.body.innerHTML = printContents;

			window.print();

			document.body.innerHTML = originalContents;

		}
	</script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp"%>

        <div class="container">

            <div class="col-md-10 offset-md-1">
                <div class="card mt-5 ">
                    <div class="card-header text-center " style="background-color:lightsteelblue">
                        <h3>Admission Form</h3>
                        <h5 class="text-muted text-center">Fill all the details of student carefully !</h5>
                    </div>
                    <%@include file = "components/message.jsp" %>
                    <%@include file = "components/alert.jsp" %>
                    <div class="card-body px-5 ">

                        <!--                        <div class="container text-center ">
                                                    <img src="img/studentreport.png" style="max-height:50px ; max-width: 50px;" class = "rounded col-md-3">
                                                </div>
                                                <h3 class="text-center my">Sign Up Here!!</h3>-->


                        <form action="RegisterStudentServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="registerstudent" >
                            <div class="form-group row">
                                <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Select Course</label>
                                <div class="col-sm-10">
                                    <select name="student_course" class="form-control" id="exampleFormControlSelect1">
                                        <%  for (Course c : clist) {
                                        %>
                                        <option> <%= c.getCourseName()%> </option>    
                                        <%}%> 
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Select Year</label>
                                <div class="col-sm-10">
                                    <select name="student_year" class="form-control" id="exampleFormControlSelect1">
                                        <%
                                            int n = 1;
                                            for (Course c : clist) {
                                                while (n <= c.getCourseYears()) {

                                        %>
                                        <option> <%out.println(n++);%> </option>    
                                        <%}
                                            }%>  
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <input name="student_name" type="text" class="form-control" id="name" placeholder="Enter Your Name">
                            </div>   

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input name="student_email" type="email" class="form-control" id="Email" placeholder="Enter here" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>

                                </div> 

                                <div class="form-group col-md-6">
                                    <input name="student_mobile" type="number" class="form-control" id="MobileNumber" placeholder="Enter your mobile number" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="exampleFormControlSelect1">Enter Date Of Birth</label>
                                    <input name="student_dob" type="date" class="form-control" placeholder="Date Of Birth">
                                </div>

                                <div class="col-md-6">
                                    <label for="exampleFormControlSelect1">Select Gender</label>
                                    <select name="student_gender" class="form-control" id="exampleFormControlSelect1">
                                        <option>Male</option>
                                        <option>Female</option>
                                        <option>Transgender</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputPassword6">Password</label>
                                <input name="student_password" type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
                                <small id="passwordHelpInline" class="text-muted">
                                    Must be 8-20 characters long.
                                </small>
                            </div>


                            <div class="form-group mt-2">
                                <label for="inputAddress">Address</label>
                                <input name="student_address" type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">City</label>
                                    <input name="student_city" type="text" class="form-control" id="inputCity">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputState">State</label>
                                    <input name="student_state" type="text" class="form-control" id="inputState">
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="inputZip">Zip</label>
                                    <input name="student_pin" type="text" class="form-control" id="inputZip">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-6">
                                    <input name="student_father"  type="text" class="form-control" placeholder="Father's name">
                                </div>
                                <div class="col-md-6">
                                    <input name="student_mother" type="text" class="form-control" placeholder="Mother's name">
                                </div>
                            </div>

                            <div class="form-row mt-2">
                                <div class="col-md-6">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="student_photo" type="file" class="form-control-file" required>
                                </div>

                            </div>
                            <div class="form-group mt-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck">
                                    <label class="form-check-label" for="gridCheck">
                                        I hereby Declared that the above information provided is 100% True !!!
                                    </label>
                                </div>
                            </div>
                            <div class="form-row mt-2">
                                <div class="container text-center ml-auto" >
                                    <button class="btn btn-outline-success" style="background-color:lightsteelblue">Submit</button>
                                    <button class="btn btn-outline-warning" style="background-color:lightsteelblue">Reset</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>


    </body>
</html>






<!--
                        <form action="RegisterStudentServlet" method="post">
                            <input type="hidden" name="operation" value="register">
                            <div class="form-group" style="">
                                <label for="name">Name</label>
                                <input name="student_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">

                            </div> 
                            <div class="form-group">
                                <label for="Email">Email</label>
                                <input name="student_email" type="email" class="form-control" id="Email" placeholder="Enter here" aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>

                            </div> 
                            <div class="form-group">
                                <label for="MobileNumber">Mobile Number</label>
                                <input name="student_mobile" type="number" class="form-control" id="MobileNumber" placeholder="Enter here" >
                                <small id="emailHelp" class="form-text text-muted">We'll never share your number with anyone else.</small>
                            </div>



                            <div class="form-group">
                                <label for="inputPassword6">Password</label>
                                <input name="student_password" type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
                                <small id="passwordHelpInline" class="text-muted">
                                    Must be 8-20 characters long.
                                </small>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>
                            </div>




                        </form>-->