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
                   <h3>Job Seekers</h3>
                </div>
 
            <table class="table">
            	<thead>
            		<tr style="font-size: 1.85em;">
            			<th>Reg. ID</th>
            			<th>Name</th>
            			<th>Age</th>
            			<th>Contact</th>
            			<th>Action</th>
            		</tr>
 			</thead>
        	<tbody>
        		<tr>
					<td>1</td>
					<td>ABC</td>
					<td>23</td>
					<td>123</td>
					<td><button class="btn btn-info">View Details</button></td>        	
        		</tr>
        		<tr>
					<td>2</td>
					<td>ABC</td>
					<td>23</td>
					<td>123</td>
					<td><button class="btn btn-info">View Details</button></td>        	
        		</tr>
        		<tr>
					<td>3</td>
					<td>ABC</td>
					<td>23</td>
					<td>123</td>
					<td><button class="btn btn-info">View Details</button></td>        	
        		</tr>
        	</tbody>    
            
            </table>
 
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
    <script src="static/js/jqBootstrapValidation.js"></script>
    <script src="static/js/contact_me.js"></script>
    <script src="static/js/freelancer.min.js"></script>
	<script src="static/js/menu.js"></script>
	
    
</body>

</html>
