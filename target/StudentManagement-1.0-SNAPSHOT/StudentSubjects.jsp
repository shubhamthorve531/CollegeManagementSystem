<%-- 
    Document   : StudentSyllabus
    Created on : 24-Nov-2020, 9:37:14 pm
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.SubjectDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
    Student student = (Student) session.getAttribute("current-student");
    if (student== null) {
        session.setAttribute("alert", "You are not logged in !! Login first");
        response.sendRedirect("StudentLogin.jsp");
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
                            <div style="clear:both">
                            <h3 class="ml-auto" style="float:left; color:white;"><%=student.getStudentCourse()%> Subjects</h3>
                            <h3 class="ml-auto" style="float:right; color:white;">Year: <%=student.getStudentYear()%></h3>
                            </div>
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
                                <th scope="col">Subject Code</th>
                                <th scope="col">Subject Name</th>
<!--                                <th scope="col">Course</th>-->
                                <th scope="col">Semester</th>
                                <th scope="col">Theory Marks</th>
                                <th scope="col">Practical Marks</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int m = 1;
                                String SCourse = student.getStudentCourse();
                                int SYear = Integer.parseInt(student.getStudentYear());
                                for (Subjects subject : slist) {
                                    if(SCourse.equals(subject.getSubjectCourse()) && SYear == subject.getSubjectYear())
                                    {
                            %>
                        <div class="card subject-card">
                            <tr>
                                <th scope="row"><%=m++%></th>    
                                <td><%=subject.getSubjectCode()%></td>
                                <td><%=subject.getSubjectName()%></td>
<!--                                <td><%=subject.getSubjectCourse()%></td>-->
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
                        <%
                             if(m==1)
                               {
                                  out.println("<h4>Subjects of your course not added !</h4>");
                               }
                        %>
                </div>
            </div>

        </div>
    </body>
</html>
