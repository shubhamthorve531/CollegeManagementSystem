<%-- 
    Document   : faculty
    Created on : 04-Oct-2020, 9:28:43 PM
    Author     : smasher
--%>
<%@page import="com.mycompany.studentmanagement.entities.Subjects"%>
<%@page import="com.mycompany.studentmanagement.dao.SubjectDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.dao.StudentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.dao.NoticeDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page import="com.mycompany.studentmanagement.entities.Notices"%>
<%@page import="com.mycompany.studentmanagement.entities.Faculty"%>
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
%>
<%
    StudentDao sdao = new StudentDao(FactoryProvider.getFactory());
    List<Student> slist = sdao.getAllStudents();
    
    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> clist = cdao.getAllCourses();

    SubjectDao sbdao = new SubjectDao(FactoryProvider.getFactory());
    List<Subjects> sblist = sbdao.getAllSubjects();
    
    NoticeDao ndao = new NoticeDao(FactoryProvider.getFactory());
    List<Notices> nlist = ndao.getAllNotices();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Page</title>
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
        <div class="container faculty">
            <div  class="row mt-3 col-md-10 offset-md-2  ">
                <!--          first col-->
                <div  class="col-md-4">
                    <div  onclick="window.location = 'FacultyStudents.jsp'" class="card" data-toggle="tooltip" data-placement="right" title="Number of students in your department">
                        <div class="card-body text-center ">

                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/students.png" alt="user_icon">
                            </div>
                            <%
                                int no = 0;
                             String fcourse = faculty3.getFacultyCourse();
                                for (Student students : slist) {  
                                 if(fcourse.equals(students.getStudentCourse())){
                                     no++;
                                 }
                                }
                            %>
                            <h3><%out.println(no);%></h3>
                            <h3 class="text-uppercase text-muted">Students</h3>
                        </div>
                    </div>
                </div>
              
                <!--second col-->
                <div class="col-md-4">
                    <div onclick="window.location = 'FacultyCourses.jsp'" class="card" data-toggle="tooltip" data-placement="right" title="No of Courses">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid" src="img/book.png" alt="user_icon">
                            </div>

                            <h3><%=clist.size()%></h3>
                            <h3 class="text-uppercase text-muted">Courses</h3>
                        </div>
                    </div>
                </div>
                <!--Third col-->
                <div class="col-md-4">
                    <div onclick="window.location = 'FacultySubjects.jsp'" class="card" data-toggle="tooltip" data-placement="right" title="No of Subjects">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid" src="img/subjects.png" alt="user_icon">
                            </div>
                            <%
                            int m = 0;
                            String Scourse = faculty.getFacultyCourse();
                            for (Subjects subject : sblist) {
                                if (Scourse.equals(subject.getSubjectCourse())) {
                                    m++;
                                }
                            }
                           %>
                            <h3><%out.println(m);%></h3>
                            <h3 class="text-uppercase text-muted">Subjects</h3>
                        </div>
                    </div>
                </div>
            </div>
            <!--row-->
            <div class="row mt-3 col-md-10 offset-md-2">
                <!--first column-->
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

                                <% 
                                    for (Notices notice : nlist) {
                                        if (notice.getNoticeReceiver().trim().equalsIgnoreCase("Teachers") || notice.getNoticeReceiver().trim().equalsIgnoreCase("Everyone")) {
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
                <!--second column-->
                <div class="col-md-6">
                    <form action="AddNoticeServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="adminmessage" >
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
                            <label class="col-sm-4 col-form-label" for="Date">Date :</label>
                            <div class="col-sm-8"> 
                                <input name="NoticeDate" type="date" class="form-control" id="today" >
                            </div>
                        </div>
                        <div class="from-group row mt-2">
                            <div class="col-sm-12">
                                <textarea name="NoticeDetails" style="height: 100px;"  type="text" class="form-control"  placeholder="Message" required/></textarea>
                            </div>
                        </div>
                        <div class="from-group row mt-3">
                            <label class="col-sm-6 col-form-label" for="exampleFormControlFile1">Upload Circular File :</label>
                            <div class="col-sm-6">
                                <input name="NoticePhoto" type="file" class="form-control-file" required>
                            </div>
                        </div>

                        <div class="container text-center mt-3">
                            <button class="btn btn-outline-success">Send</button>
                        </div>
                    </form>
                    <%@include file = "components/message.jsp" %>
                </div>
            </div>
        </div>
        <script src="js/jquery.autoscroll.js" type="text/javascript" charset="utf-8"></script>

    </body>
</html>