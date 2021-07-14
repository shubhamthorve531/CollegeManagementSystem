<%-- 
    Document   : student
    Created on : 04-Oct-2020, 9:28:26 PM
    Author     : smasher
--%>

<%@page import="com.mycompany.studentmanagement.dao.SubjectDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.NoticeDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Notices"%>
<%@page import="com.mycompany.studentmanagement.entities.Student"%>
<%
    Student student = (Student) session.getAttribute("current-student");
    if (student == null) {
        session.setAttribute("alert", "You are not logged in !! Login first");
        response.sendRedirect("StudentLogin.jsp");
    }

    NoticeDao dao = new NoticeDao(FactoryProvider.getFactory());
    List<Notices> nlist = dao.getAllNotices();

    SubjectDao sdao = new SubjectDao(FactoryProvider.getFactory());
    List<Subjects> slist = sdao.getAllSubjects();
%>




<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/autoscroll.css">

    </head>
    <body>
        <%@include file="components/studNavbar.jsp"%>
        <%@include file="components/StudentSidebar.jsp"%>
        <div class="container student">
            <div class="row mt-3 col-md-10 offset-md-2">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header" style="max-height: 100px;">
                            <h4 class="text-uppercase text-muted">Notices</h4>
                        </div>
                        <div class="card-body">

                            <ul class="data-list" data-autoscroll
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

                                <% int no = 1;
                                    for (Notices notice : nlist) {
                                        if (notice.getNoticeReceiver().trim().equalsIgnoreCase("Students") || notice.getNoticeReceiver().trim().equalsIgnoreCase("Everyone")) {
                                %>
                                <li><a style="text-color: black" href="img/Notices/<%=notice.getNoticePic()%>" target="_blank"><%out.println(no++);%>| <%=notice.getNoticeDate()%>| <%=notice.getNoticeDetails()%></a></li>
                                    <%
                                            }
                                        }
                                    %>  
                            </ul> 

                        </div>   
                    </div>
                </div>

                <div class="col-md-6"> 
                    <table class="table table-bordered table-hover">
                        <thead style="background-color: #F7F5F4">
                            <h4>Attendance</h4>
                            <tr>
                                <th scope="col">Subject</th>
                                <th scope="col">Percentage</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String Scourse = student.getStudentCourse();
                                for (Subjects subject : slist) {
                                    if (Scourse.equals(subject.getSubjectCourse())) {
                            %>
                        <div class="card faculties-card">
                            <tr>
                                <th scope="row"><%=subject.getSubjectName()%></th>
                                <th scope="row">Null</th>

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
        <script src="js/jquery.autoscroll.js" type="text/javascript" charset="utf-8"></script>
    </body>
</html>
