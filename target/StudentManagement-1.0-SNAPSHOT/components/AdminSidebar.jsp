<%-- 
    Document   : AdminNavbar
    Created on : 15-Oct-2020, 9:08:59 AM
    Author     : smasher
--%>
 <%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.entities.Faculty"%>
<%@page import="com.mycompany.studentmanagement.dao.FacultyDao"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%
    Faculty faculty2 = (Faculty) session.getAttribute("current-user");
    if (faculty2 == null) {
        session.setAttribute("alert", "You are not logged in !! Login first");
        response.sendRedirect("FacultyLogin.jsp");
    } else {
        if (faculty2.getFacultyType().endsWith("Normal")) {

            session.setAttribute("alert", "You are not Admin! Do not access this page");
            response.sendRedirect("FacultyLogin.jsp");
            return;
        }
    }
%>
       
<div class="sidebar">
      <div class="profile_info">
         <img src="img/Faculties/<%=faculty2.getFacultyPic()%>" style=" max-height:150px; max-width: 100%; width: auto; " class=" img-fluid rounded-circle " alt="...">
        <h4>Admin</h4>
      </div>
      <a href="admin.jsp"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
      <a href="AdminCourses.jsp"><i class="fas fa-book"></i><span>Courses</span></a>
      <a href="AdminSubjects.jsp"><i class="fas fa-bookmark"></i><span>Subjects</span></a>
      <a href="AdminSyllabus.jsp"><i class="fas fa-paste"></i><span>Syllabus</span></a>
      <a href="AdminStudents.jsp"><i class="fas fa-user"></i><span>Students</span></a>
      <a href="AdminFaculties.jsp"><i class="fas fa-users"></i><span>Faculties</span></a>
      <a href="AdminNotices.jsp"><i class="fas fa-bell"></i><span>Announcements</span></a>
      <a href="#"><i class="fas fa-table"></i><span>Time Table</span></a>
      <a href="#"><i class="fas fa-edit"></i><span>Assign Subjects</span></a>
      <a href="#"><i class="fas fa-certificate"></i><span>Reports</span></a>
      <a href="#"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
    </div>