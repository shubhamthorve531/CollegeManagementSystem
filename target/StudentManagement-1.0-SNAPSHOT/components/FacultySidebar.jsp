<%-- 
    Document   : FacultySidebar
    Created on : 15-Oct-2020, 9:14:33 AM
    Author     : smasher
--%>
<%@page import="com.mycompany.studentmanagement.entities.Faculty"%>
<%
    Faculty faculty3 = (Faculty) session.getAttribute("current-user");
%>
<div class="sidebar">
    <div class="profile_info">
        <img onclick="window.location = 'FacultyProfile.jsp'"src="img/Faculties/<%=faculty3.getFacultyPic()%>" style=" max-height:150px; max-width: 100%; width: auto; " class=" img-fluid rounded-circle " alt="...">
        <h4>Teacher</h4>
        <a href="faculty.jsp"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
        <a href="FacultySyllabus.jsp"><i class="fas fa-paste"></i><span>Syllabus</span></a>
        <a href="FacultySubjects.jsp"><i class="fas fa-bookmark"></i><span>Subjects</span></a>
        <a href="FacultyStudents.jsp"><i class="fas fa-user"></i><span>Students</span></a>
        <a href="FacultyNotices.jsp"><i class="fas fa-bell"></i><span>Announcements</span></a>
        <a href="FacultyCourses.jsp"><i class="fas fa-book"></i><span>Other Courses</span></a>
        <a href="FacultyTimetable.jsp"><i class="fas fa-table"></i><span>Time Table</span></a>
        <a href="#"><i class="fas fa-puzzle-piece"></i><span>Online Exams</span></a>
        <a href="FacultyResults.jsp"><i class="fas fa-certificate"></i><span>Student Results </span></a>   
        <a href="FacultyAttendance.jsp"><i class="fas fa-check-square"></i><span>Attendance</span></a>   
        <a href="FacultySettings.jsp"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
    </div>
</div>
