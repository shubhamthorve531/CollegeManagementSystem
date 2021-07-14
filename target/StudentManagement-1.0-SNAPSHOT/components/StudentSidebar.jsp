<%-- 
    Document   : StudentSidebar
    Created on : 15-Oct-2020, 7:35:08 AM
    Author     : smasher
--%>
<%@page import="com.mycompany.studentmanagement.entities.Student"%>
<%

    Student students = (Student) session.getAttribute("current-student");
%>
       <div class="sidebar">
            <div class="profile_info">
                <img src="img/Students/<%=students.getStudentPic()%>" style=" max-height:150px; max-width: 100%; width: auto; " class=" img-fluid rounded-circle " alt="<%=students.getStudentName()%>">
                <h4>Student</h4>
            </div>
            <a href="student.jsp"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
            <a href="admission.jsp"><i class="fas fa-edit"></i><span>Admission</span></a>
            <a href="StudentDocuments.jsp"><i class="fas fa-folder"></i><span>Documents</span></a>
            <a href="StudentSubjects.jsp"><i class="fas fa-book"></i><span>My Subjects</span></a>
            <a href="StudentFaculty.jsp"><i class="fas fa-users"></i><span>My Faculties</span></a>
            <a href="StudentSyllabus.jsp"><i class="fas fa-paste"></i><span>Syllabus</span></a>
            <a href="#"><i class="fas fa-check"></i><span>Exams</span></a>
            <a href="#"><i class="fas fa-certificate"></i><span>Results</span></a>
            <a href="#"><i class="fas fa-tasks"></i><span>Timetable</span></a>
            <a href="#"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
        </div>
    </body>
</html>
