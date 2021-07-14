


<%@page import="com.mycompany.studentmanagement.entities.Student"%>
<%
    Student student1 = (Student) session.getAttribute("current-student");


%>



<nav id="studNavbar_top" class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="img/logo.png" alt="Techro HTML5 template"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
<!--            <ul class="navbar-nav">
                <li class="nav-item-active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admission.jsp">Admission</a>
                </li>

            </ul>-->

            <%                if (student1 == null) {


            %>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Login
                    </a>
                    <div class="dropdown-menu  " style="background-color: gray " aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item text-light " href="StudentLogin.jsp">Student</a>
                        <a class="dropdown-item text-light " href="FacultyLogin.jsp">Faculty /<br>Admin</a>
                        <!--                        <a class="dropdown-item" href="FacultyLogin.jsp">Admin</a>-->
                    </div>

                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Register
                    </a>
                    <div class="dropdown-menu" style="background-color: gray" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item text-light" href="registerStudent.jsp">Student</a>
                        <a class="dropdown-item text-light" href="registerFaculty.jsp">Faculty</a>
                    </div>
                </li>



            </ul>

            <%                } else {
            %>
            <!--                 <ul class="navbar-nav">
                           
                            <li class="nav-item">
                                <a class="nav-link" href="student.jsp">Profile</a>
                            </li>
                            </ul>-->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Hi  <%=student1.getStudentName()%> !
                    </a>


                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="studentLogoutServlet">Logout<span class="sr-only"></span></a>

                </li>

                <%
                    }


                %>
                <script>
                    ///////////////// fixed menu on scroll for desktop
                    if ($(window).width() > 992) {
                        $(window).scroll(function () {
                            if ($(this).scrollTop() > 40) {
                                $('#studNavbar_top').addClass("fixed-top");
                                // add padding top to show content behind navbar
                                $('body').css('padding-top', $('.navbar').outerHeight() + 'px');
                            } else {
                                $('#studNavbar_top').removeClass("fixed-top");
                                // remove padding top from body
                                $('body').css('padding-top', '0');
                            }
                        });
                    }
                </script>


        </div>
    </div>
</nav>