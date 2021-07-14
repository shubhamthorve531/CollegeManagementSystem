<%-- 
    Document   : FacultyAnnouncements
    Created on : 10-Dec-2020, 7:42:49 pm
    Author     : ADMIN
--%>

<%@page import="com.mycompany.studentmanagement.dao.NoticeDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.entities.Notices"%>
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

    NoticeDao dao = new NoticeDao(FactoryProvider.getFactory());
    List<Notices> nlist = dao.getAllNotices();
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
                            <h3 style="color:white">Notices</h3>
                        </div>
                        <div data-toggle="modal" data-target="#add-notice-modal">
                            <a href="#" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add Notice</a>
                        </div>
                    </div>
                    <%@include file = "components/message.jsp" %>
                    <%@include file = "components/alert.jsp" %>
                </div>
            </div>
        </div>


        <!-- Add Notice Modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-notice-modal" tabindex="-1" aria-labelledby="add-notice-modal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" >
                    <div class="modal-header text-white" style="background-color:black">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Details!!</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">

                        <form action="AddNoticeServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="AdminNotices" >
                            <div class="from-group row">
                                <div class="col-sm-12"> 
                                    <select name="NoticeReceiver"  class="form-control">
                                        <option value="" selected disabled hidden><---Select Receiver---></option>
                                        <option>Students</option>
                                        <option>Teachers</option>
                                        <option>Everyone</option>
                                    </select>
                                </div>
                            </div>
                            <div class="from-group row mt-2">
                                <label class="col-sm-4 col-form-label" for="Date">Date Of Announcement :</label>
                                <div class="col-sm-8"> 
                                    <input name="NoticeDate" type="date" class="form-control" id="today" >
                                </div>
                            </div>
                            <div class="from-group row">
                                <label  class="col-sm-4 col-form-label">Announcement :</label>
                                <div class="col-sm-12">
                                    <textarea name="NoticeDetails" style="height: 100px;"  type="text" class="form-control"  placeholder="Fill the announcement you have to made in brief" required/></textarea>
                                </div>
                            </div>
                            <div class="from-group row mt-3">
                                <label class="col-sm-6 col-form-label" for="exampleFormControlFile1">Upload Circular File :</label>
                                <div class="col-sm-6">
                                    <input name="NoticePhoto" type="file" class="form-control-file" required>
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

        <!--        show notices-->


        <div class="col-md-8 offset-md-3">

            <div id="printstudents">  
                <div class="row mt-17" > 
                    <table class="table table-bordered mt-4 table-hover">
                        <thead style="background-color: #F7F5F4">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">ID</th>
                                <th scope="col">Date</th>
                                <th scope="col">Notice</th>
                                <th scope="col">Circular</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int no = 1;
                                String fcourse = faculty.getFacultyCourse();
                                for (Notices notice : nlist) {
                                    if (notice.getNoticeReceiver().trim().equalsIgnoreCase("Teachers") || notice.getNoticeReceiver().trim().equalsIgnoreCase("Everyone")) {
                            %>
                        <div class="card notices-card">
                            <tr>
                                <th scope="row"><%out.println(no++);%></th>
                                <td><%=notice.getNoticeid()%></td>
                                <td><%=notice.getNoticeDate()%></td>
                                <td><%=notice.getNoticeDetails()%></td>
                                <td class="text-center">
                                    <div class="text-center">
                                        <a href="img/Notices/<%=notice.getNoticePic()%>" target="_blank">View <i class="fas fa-eye"></i></a>
                                    </div>
                                </td>
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
        <script>
            document.querySelector("#today").valueAsDate = new Date();
        </script>
    </body>
</html>
