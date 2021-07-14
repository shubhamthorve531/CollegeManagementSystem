<%-- 
    Document   : FacultySubjects
    Created on : 10-Dec-2020, 7:28:05 pm
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page import="com.mycompany.studentmanagement.entities.Subjects"%>
<%@page import="com.mycompany.studentmanagement.dao.SubjectDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.entities.Faculty"%>
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
<%
    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> list = cdao.getAllCourses();

    SubjectDao sdao = new SubjectDao(FactoryProvider.getFactory());
    List<Subjects> slist = sdao.getAllSubjects();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Courses</title>
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
                <div class="col-md-10 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center " style="background-color:black">
                            <h3 style="color:white"><%=faculty.getFacultyCourse()%> Subjects</h3>
                        </div>
                        <div data-toggle="modal" data-target="#add-subject-modal">
                            <a href="#" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add New Subject</a>
                        </div>
                    </div>
                    <%@include file = "components/message.jsp" %>
                    <%@include file = "components/alert.jsp" %>
                </div>
            </div>
        </div>


        <div class="modal fade" id="add-subject-modal" tabindex="-1" aria-labelledby="add-subject-modal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" >
                    <div class="modal-header text-white" style="background-color:black">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Details of Subject !!</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">

                        <form action="AddSubjectServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="facultysubjects">
                            <div class="from-group row">
                                <label  class="col-sm-4 col-form-label">Subject code :</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="subCode" placeholder="Enter Subject code" required/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Subject Name :</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="subName" placeholder="Enter Name of Subjects" required/>
                                </div>
                            </div> 
                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Theory Marks :</label>
                                <div class="col-sm-12">
                                    <input type="number" class="form-control" name="theoryMarks" placeholder="Enter the theory marks of subject" required/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Practical Marks :</label>
                                <div class="col-sm-12">
                                    <input type="number" class="form-control" name="practicalMarks" placeholder="Enter the practical marks of subject" required/>
                                </div>
                            </div> 
                            <%  for (Course c : list) {
                            %>
                            <input name="courseId" type="hidden" value="<%=c.getId()%>">
                            <%}%>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Choose a Course:</label>
                                <div class="col-sm-12">
                                    <select name="subCourse" class="form-control " >
                                        <%  for (Course c : list) {
                                        %>
                                        <option> <%= c.getCourseName()%> </option>    
                                        <%}%> 
                                    </select> 
                                </div>
                            </div>


                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Year :</label>
                                <div class="col-sm-12">
                                    <select name="subYear" class="form-control " >
                                        <%
                                            int n = 1;
                                            for (Course c : list) {
                                                while (n <= c.getCourseYears()) {

                                        %>
                                        <option> <%out.println(n++);%> </option>    
                                        <%}
                                            } %> 
                                    </select> 
                                </div> 
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Semester :</label>
                                <div class="col-sm-12">
                                    <select name="subSem" class="form-control " >
                                        <%
                                            int k = 1;
                                            for (Course c : list) {
                                                while (k <= c.getCourseSem()) {

                                        %>
                                        <option> <%out.println(k++);%> </option>    
                                        <%}
                                            } %> 
                                    </select> 
                                </div> 
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

        <!--  show subjects-->
        <div class="col-md-8 offset-md-3">
            <!--row-->
            <div class="row mt-17"> 
                <table class="table table-bordered mt-4 table-hover">
                    <thead style="background-color: #F7F5F4">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Subject Code</th>
                            <th scope="col">Subject Name</th>
                            <th scope="col">Year</th>
                            <th scope="col">Semester</th>
                            <th scope="col">Theory Marks</th>
                            <th scope="col">Practical Marks</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int m = 1;
                            String Scourse = faculty.getFacultyCourse();
                            for (Subjects subject : slist) {
                                if (Scourse.equals(subject.getSubjectCourse())) {
                        %>
                    <div class="card subject-card">
                        <tr>
                            <th scope="row"><%=m++%></th>    
                            <td><%=subject.getSubjectCode()%></td>
                            <td><%=subject.getSubjectName()%></td>
                            <td><%=subject.getSubjectYear()%></td>
                            <td><%=subject.getSubjectSem()%></td>
                            <td><%=subject.getTheoryMarks()%></td>                     
                            <td><%=subject.getPracticalMarks()%></td>                     
                        </tr>
                    </div>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
