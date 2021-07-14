


<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Faculty"%>
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

    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();
%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css"><!--
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>-->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">


    </head>


    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/AdminSidebar.jsp"%>
        <%@include file = "components/message.jsp" %>
        <%@include file = "components/alert.jsp" %>
        <div class="container-fluid course">
            <div class="row-ml-auto">
                <div class="col-md-10 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center " style="background-color:black">
                            <h3 style="color:white">Course Management</h3>
                        </div>
                        <div data-toggle="modal" data-target="#add-course-modal">
                            <a href="#" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add New Course</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Add Course Modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-course-modal" tabindex="-1" aria-labelledby="add-course-modal" aria-hidden="true">
            <div class="modal-dialog modal-col-md-12" role="document">
                <div class="modal-content" >
                    <div class="modal-header text-white" style="background-color:black">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Course Details !!</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="AddCourseServlet" method="post">
                            <div class="from-group row">
                                <label  class="col-sm-4 col-form-label">Course Id :</label>
                                <div class="col-sm-12">
                                    <input name="courseId"  type="text" class="form-control" placeholder="Enter Course Id" required/>
                                </div>
                            </div>
                            <div class="from-group row">
                                <label  class="col-sm-4 col-form-label">Course Name :</label>
                                <div class="col-sm-12">
                                    <input name="courseName" type="text" class="form-control"  placeholder="Enter Name of Course" required/>
                                </div>
                            </div>
                            <div class="from-group row">
                                <label  class="col-sm-4 col-form-label">No. of Years :</label>
                                <div class="col-sm-12">
                                    <input name="courseYears" type="number" class="form-control"  placeholder="Enter number of years in the Course" required/>
                                </div>
                            </div>
                            <div class="from-group row">
                                <label  class="col-sm-4 col-form-label">No. of Semesters :</label>
                                <div class="col-sm-12">
                                    <input name="courseSem" type="number" class="form-control" placeholder="Enter number of semesters in the Course" required/>
                                </div>
                            </div>

                            <div class="container text-center mt-2">
                                <button type="button" class="btn btn-outline-success">Add Course</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>
        <!-- End Of Add course Modal-->

        <!--show courses-->
        <div class="col-md-8 offset-md-3">
            <!--row-->
            <div id="printme">
                <div class="row mt-17"> 
                    <table class="table table-bordered mt-4 table-hover">
                        <thead style="background-color: #F7F5F4">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Course Code</th>
                                <th scope="col">Course Name</th>
                                <th scope="col">Total Years</th>
                                <th scope="col">Total Semesters</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% for (Course courses : clist) {
                            %>
                        <div class="card faculties-card">
                            <tr>
                                <th scope="row"><%=courses.getId()%></th>    
                                <td><%=courses.getCourseId()%></td>
                                <td><%=courses.getCourseName()%></td>
                                <td><%=courses.getCourseYears()%></td>
                                <td><%=courses.getCourseSem()%></td>                     
                            </tr>
                        </div>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <!--                <div class="text-center offset-md-9">
                                    <button  class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true"  onclick="printDiv('printme')">Print faculties list</button>
                                </div>-->

            </div>

        </div>
    </body>
</html>
