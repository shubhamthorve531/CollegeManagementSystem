<%-- 
    Document   : FacultyStudents
    Created on : 14-Nov-2020, 5:48:56 pm
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.StudentDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>

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
    
    StudentDao dao = new StudentDao(FactoryProvider.getFactory());
    List<Student> slist = dao.getAllStudents();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>faculty student</title>
        
        <script>

            function printDiv(divName) {
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
        <%@include file="components/FacultySidebar.jsp"%>
        
        
         <div class="container-fluid course">
            <div class="row-ml-auto">
                <div class="col-md-10 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center " style="background-color:black">
                            <h3 style="color:white"><%=faculty3.getFacultyCourse()%> Students</h3>
                        </div>
                    </div>
                    <%@include file = "components/message.jsp" %>
                    <%@include file = "components/alert.jsp" %>
                </div>
            </div>
        </div>

        <div class="col-md-8 offset-md-3">
            <!--row-->
            <div id="printstudents">  
                <div class="row mt-17" > 
                    <table class="table table-bordered mt-4 table-hover">
                        <thead style="background-color: #F7F5F4">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Photo</th>
                                <th scope="col">Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Department</th>
                                <th scope="col">Year</th>
                                <th scope="col">Mobile</th>
                                <th scope="col">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int no = 1;
                             String fcourse = faculty3.getFacultyCourse();
                                for (Student students : slist) {
                                   
                                   
                                 if(fcourse.equals(students.getStudentCourse())){
                            %>
                        <div class="card faculties-card">
                            <tr>
                                
                                <th scope="row"><%out.println(no++);%></th>

                                <td class="text-center"><img src="img/Students/<%=students.getStudentPic()%>" style="max-height:100px; max-width:100px; "  alt="..."></td>
                                <td><%=students.getStudentName()%></td>
                                <td><%=students.getStudentGender()%></td>
                                <td><%=students.getStudentCourse()%></td>
                                <td><%=students.getStudentYear()%></td>
                                <td><%=students.getStudentMobile()%></td>
                                <td><%=students.getStudentEmail()%></td>
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
            <div class="text-center offset-md-9">
                <button  class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true"  onclick="printDiv('printstudents')">Print Students list</button>
            </div>

        </div>
    </body>
</html>
