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
	<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
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
	<br>
	<div class="container ">
		<div class="row">
			<div class="well well-sm">
				<form id="searchByIdForm" method="post">
				    <div align="center">
                     <label>Search By ID :</label>&nbsp;&nbsp;                            
                     <input placeholder=" Registeration ID" name="regID" id="regID">
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <button id="idBtn" type="submit" class="btn btn-small btn-info" >Go!</button>    
                     </div>
				</form>
			</div>
		</div>
	</div>
	<div class="container " style="padding:none" id="searchForms">
            <div class="row">
                 <form name="searchForm" id="searchForm" action="<c:url value="/search/getResult"/>" method="post">
                 
                    <div class="col-lg-8 ">
                        <div class="modal-body" >
                            <h2>Personal Information <a id="per-btn" data-toggle="collapse" data-target="#personalInfo"><span><i class="toggle-icon fa fa-chevron-right"></i></span></a> </h2>
                        
                          <br>
                        <div class="collapse" id="personalInfo">  
                   	 	<div class="row control-group col-lg-offset-2">
                            <label>Age</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Minimum Age</label>                            
                                <input class="form-control" placeholder="Minimum Age" type="number" id="minAge" name="minAge" >
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls" style="float:right">
                                <label>Maximum Age</label>
                                <input class="form-control" placeholder="Maximum Age" type="number" id="maxAge" name="maxAge" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                       
                       <br><br>
                       <div class="row control-group col-lg-offset-2">
                            <label>Location</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6"
									id="state" name="state">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
                                		<option value="${state}">${state}</option>
                                	</c:forEach>
								</select>
								<p class="help-block text-danger"></p>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6"
									id="city" name="city">
									<option selected disabled>City</option>
								</select>
								<p class="help-block text-danger"></p>
							</div>
						</div>   
                        <br><br>
                        <div class="row control-group col-lg-offset-2">
                            <label>Other</label>
                            <br>
                            <div  class="form-group col-xs-4 floating-label-form-group controls">
                                <label >Gender</label>
                                <select class="form-control col-xs-4"  id="gender" name="gender" >
                                <option selected disabled>Gender</option>
                                <option value="m">Male</option>
                                <option value="f">Female</option>
                                <option value="o">Other</option>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>Caste</label>
                                <select class="form-control col-xs-4"  id="caste" name="caste" >
                                <option selected disabled>Caste</option>
                                <c:forEach var="caste" items="${castes}">
                                	<option value="${caste}">${caste.value}</option>
                                </c:forEach>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                        	<div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>Marital Status</label>
                                <select class="form-control col-xs-4"  id="maritalStatus" name="maritalStatus" >
                                <option selected disabled>Marital Status</option>
                                <option value="Single">Single</option>
                                <option value="Married">Married</option>
                                
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                         </div>
                       </div>
                       </div>
 
 
 					<div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Education <a id="edu-btn" data-toggle="collapse" data-target="#eduInfo"><span><i class="toggle-icon fa fa-chevron-right"></i></span></a> </h2>
                     <br>
                     <div class="collapse" id="eduInfo"> 
                       <div class="row control-group col-lg-offset-2">
                            <label>List Qualification</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Qualifications</label> 
								<select  class="form-control col-xs-6" 	multiple="multiple" id="qualifications" name="qualifications">
								<c:forEach var="degree" items="${degree}">
									<option value="${degree}">${degree}</option>
								</c:forEach>
								</select>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						 </div>
						 </div>
 					</div>
                       
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Experience  <a id="exp-btn" data-toggle="collapse" data-target="#expInfo"><span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	
                     <br>
                    <div class="collapse" id="expInfo">
                    <div class="row control-group col-lg-offset-2">
                            <label>Years</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Minimum</label>                            
                                <input class="form-control" placeholder="Minimum Experience"  type="number" id="minAge" name="minExp" >
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls" style="float:right">
                                <label>Maximum</label>
                                <input class="form-control" placeholder="Maximum Experience" type="number" id="maxExp" name="maxExp" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                      </div>
                     </div>
                    </div>   
                       
                    <div class="col-lg-12 ">
                        <div class="modal-body">
                            <h2>Job Function <a id="jf-btn" data-toggle="collapse" data-target="#jfInfo"><span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     <br>
                    <div class="collapse" id="jfInfo">
                           <div class="row control-group col-lg-offset-1">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Type</label> 
								<select  class="form-control col-xs-12" 	id="jobType" name="jobType">
									<option selected disabled>Job Type</option>
									<c:forEach var="jt" items="${jobTypes}">
                                	<option value="${jt}">${jt.jobType}</option>
                                </c:forEach>
								</select>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						</div>
						</div>
					</div>   
                    
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Salary <a id="sal-btn" data-toggle="collapse" data-target="#salInfo"><span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	
                     <br>
                     <div class="collapse" id="salInfo">
                    <div class="row control-group col-lg-offset-2">
                            <label>Salary</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Minimum</label>                            
                                <input class="form-control" placeholder="Minimum Salary" type="number" id="minSal" name="minSal" >
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls" style="float:right">
                                <label>Maximum</label>
                                <input class="form-control" placeholder="Maximum Salary" type="number" id="maxSal" name="maxSal" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        </div>
                        </div>
                    </div>    
                        
                        <div class="row">
                            <div class="form-group col-xs-12">
                            <br><br><br><br>
                                <button type="submit" class="btn btn-success btn-lg">Search</button>
                            </div>
                        </div>
                    </form>
                  </div>
          </div>
           
    <br><br><br>                
	<c:if test="${not empty result}">
 	<div class="container"  id="searchResults">
            <div class="row">
                <div class="modal-body">
                   <h3>Search Results </h3>
                </div>
 
            <table class="table">
            	<thead>
            		<tr style="font-size: 1.85em;">
            			<th>Reg. ID</th>
            			<th>Name</th>
            			<th>Contact</th>
            			<th>Action</th>
            		</tr>
 			</thead>
        	<tbody>
        	<c:forEach var="item" items="${result}">
        		<tr>
					<td>${item.registrationId}</td>
					<td>${item.name}</td>
					<td>${item.contactNumber}</td>
					<td><button type="button" class="btn btn-info" onclick="getData(${item.registrationId});">View Details</button></td>        	
        		</tr>
      		</c:forEach>
        	</tbody>    
            </table>
        	</div>
   </div>
	</c:if>
	
	
	<div class="portfolio-modal modal fade" id="viewModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <h4 id="regId"></h4>
            <div class="close-modal" data-dismiss="modal">
                
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <br>
			<div id="content">
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
	<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/static/js/jqBootstrapValidation.js"></script>
    <script src="/static/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="/static/js/freelancer.js"></script>
    <script src="/static/js/collapse.js"></script>
    <script src="/static/js/menu.js"></script>
    <script src="/static/js/search.js"></script>

</body>

</html>
