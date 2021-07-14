<%-- 
    Document   : AdminStudents
    Created on : 03-Nov-2020, 9:15:17 pm
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.StudentDao"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%
    
    Faculty faculty = (Faculty) session.getAttribute("current-user");
    if (faculty == null) {
        session.setAttribute("alert", "You are not logged in !! Login first");
        response.sendRedirect("FacultyLogin.jsp");
    } else {
        if (faculty.getFacultyType().endsWith("Normal")) {

            session.setAttribute("alert", "You are not Admin! Do not access this page");
            response.sendRedirect("FacultyLogin.jsp");

            return;
        }
    }
    StudentDao dao = new StudentDao(FactoryProvider.getFactory());
    List<Student> slist = dao.getAllStudents();

    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="components/common_css_js.jsp" %>

        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <title>Students</title>
        <script>

            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;

            }


        </script> 
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/AdminSidebar.jsp"%>

        <div class="container-fluid course">
            <div class="row-ml-auto">
                <div class="col-md-10 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center " style="background-color:black">
                            <h3 style="color:white">All Students</h3>
                        </div>
                        <div data-toggle="modal" data-target="#add-students-modal">
                            <a href="#" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add New Student</a>
                        </div>
                    </div>
                    <%@include file = "components/message.jsp" %>
                    <%@include file = "components/alert.jsp" %>
                </div>
            </div>
        </div>
        <!--add student modal-->
        <div class="modal fade" id="add-students-modal" tabindex="-1" aria-labelledby="add-faculties-modal" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" >
                    <div class="modal-header text-white" style="background-color:black">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Details of Student !!</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">

                        <form action="RegisterStudentServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addnewstudent" >
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
                                <div class="container text-center mt-3">
                                    <button class="btn btn-outline-success">Add</button>
                                    <button class="btn btn-outline-warning"  data-dismiss="modal">close</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!--Show Students-->
        
        <div class="col-md-8 offset-md-3">
            <!--row-->
            <div id="printstudents">  
                <div class="row mt-17" > 
                    <table class="table table-bordered mt-4 table-hover">
                        <thead style="background-color: #F7F5F4">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Photo</th>
                                <th scope="col">Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Department</th>
                                <th scope="col">Year</th>
                                <th scope="col">Mobile</th>
                                <th scope="col">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int no = 1;
                                for (Student students : slist) {

                            %>
                        <div class="card faculties-card">
                            <tr>

                                <th scope="row"><%out.println(no++);%></th>

                                <td class="text-center"><img src="img/Students/<%=students.getStudentPic()%>" style="max-height:100px; max-width:100px; "  alt="..."></td>
                                <td><%=students.getStudentName()%></td>
                                <td><%=students.getStudentGender()%></td>
                                <td><%=students.getStudentCourse()%></td>
                                <td><%=students.getStudentYear()%></td>
                                <td><%=students.getStudentMobile()%></td>
                                <td><%=students.getStudentEmail()%></td>
                            </tr>
                        </div>
                        <%
                            }
                        %>
                        </tbody>


                    </table>
                    <!--            </div>-->



                </div>
            </div>
            <div class="text-center offset-md-9">
                <button  class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true"  onclick="printDiv('printstudents')">Print Students list</button>
            </div>

        </div>
    </body>
</html>
