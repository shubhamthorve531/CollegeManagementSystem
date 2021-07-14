<%-- 
    Document   : About
    Created on : 01-Oct-2020, 11:10:39 PM
    Author     : smasher
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>About</title>
    <link rel="favicon" href="img/favicon.png">
    <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Custom styles for our template -->
    <link rel="stylesheet" href="css/bootstrap-theme.css" media="screen">
    <link rel="stylesheet" href="css/style.css">
   
   
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
       <header id="head" class="secondary" style="background-color:black">
            <div class="container">
                    <h1>About Us</h1>
                    
                </div>
    </header>


    <!-- container -->
    <section class="container background-color:black">
        <div class="row">
            <!-- main content -->
            <section class="col-sm-8 maincontent">
                <h3>About Us</h3>
                <p>
                    <img src="img/About.png" alt="" class="img-rounded pull-right" width="300">
                   This Website assists in automating the existing Manual system. This is a Paperless work. It can be monitored and controlled remotely. It reduces the man power required. It provides accurate information always. Malpractice can be reduced.
 All Students together gathered information can be saved and can be accessed at any time. The data which is stored in the repository helps in taking intelligent decisions by the management. So it is better to have a Web Based Information Management system.

                </p>
                <p>Information storing and accessing becomes easier.
The system will help to simplify and streamline all task.
Helps to keep track of all students.
Reduction of Human labour, paperwork and workload.
Efficient Management and conduction of online exams can be achieved.
Helps to keep a record of previous batch students and build a strong alumni.
</p>
<!--                <h3>Our Achievements</h3>
                <strong>2014</strong>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam beatae soluta accusantium iusto nihil nesciunt unde veniam magnam repudiandae sapiente. consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam!</p>
                <strong>2013</strong>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam beatae soluta accusantium iusto nihil nesciunt unde veniam magnam repudiandae sapiente. consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam!</p>
                <strong>2012</strong>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam beatae soluta accusantium iusto nihil nesciunt unde veniam magnam repudiandae sapiente. consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam!</p>
                <strong>2011</strong>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam beatae soluta accusantium iusto nihil nesciunt unde veniam magnam repudiandae sapiente. consequuntur eius repellendus eos aliquid molestiae ea laborum ex quibusdam laudantium voluptates placeat consectetur quam aliquam!</p>-->
            </section>
            <!-- /main -->

            <!-- Sidebar -->
            <aside class="col-sm-4 sidebar sidebar-right">

                <div class="panel">
                    <h4>Technologies Used</h4>
                    <ul class="list-unstyled list-spaces">
                        <li><a href="https://netbeans.org/">Netbeans IDE</a><br>
                            <span class="small text-muted">NetBeans is an integrated development environment (IDE) for Java. NetBeans allows applications to be developed from a set of modular software components called modules. </span></li>
                        <li><a href="">HTML5, CSS3 and JavaScript</a><br>
                            <span class="small text-muted">HTML5 on its own cannot be used for animation or interactivity – it must be supplemented with CSS3 or JavaScript.</span></li>
                        <li><a href="https://getbootstrap.com/">Bootstrap</a><br>
                            <span class="small text-muted">Bootstrap is a free and open-source CSS framework directed at responsive, mobile-first front-end web development.</span></li>
                        <li><a href="https://hibernate.org/">Hibernate Configuration</a><br>
                            <span class="small text-muted">Hibernate is an Object Relational Mapping (ORM) solution for Java. It models relational data tables to Java classes, and Java data types to SQL data types.</span></li>
                        <li><a href="https://www.mysql.com/">MySQL</a><br>
                            <span class="small text-muted">MySQL is a freely available open source Relational Database Management System (RDBMS) that uses Structured Query Language (SQL). </span></li>
                    </ul>
                </div>

            </aside>
            <!-- /Sidebar -->

        </div>
        
    </section>
    <!-- /container -->
    <section class="team-content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3>Our Team</h3>
                    <p>We are always here to help you and provide optimum solutions.</p>
                    <br />
                </div>
            </div>
            <div class="row">

                <div class="col-md-3 col-sm-6 col-xs-6">
                    <!-- Team Member -->
                    <div class="team-member">
                        <!-- Image Hover Block -->
                        <div class="member-img">
                            <!-- Image  -->
                            <img class="img-responsive" src="img/Shubham1.png" alt="">
                        </div>
                        <!-- Member Details -->
                        <h4>Shubham Thorve</h4>
                        <!-- Designation -->
                        <span class="pos">Developer</span>
                        <div class="container text-center ">
                        <p><span style="color:#3f51b5">shubhamthorve531@gmail.com</span></p>
                        <div class="team-socials">
                            <a href="#"><i class="fab fa-facebook"></i></a>
                            <a href="#"><i class="fab fa-google-plus"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-github"></i></a>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <!-- Team Member -->
                    <div class="team-member pDark">
                        <!-- Image Hover Block -->
                        <div class="member-img">
                            <!-- Image  -->
                            <img class="img-responsive" src="img/kedar2.jpg" alt="">
                        </div>
                        <!-- Member Details -->
                        <h4>Kedar Mane</h4>
                        <!-- Designation -->
                        <span class="pos">Developer</span>
                        <div class="container text-center ">
                        <p><span style="color:#3f51b5">kedarmane221@gmail.com</span></p>
                        <div class="team-socials">
                            <a href="#"><i class="fab fa-facebook"></i></a>
                            <a href="#"><i class="fab fa-google-plus"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-github"></i></a>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <!-- Team Member -->
                    <div class="team-member pDark">
                        <!-- Image Hover Block -->
                        <div class="member-img">
                            <!-- Image  -->
                            <img class="img-responsive" src="img/Pritam.png" alt="">
                        </div>
                        <!-- Member Details -->
                        <h4>Pritam Wankhede</h4>
                        <!-- Designation -->
                        <span class="pos">Developer</span>
                        <div class="container text-center ">
                        <p><span style="color:#3f51b5">pritamwankhade671@gmail.com</span></p>
                        <div class="team-socials">
                            <a href="#"><i class="fab fa-facebook"></i></a>
                            <a href="#"><i class="fab fa-google-plus"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-github"></i></a>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <!-- Team Member -->
                    <div class="team-member pDark">
                        <!-- Image Hover Block -->
                        <div class="member-img">
                            <!-- Image  -->
                            <img class="img-responsive" src="img/RahulShelke.png" alt="">
                        </div>
                        <!-- Member Details -->
                        <h4>Rahul Shelke</h4>
                        <!-- Designation -->
                        <span class="pos">Developer</span>
                        <div class="container text-center ">
                        <p><span style="color:#3f51b5">shelkerahuld22@gmail.com</span></p>
                        <div class="team-socials">
                            <a href="#"><i class="fab fa-facebook"></i></a>
                            <a href="#"><i class="fab fa-google-plus"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-github"></i></a>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6 container text-center">
                    <!-- Team Member -->
                    <div class="team-member pDark">
                        <!-- Image Hover Block -->
                        <div class="member-img">
                            <!-- Image  -->
                            <img class="img-responsive" src="img/AmitKadam.jpg" alt="">
                        </div>
                        <!-- Member Details -->
                        <h4>Prof.Amit Kadam,Sir</h4>
                        <!-- Designation -->
                        <span class="pos">Project Guide</span>
                        <div class="container text-center ">
                        <p><span style="color:#3f51b5">amit.kadam@abmspcoerpune.org</span></p>
                        <div class="team-socials">
                            <a href="#"><i class="fab fa-facebook"></i></a>
                            <a href="#"><i class="fab fa-google-plus"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-github"></i></a>
                        </div>
                    </div>
                    </div>
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

<!--					<div class="col-md-6 panel">
						<div class="panel-body">
							<p class="text-right">
								Copyright &copy; 2014. Template by <a href="http://webthemez.com/" rel="develop">WebThemez.com</a>
							</p>
						</div>
					</div>-->

				</div>
				<!-- /row of panels -->
			</div>
		</div>
	</footer>

    <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>
