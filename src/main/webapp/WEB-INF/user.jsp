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

         <jsp:include page="menu.jsp"/>
   		<jsp:include page="header.jsp"/>



 	<div class="container" style="padding:none" id="searchResults">
            <div class="row">
                <div class="modal-body">
                   <h3>Users</h3>
                </div>
 
            <table class="table">
            	<thead>
            		<tr style="font-size: 1.85em;">
            			<th>UserName</th>
            			<th>Email</th>
            			<th>Role</th>
            			<th>Action</th>
            		</tr>
 			</thead>
        	<tbody>
        		<c:forEach var="user" items="${users}">
        		<tr>
					<td>${user.userName}</td>
					<td>${user.emailId}</td>
					<td>${user.role}</td>
					<td>
						<button type="button" class="btn btn-info" onclick="passwdModal(${user.id})">Change Password</button>
						<c:choose>
						<c:when test="${user.enabled == true}">
							<a href="<c:url value="/user/${user.id}/disable" />" class="btn btn-danger">Disable</a>
						</c:when>
						<c:otherwise>
							<a href="<c:url value="/user/${user.id}/enable" />" class="btn btn-success">Enable</a>
						</c:otherwise>
						</c:choose>
					</td>        	
        		</tr>
        		</c:forEach>
        	</tbody>    
            
            </table>
 
        	</div>
   </div>
   
   <div class="container" style="padding:none" id="searchResults">
            <div class="row">
                <div class="modal-body">
                   <a href="#addUser" class="btn btn-info" data-toggle="modal" >Add New User</a>
                </div>
            </div>
 	</div>
 	
 	
 	<div class="portfolio-modal modal fade" id="addUser" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <h2>Add User</h2>
                            <hr class="star-primary">
                 <form name="userAdd" id="userAdd" action='<c:url value="/user/add"/>' method="post">
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
                        <div  class="row control-group col-xs-12 floating-label-form-group controls">
							<label>Role</label> 
							<select  class="form-control col-xs-12" 	id="role" name="role">
									<option selected disabled>Role</option>
									<option value="ROLE_ADMIN">ADMIN</option>
									<option value="ROLE_USER">USER</option>
							</select>
						</div>
					    <br><br><br><br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button id="addBtn" type="submit" class="btn btn-success btn-lg">Add</button>
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
 	
 	 <div class="portfolio-modal modal fade" id="chPwd" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <h2>Change Password</h2>
                            <hr class="star-primary">
                 <form name="chPasswd" id="chPasswdUser" method="post">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input class="form-control" id="userId" name="id" type="hidden">
                                <input type="password" class="form-control" placeholder="New Password" id="userpasswd" name="passwd" required data-validation-required-message="Please enter your New Password.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Change</button>
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
 

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>


  
	<jsp:include page="footer.jsp"/> 
    <!-- jQuery -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/static/js/jqBootstrapValidation.js"></script>
    <script src="/static/js/user.js"></script>
    <script src="/static/js/contact_me.js"></script>
    <script src="/static/js/freelancer.js"></script>
	<script src="/static/js/menu.js"></script>
	
    
</body>

</html>
