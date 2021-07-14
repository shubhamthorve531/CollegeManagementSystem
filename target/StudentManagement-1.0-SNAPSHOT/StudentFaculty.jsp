<%-- 
    Document   : StudentFaculty
    Created on : 28-Nov-2020, 9:23:25 pm
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.FacultyDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Faculty"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Student student = (Student) session.getAttribute("current-student");
    if (student == null) {
        session.setAttribute("alert", "You are not logged in !! Login first");
        response.sendRedirect("StudentLogin.jsp");
    }

%>
<%   
    FacultyDao dao = new FacultyDao(FactoryProvider.getFactory());
    List<Faculty> list = dao.getAllFaculties();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Your Subjects</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="components/studNavbar.jsp"%>
        <%@include file="components/StudentSidebar.jsp"%>
        <div class="container-fluid course">
            <div class="row-ml-auto">
                <div class="col-md-10 offset-md-2">
                    <div class="card">
                        <div class="card-header " style="background-color:black">                 
                            <h3 class="text-center" style=" color:white;"><%=student.getStudentCourse()%> Faculties</h3>
                        </div>
                    </div>
                </div>
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
                                <th scope="col">Photo</th>
                                <th scope="col">Name</th>
                                <th scope="col">Role</th>
<!--                                <th scope="col">Department</th>-->
                                <th scope="col">Mobile</th>
                                <th scope="col">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int m = 1;
                                String SCourse = student.getStudentCourse();
                                int SYear = Integer.parseInt(student.getStudentYear());
                                for (Faculty faculties : list) {
                                    if (SCourse.equals(faculties.getFacultyCourse())) {
                            %>
                        <div class="card faculties-card">
                            <tr>
                                <th scope="row"><%out.println(m++);%></th>
                                <td class="text-center"><img src="img/Faculties/<%=faculties.getFacultyPic()%>" style="max-height:100px; max-width:100px; "  alt="..."></td>
                                <td><%=faculties.getFacultyName()%></td>
                                <td><%=faculties.getFacultyRole()%></td>
<!--                                <td><%=faculties.getFacultyCourse()%></td>-->
                                <td><%=faculties.getFacultyMobile()%></td>
                                <td><%=faculties.getFacultyEmail()%></td>
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

        </div>
    </body>
</html>
