<%-- 
    Document   : PrintAdmission
    Created on : 06-Nov-2020, 10:31:58 am
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.mycompany.studentmanagement.entities.Student"%>
<%

    Student students = (Student) session.getAttribute("current-student");

    if (students == null) {
        session.setAttribute("alert", "You are not registered !!");
        response.sendRedirect("registerStudent.jsp");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Print Admission Form</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <script>
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;

            }
        </script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <div class="container col-md-8">
            <%@include file="components/message.jsp"%>
            <div id="printAdmission">
                <div class ="card-header text-center mt-2" style="background-color: #D8D8D8">
                    <h4>Our College Admission Form</h4>
                </div>

                <div class="card-body">
                    <form>
                        <div class="form-row">
                            <div class="col-md-3">
                                <img src="img/Students/<%=students.getStudentPic()%>" style=" max-height:210px; max-width: 210px; border-image: fill; " >
                                <h5 class="text-center">Photo</h5>
                            </div>
                            <div class="col-md-8 offset-md-1">
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Student's Name :</th>
                                            <td><%=students.getStudentName()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Selected Course :</th>
                                            <td><%=students.getStudentCourse()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Year :</th>
                                            <td><%=students.getStudentYear()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Mobile Number :</th>
                                            <td><%=students.getStudentMobile()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email Id :</th>
                                            <td><%=students.getStudentEmail()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%=students.getStudentGender()%></td>
                                            <th scope="row">Date of Birth :</th>
                                            <td><%=students.getStudentDOB()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Father Name :</th>
                                            <td><%=students.getStudentFather()%></td>
                                            <th scope="row">Mother Name :</th>
                                            <td><%=students.getStudentMother()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Address :</th>
                                            <td colspan="3"><%=students.getStudentAddr()%> , <%=students.getStudentPin()%></td>
                                        </tr> 
                                        <tr>
                                            <th scope="row">City :</th>
                                            <td ><%=students.getStudentCity()%></td>
                                            <th scope="row">State :</th>
                                            <td ><%=students.getStudentState()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mt-3">
                                <p>Authorities Signature</p>
                            </div>
                            <div class=" offset-md-8 mt-3">
                                <p>Student Signature</p>
                            </div>
                            <div class="mt-2">
                                <p>Take the print out of these Application form and submit in the Office!</p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <button  class="btn btn-primary ml-auto" role="button" aria-pressed="true"  onclick="printDiv('printAdmission')">Print Admission Form</button>

                <a class="btn btn-primary  offset-md-8" role="button" href="studentLogoutServlet">Back ><span class="sr-only"></span></a>
            </div>
        </div>

    </body>
</html>
