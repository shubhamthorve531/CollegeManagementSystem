<%-- 
    Document   : StudentSyllabus
    Created on : 03-Dec-2020, 8:18:56 pm
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.SyllabusDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Syllabus"%>
<%@page import="com.mycompany.studentmanagement.entities.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Student student = (Student) session.getAttribute("current-student");
    if (student == null) {
        session.setAttribute("alert", "You are not logged in !! Login first");
        response.sendRedirect("StudentLogin.jsp");
    }

    SyllabusDao sdao = new SyllabusDao(FactoryProvider.getFactory());
    List<Syllabus> slist = sdao.getAllSyllabus();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Syllabus</title>
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
        <div class="container-fluid syllabus">
            <div class="col-md-10 offset-md-2">
                <div class="card">
                    <div class="card-header text-center" style="background-color:black">
                        <div style="clear:both">
                            <h3 class="ml-auto" style="float:left; color:white;">Syllabus of <%=student.getStudentCourse()%></h3>
                            <h3 class="ml-auto" style="float:right; color:white;">Year: <%=student.getStudentYear()%></h3>
                            </div>
                    </div>
                </div>
                <!--                    show syllabus year wise-->
                <div class="card-body">
                    <table class="table table-bordered mt-1 table-hover">
                        <thead style="background-color: #F7F5F4">

                            <tr>
                                <%
                                    int m = 1;
                                    String SCourse = student.getStudentCourse();
                                    for (Syllabus p : slist) {
                                        if (SCourse.equals(p.getSyllabusCourse())) {

                                %>
                                <td class="text-center" scope="row"><a  href="img/Syllabus/<%=p.getSyllabusFile()%>" target="_blank">Year : <%=p.getSyllabus_Year()%></a></td>
                                <%
                                        }
                                    }
                                %>
                            </tr>

                        </thead>
                    </table>

                </div>
            </div>
        </div>
        <!--show current year syllabus-->
        <div class="col-md-10 offset-md-3">
            <%
                String SYear = student.getStudentYear();
                int items = 0;
                for (Syllabus p : slist) {
                    if (SCourse.equals(p.getSyllabusCourse()) && SYear.equals(p.getSyllabus_Year())) {
                        items++;
            %>
                <iframe src="img/Syllabus/<%=p.getSyllabusFile()%>" height="900" width="80%"></iframe>
                
            <%
                    }
                }
                if(items == 0)
                {
                    out.println("<h4>Syllabus of your course year not added yet !</h4>");
                }
            %>
        </div>
        

    </body>
</html>
