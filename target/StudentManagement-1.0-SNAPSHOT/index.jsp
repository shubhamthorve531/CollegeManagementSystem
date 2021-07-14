<%-- 
    Document   : index
    Created on : 01-Oct-2020, 7:48:07 PM
    Author     : smasher
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagement.entities.Course"%>
<%@page import="com.mycompany.studentmanagement.dao.CourseDao"%>
<%@page import="com.mycompany.studentmanagement.entities.Student"%>
<%@page import="com.mycompany.studentmanagement.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CourseDao cdao = new CourseDao(FactoryProvider.getFactory());
    List<Course> list = cdao.getAllCourses();
%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Web Education</title>

        <%@include file="components/common_css_js.jsp" %>
        <link rel="favicon" href="img/favicon.png">
        <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css"> 
        <link rel="stylesheet" href="css/bootstrap-theme.css" media="screen"> 
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/autoscroll.css">

    </head>
    <body>


        <%@include file="components/navbar.jsp"%>

        <header style="background-color:black">
            <div class="container text-center">
                <div id="carouselExampleIndicators" class="carousel slide" data-interval="2000" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                    </ol>
                    <div class="carousel-inner ">
                        <div class="carousel-item active ">

                            <img  src="img/pic3.jpeg" width="900" height="470" alt="first slide">
                            <div class="carousel-caption d-none d-md-block">

                                <h3 style="background-color:black;">“One day, all your hard work will pay off.”</h3>
                            </div>

                        </div>
                        <div class="carousel-item">

                            <img  src="img/pic4.jpeg" width="900" height="470" alt="second slide">
                            <div class="carousel-caption d-none d-md-block">

                                <h3 style="background-color:black;">“The earlier you start working on something, the earlier you will see results.”</</h3>
                            </div>

                        </div>
                        <div class="carousel-item">
                            <img  src="img/pic2.jpeg" width="900" height="470" alt="third slide">
                            <div class="carousel-caption d-none d-md-block">

                                <h3 style="background-color:black;">“Life is short. Live it. Fear is natural. Face it. Memory is powerful. Use it.”</</h3>
                            </div>
                        </div>
                        <div class="carousel-item">

                            <img  src="img/pic1.jpeg" width="900" height="470" alt="fourth slide">
                            <div class="carousel-caption d-none d-md-block">

                                <h3 style="background-color:black;">“Do what is right, not what is easy.”</</h3>
                            </div>

                        </div>
                        <div class="carousel-item">
                            <img  src="img/pic5.jpeg" width="900" height="470" alt="fifth slide">
                            <div class="carousel-caption d-none d-md-block">

                                <h3 style="background-color:black;">“It’s never too late to be what you might have been.”</</h3>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev colour-bg" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next colour-bg" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </header>

        <section class="container">
            <div class="row">
                <div class="col-md-8"><div class="title-box clearfix "><h2 class="title-box_primary">About Us</h2></div> 
                    <p><span>We are going to provide the web interface which enables you proper arrangement of students and teachers information and also enables to give online objective exams</span></p>
                    <p>Providing the online interface for students, faculty etc.
                        Increasing the efficiency of Departmental record management.
                        Decrease time required to access and deliver student records.
                        To reduce unnecessary paperwork in maintaining students information.
                        Creating a online platform to give exams remotely and generate results.
                        It deals with monitoring the information of exams including the results of all semesters.
                    </p>
                    <a href="about.jsp" title="read more" class="btn-inline " target="_self">read more</a> </div>


                <div class="col-md-4"><div class="title-box clearfix "><h2 class="title-box_primary">Courses Offered</h2></div> 
                    <div class="list styled custom-list">
                        <ul class="data-list" data-autoscroll>
                        <% for (Course c : list) {
                        %>
                        
                            <li><a title="<%= c.getCourseId()%> <%=c.getCourseYears()%> years <%=c.getCourseSem()%> semsters" href="#"><%= c.getCourseName()%></a></li>

                        
                        <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </section>


        <footer id="footer">

            <div class="container">

                <div class="social text-center">
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-dribbble"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-github"></i></a>
                </div>

                <div class="clear"></div>
                <!--CLEAR FLOATS-->
            </div>
            <div class="footer2">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6 panel">
                            <div class="panel-body">
                                <p class="simplenav">
                                    <a href="index.jsp">Home</a> | 
                                    <a href="about.jsp">About</a> |
                                    <a href="contact.jsp">Contact</a> |

                                </p>
                            </div>
                        </div>



                    </div>
                    <!-- /row of panels -->
                </div>
            </div>
        </footer>

        <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
        <script src="js/jquery.autoscroll.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/modernizr-latest.js"></script> 
        <script type='text/javascript' src='js/jquery.min.js'></script>
        <script type='text/javascript' src='js/fancybox/jquery.fancybox.pack.js'></script>

        <script type='text/javascript' src='js/jquery.mobile.customized.min.js'></script>
        <script type='text/javascript' src='js/jquery.easing.1.3.js'></script> 
        <script type='text/javascript' src='js/camera.min.js'></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/custom.js"></script>
        <script>
            jQuery(function () {

                jQuery('#camera_wrap_4').camera({
                    transPeriod: 500,
                    time: 3000,
                    height: '600',
                    loader: 'false',
                    pagination: true,
                    thumbnails: false,
                    hover: false,
                    playPause: false,
                    navigation: false,
                    opacityOnGrid: false,
                    imagePath: 'img/'
                });

            });

        </script>





    </body>
</html>
