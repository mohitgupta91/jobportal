<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Job Portal</title>

    <!-- Bootstrap Core CSS -->
    <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="/static/css/freelancer.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">

	
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Job Search</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a href="#loginModal" class="portfolio-link" data-toggle="modal">Login</a>
                    </li>
                    <li>
                        <a href="#signUpModal" class="portfolio-link" data-toggle="modal">Register</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
        
    </nav>
    
    <!-- Header -->
    <header>
        <div class="container">
    		<c:if test="${not empty message}">
    	 		<div id="notification" class="alert alert-${type} fade in">
					<a href="#" class="close" data-dismiss="alert">&times;</a>
					${message}
				</div>
			</c:if>
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="static/img/job-search.png" alt="">
                    <div class="intro-text">
                        <span class="name">Job Search</span>
                        <hr class="star-light">
                        <span class="skills">Admin - Portal - Search</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

<!--     Portfolio Grid Section -->
<!--     <section id="about"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12 text-center"> -->
<!--                     <h2>About</h2> -->
<!--                     <hr class="star-primary"> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-sm-4 portfolio-item"> -->
<!--                     <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal"> -->
<!--                         <div class="caption"> -->
<!--                             <div class="caption-content"> -->
<!--                                 <i class="fa fa-search-plus fa-3x"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <img src="img/portfolio/cabin.png" class="img-responsive" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-sm-4 portfolio-item"> -->
<!--                     <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal"> -->
<!--                         <div class="caption"> -->
<!--                             <div class="caption-content"> -->
<!--                                 <i class="fa fa-search-plus fa-3x"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <img src="img/portfolio/cake.png" class="img-responsive" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-sm-4 portfolio-item"> -->
<!--                     <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal"> -->
<!--                         <div class="caption"> -->
<!--                             <div class="caption-content"> -->
<!--                                 <i class="fa fa-search-plus fa-3x"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <img src="img/portfolio/circus.png" class="img-responsive" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-sm-4 portfolio-item"> -->
<!--                     <a href="#portfolioModal4" class="portfolio-link" data-toggle="modal"> -->
<!--                         <div class="caption"> -->
<!--                             <div class="caption-content"> -->
<!--                                 <i class="fa fa-search-plus fa-3x"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <img src="img/portfolio/game.png" class="img-responsive" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-sm-4 portfolio-item"> -->
<!--                     <a href="#portfolioModal5" class="portfolio-link" data-toggle="modal"> -->
<!--                         <div class="caption"> -->
<!--                             <div class="caption-content"> -->
<!--                                 <i class="fa fa-search-plus fa-3x"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <img src="img/portfolio/safe.png" class="img-responsive" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-sm-4 portfolio-item"> -->
<!--                     <a href="#portfolioModal6" class="portfolio-link" data-toggle="modal"> -->
<!--                         <div class="caption"> -->
<!--                             <div class="caption-content"> -->
<!--                                 <i class="fa fa-search-plus fa-3x"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <img src="img/portfolio/submarine.png" class="img-responsive" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->

    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>About</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Add Info Column 1</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Add Info Column 2</p>
                </div>
            </div>
        </div>
    </section>

 
    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Location</h3>
                        <p>New Delhi
                            <br>India</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>About Developer</h3>
                        <p>Contact :<a href="http://linkedin.com">Mohit Gupta</a>.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy;  2017
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Login</h2>
                            <hr class="star-primary">
                 <form name="loginForm" id="loginForm" action="<c:url value="/j_spring_security_check"/>" method="post">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="Name" id="name" name="username" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Password" id="password" name="password" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Sign In</button>
                            </div>
                        </div>
                    </form>
                         <br><br><br>   
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="portfolio-modal modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Sign Up</h2>
                            <hr class="star-primary">
                            	<div>
									<span>If already Signed Up : </span>
									<a href="#loginModal" class="btn btn-info btn-small" data-toggle="modal" data-dismiss="modal">Login</a>
								</div>
                            	<div id="notification" class="alert fade in" style="display:none;" >
									<a href="#" class="close" data-dismiss="alert">&times;</a>
									<span id="notification-msg"></span>
								</div>
								<br>
                 	<form name="signInForm" id="signInForm" action="<c:url value="/signUp" />" method="post">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>UserName</label>
                                <input type="text" class="form-control" placeholder="Name" id="userName" name="userName" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Password" id="password" name="password" required data-validation-required-message="Please enter your password.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        
						 <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Id</label>
                                <input class="form-control" placeholder="Email" id="emailId" name="emailId" required type="email" data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<br>
               			<input type ="hidden" class="form-control col-xs-12" value="ROLE_USER"	id="role" name="role">

						<br><br><br><br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button id="signUpBtn" type="button" class="btn btn-success btn-lg">Register</button>
                            </div>
                        </div>
                    </form>
                         <br><br><br>   
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
    <!-- jQuery -->
    <script src="static/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="static/js/jqBootstrapValidation.js"></script>
    <script src="static/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="static/js/freelancer.js"></script>
    <script src="static/js/signIn.js"></script>

</body>

</html>
