<%-- 
    Document   : AdminSyllabus
    Created on : 20-Nov-2020, 10:30:19 am
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.SyllabusDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Syllabus"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
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

    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();

//    SyllabusDao sdao = new SyllabusDao(FactoryProvider.getFactory());
//    List<Syllabus> slist = sdao.getAllSyllabus();
%>
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
        <title>Syllabus</title>

        <style>
            .ScrollStyle
            {
                max-height: 283px;
                overflow-y: scroll;
            }
            .syllabus .card:hover{
                background: #e2e2e2;
                cursor: pointer;

            }
        </style>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/AdminSidebar.jsp"%>

        <div class="container-fluid course">
            <div class="row-ml-auto">
                <div class="col-md-10 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center " style="background-color:black">
                            <h3 style="color:white">Syllabus</h3>
                        </div>
                        <%@include file = "components/message.jsp" %>
                        <%@include file = "components/alert.jsp" %>

                    </div>

                </div>
            </div>
        </div>

        <div class="container-fluid">
            <!--row-->
            <div class="row mt-4 col-md-10 offset-md-2">

                <!--first column-->
                <div class="col-md-6">
                    <div class="card addsyllabus-card">
                        <div class="card-header text-center" style="background-color: black">
                            <h5 style="color: white">Add Syllabus</h5>
                        </div>
                        <div class="card-body">
                            <form action="AddSyllabusServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="operation" value="adminsyllabus">
                                <div class="form-group row">
                                    <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">Select Course</label>
                                    <div class="col-sm-10">
                                        <select name="SyllabusCourse" class="form-control" id="exampleFormControlSelect1">
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
                                    <button class="btn btn-outline-success">Add</button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-6 ">
                    <div class="card list-card">
                        <div class="card-header text-center" style="background-color: black">
                            <h5 style="color: white">View Syllabus of</h5>
                        </div>
                        <div class="ScrollStyle">
                            <div class="card-body" style="padding: auto">
                                <div class="list-group">
                                    <a href="AdminSyllabus.jsp?course=all" class="list-group-item list-group-item-action" >
                                        All Courses
                                        <%
                                            for (Course c : clist) {
                                        %>

                                        <a href="AdminSyllabus.jsp?course=<%= c.getId()%>" class="list-group-item list-group-item-action "> <%= c.getCourseName()%> </a>
                                        <%
                                            }
                                        %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>



        <div class="row mt-3 mx-2">
            <%
                String course = request.getParameter("course");
                // out.println(cat);
                SyllabusDao sdao = new SyllabusDao(FactoryProvider.getFactory());
                List<Syllabus> slist = null;

                if (course == null) {
                    slist = sdao.getAllSyllabus();
                } else if (course.trim().equals("all")) {
                    slist = sdao.getAllSyllabus();
                } else {
                    int cid = Integer.parseInt(course.trim());
                    slist = sdao.getAllSyllabusById(cid);
                }


            %>





            <!--show syllabus-->
            <div class="col-md-8 offset-md-3">
            <!--row-->
            <div class="row mt-17"> 
                <table class="table table-bordered mt-4 table-hover">
                    <thead style="background-color: #F7F5F4">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Year</th>
                            <th scope="col">View</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  
                            int m = 1;
                            for (Syllabus p : slist) {
                        %>
                    <div class="card subject-card">
                        <tr>
                            <th scope="row"><%=m++%></th>    
                            <td><%=p.getSyllabusCourse()%></td>
                            <td><%=p.getSyllabus_Year()%></td>
                            <td><a href="img/Syllabus/<%=p.getSyllabusFile()%>" target="_blank"><i class="fas fa-eye"></i></a></td>                   
                        </tr>
                    </div>
                    <%
                        
                                }
                                if (slist.size() == 0) {
                                    out.println("<h3>Syllabus not added in this Course<h3>");
                                }
                      
                    %>
                    </tbody>
                </table>
            </div>

        </div>

    </body>
</html>
