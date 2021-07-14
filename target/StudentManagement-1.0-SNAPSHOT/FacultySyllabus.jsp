<%-- 
    Document   : FacultySyllabus
    Created on : 10-Dec-2020, 7:28:34 pm
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.SyllabusDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Syllabus"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
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

    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();

    SyllabusDao sdao = new SyllabusDao(FactoryProvider.getFactory());
    List<Syllabus> slist = sdao.getAllSyllabus();
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
                            <h3 style="color:white"> Syllabus</h3>
                        </div>
                    </div>

                </div>
            </div>




            <div class="row mt-4 col-md-10 offset-md-2">

                <!--first column-->
                <div class="col-md-6">
                    <div class="card addsyllabus-card">

                        <div class="card-body">
                            <form action="AddSyllabusServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="operation" value="facultysyllabus">
                                <div class="form-group row">
                                    <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Course </label>
                                    <div class="col-sm-10">
                                        <input name="SyllabusCourse" type="text" class="form-control" value="<%=faculty.getFacultyCourse()%>" disabled>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Select Year</label>
                                    <div class="col-sm-10">
                                        <select name="SyllabusYear" class="form-control" id="exampleFormControlSelect1">
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
                                <div class="from-group row">
                                    <label class="col-sm-4 col-form-label" for="exampleFormControlFile1">Upload Syllabus :</label>
                                    <div class="col-sm-8">
                                        <input name="SyllabusFile" type="file" class="form-control-file" required>
                                    </div>
                                </div>

                                <div class="container text-center mt-3">
                                    <button class="btn btn-outline-success">Add Syllabus</button>
                                </div>
                            </form>
                            <%@include file = "components/message.jsp" %>
                            <%@include file = "components/alert.jsp" %>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-6 ">
                    <h5>Click on following link to view</h5>
                    <ul class="data-list" data-autoscroll>
                        <%
                            int m = 1;
                            String FCourse = faculty.getFacultyCourse();
                            for (Syllabus p : slist) {
                                if (FCourse.equals(p.getSyllabusCourse())) {

                        %>
                        <li><a  href="img/Syllabus/<%=p.getSyllabusFile()%>" target="_blank">#&nbsp;<%=p.getSyllabusCourse()%>&nbsp;&nbsp;&nbsp;&nbsp;Year : <%=p.getSyllabus_Year()%></a></li>
                        <br>
                        <br>
                        <%
                                }
                            }
                        %>  
                    </ul>
                </div>


            </div>
        </div>
    </body>
</html>
