<%-- 
    Document   : FacultyCourses
    Created on : 10-Dec-2020, 7:26:46 pm
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
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
                            <h3 style="color:white">Other Courses</h3>
                        </div>
                    </div>
                    <%@include file = "components/message.jsp" %>
                    <%@include file = "components/alert.jsp" %>
                </div>
            </div>

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
                                <% 
                                    for (Course courses : clist) {
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
                </div>
            </div>
        </div>
    </body>
</html>
