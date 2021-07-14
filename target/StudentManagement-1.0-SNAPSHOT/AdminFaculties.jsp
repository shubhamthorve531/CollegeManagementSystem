<%-- 
    Document   : AdminFaculties
    Created on : 01-Nov-2020, 10:52:42 am
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.FacultyDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Faculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
%>

<%
    FacultyDao dao = new FacultyDao(FactoryProvider.getFactory());
    List<Faculty> list = dao.getAllFaculties();

    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>admin-faculties</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!--        <link rel="stylesheet" href="css/bootstrap.min.css">-->
        <script>
            
		function printDiv(divName){
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
                            <h3 style="color:white">All Faculties</h3>
                        </div>
                        <div data-toggle="modal" data-target="#add-faculties-modal">
                            <a href="#" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add New Faculty</a>
                        </div>
                    </div>
                    <%@include file = "components/message.jsp" %>
                    <%@include file = "components/alert.jsp" %>
                </div>
            </div>
        </div>


        <div class="modal fade" id="add-faculties-modal" tabindex="-1" aria-labelledby="add-faculties-modal" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" >
                    <div class="modal-header text-white" style="background-color:black">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Details of faculty !!</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">

                        <form action="RegisterFacultyServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addfaculty">
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


                            <div class="container text-center mt-3">
                                <button class="btn btn-outline-success">Add</button>
                                <button class="btn btn-outline-warning"  data-dismiss="modal">close</button>
                            </div>




                        </form>


                    </div>

                </div>
            </div>
        </div>

        <!--Show faculties-->

        <div class="col-md-8 offset-md-3">
            <!--row-->
            <div id="printme">
            <div class="row mt-17"> 
                    <table class="table table-bordered mt-4 table-hover">
                        <thead style="background-color: #F7F5F4">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Photo</th>
                                <th scope="col">Name</th>
                                <th scope="col">Role</th>
                                <th scope="col">Department</th>
                                <th scope="col">Mobile</th>
                                <th scope="col">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                for (Faculty faculties : list) {
                            %>
                        <div class="card faculties-card">
                            <tr>
                                <th scope="row"><%=faculties.getFacultyid()%></th>
                                <td class="text-center"><img src="img/Faculties/<%=faculties.getFacultyPic()%>" style="max-height:100px; max-width:100px; "  alt="..."></td>
                                <td><%=faculties.getFacultyName()%></td>
                                <td><%=faculties.getFacultyRole()%></td>
                                <td><%=faculties.getFacultyCourse()%></td>
                                <td><%=faculties.getFacultyMobile()%></td>
                                <td><%=faculties.getFacultyEmail()%></td>
                            </tr>
                        </div>
                        <%
                            }
                        %>
                        </tbody>


                    </table>
                    <!--            </div>-->



                </div>
                <div class="text-center offset-md-9">
                    <button  class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true"  onclick="printDiv('printme')">Print faculties list</button>
                </div>

            </div>

        </div>



    </body>
</html>









<!--            <div class="col-md-10 offset-md-2 mt-15">-->
                   <!--            <h1>Number of faculties is <%=list.size()%></h1>-->







