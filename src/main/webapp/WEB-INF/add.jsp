<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
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
	<link href="/static/css/datepicker3.css" rel="stylesheet">
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
		
        <div class="container" style="padding:none" id="searchForms">
            <div class="row">
                 <form name="addForm" id="addForm" action="<c:url value="/register/add"/>" method="post">
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                         <h2>Personal Information <a id="per-btn" data-toggle="collapse" data-target="#personalInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a> 
                         </h2>
                        </div>
                   	 <div class="collapse" id="personalInfo"> 
                   	 	<div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-8 floating-label-form-group controls">
                                <label>Full Name</label>                            
                                <input class="form-control" required placeholder="Name" id="name" name="personalInfo[name]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-8 floating-label-form-group controls">
                                <label>Email ID</label>                            
                                <input class="form-control" required type="email" placeholder="Email Id" id="emailId" name="personalInfo[email]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group col-lg-offset-2 input-group">
<!-- 							<div class="input-group-addon"><i class="fa fa-calendar"></i></div> -->
                  			<div  class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Date Of Birth</label>                            
                                <input class="form-control pull-right date"  required type="text" placeholder="Date Of Birth" id="dob" name="personalInfo[dob]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Father's Name</label>                            
                                <input class="form-control" placeholder="Father's Name" required id="fatherName" name="personalInfo[fatherName]" >
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Mother's Name</label>                            
                                <input class="form-control" placeholder="Mother's Name" required id="motherName" name="personalInfo[motherName]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>    
                        <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-4 floating-label-form-group controls">
                              <label >Gender</label>
                                <select class="form-control col-xs-4 " required id="gender" name="personalInfo[gender]" >
                               	 	<option selected disabled>Gender</option>
                                	<option value="Male">Male</option>
                                	<option value="Female">Female</option>
                                	<option value="Other">Other</option>
                                </select>
                            </div>
                            <div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>Religion</label>
                                <select class="form-control col-xs-4"  required id="religion" name="personalInfo[religion]" >
                                	<option selected disabled>Religion</option>
                                	 <c:forEach var="religion" items="${religions}">
                                		<option value="${religion.value}">${religion.value}</option>
                                	</c:forEach>
                                </select>
                            </div>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                            	<label>Category</label>
                                	<select class="form-control col-xs-6"  required id="category" name="personalInfo[category]" >
                                	<option selected disabled>Category</option>
                                	 <c:forEach var="category" items="${categories}">
                                		<option value="${category.value}">${category.value}</option>
                                	</c:forEach>
                                </select>
                            </div>
        				</div>             

                      <br><br>
                        <div class="row control-group col-lg-offset-2">
                            <br>
                        	<div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>Marital Status</label>
                                <select class="form-control col-xs-4"  required id="maritalStatus" name="personalInfo[maritalStatus]" >
                       	    	    <option selected disabled>Marital Status</option>
                        	        <option value="Single">Single</option>
                                	<option value="Married">Married</option>
                                </select>
                            </div>
                        	<div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>Spouse's Name</label>                            
                                <input class="form-control" placeholder="Spouse's Name" id="spouseName" name="personalInfo[spouseName]" >
<!--                                 <p class="help-block text-danger"></p> -->
                           </div>
                        </div>
                        
                        <div class="row control-group col-lg-offset-2">
                            <br>
                        	<div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>ID Type</label>
                                <select class="form-control col-xs-4"  id="idType" name="personalInfo[idType]" >
                       	    	    <option selected disabled>Id Type</option>
                       	    	    <option value="Driving License">Driving License</option>
                       	    	    <option value="Passport">Passport</option>
                       	    	    <option value="Aadhar Card">Aadhar Card</option>
                       	    	    <option value="PAN Card">PAN Card</option>
                                </select>
                            </div>
                        	<div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>ID Number</label>                            
                                <input class="form-control" placeholder="ID Number" id="idNumber" name="personalInfo[idNumber]" required>
                           </div>
                        </div>
          				<br>
          				<div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Contact Number</label>                            
                                <input class="form-control" placeholder="Contact Number" id="contactNumber1" name="personalInfo[contactNumber]" type="number" required>
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Other Number</label>                            
                                <input class="form-control" placeholder="Other Number" id="otherNumber" name="personalInfo[contactNumber2]" type="number">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group col-lg-offset-2">
                        	<label>Total Experience</label>
                        </div>
                        <div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Year</label>                            
                                <input class="form-control" placeholder="Years" id="expYears" name="personalInfo[expYears]" min=0 type="number">
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Months</label>                            
                                <input class="form-control" placeholder="Months" id="expMonths" name="personalInfo[expMonths]" type="number" min=0 max=12>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group col-lg-offset-2">
                        	<input type="checkbox" name=personalInfo[computerSkill] >Do You Have Computer Knowledge?
                        </div>    
                    	</div>    
                       </div>
 					
 	
 					<div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Address  <a id="add-btn" data-toggle="collapse" data-target="#addInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                      <div class="collapse" id="addInfo"> 
                       
                         <div class="row control-group col-lg-offset-2">
                            <label>Temporary Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Address</label> 
								<input class="form-control" required placeholder="Address" id="tmpaddress" name="temporaryAddress[address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="tmpstate" name="temporaryAddress[state]" required>
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="tmpcity" name="temporaryAddress[city]">
									<option selected disabled>City</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tmptehsil" name="temporaryAddress[tehsil]" >
							</div>
						</div>
                       
                <br><br>
           
                       <div class="row control-group col-lg-offset-2">
                            <label>Permanent Address</label>&nbsp;&nbsp; <span><button type="button" class="btn btn-default" id="same">Same As Above</button></span>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Address</label> 
								<input class="form-control" required placeholder="Address" id="praddress" name="permamentAddress[address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="prstate" name="permamentAddress[state]" required>
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="prcity" name="permamentAddress[city]" required>
									<option selected disabled>City</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="prtehsil" name="permamentAddress[tehsil]" >
							</div>
						</div>
						
						</div>
 					</div>

                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Qualifications  <a id="qual-btn" data-toggle="collapse" data-target="#qualInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                     <div class="collapse" id="qualInfo"> 
                     <div id="qual1" style="display:none">
                     <div class="row control-group col-lg-offset-2">
                           <label>Qualification 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Academic Qualification</label>                            
                                <select class="form-control col-xs-6"
									id="degree" name="qualifications[][degree]" required>
									<option selected disabled>Degree</option>
									<c:forEach var="degree" items="${degree}">
										<option value="${degree}">${degree}</option>
									</c:forEach>
								</select>
							</div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>School/College</label>
                                <input class="form-control" placeholder="School/College" id="college" name="qualifications[][college]" required>
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>University</label>
                                <input class="form-control" placeholder="Board/University" id="university" name="qualifications[][university]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Grade</label>
                                <input class="form-control" placeholder="Grade" id="grade" name="qualifications[][grade]" >
                            </div>
                              <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Year</label> 
								<input class="form-control" placeholder="Year of Graduation" id="year" name="qualifications[][passYear]" >
							</div>
                          </div>
                          <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Subjects</label> 
								<input class="form-control" placeholder="Subjects" id="subjects" name="qualifications[][subjects]" >
							</div>
						</div><br><br>
						</div>
						
    					<div class="row col-lg-offset-2">
                            <div  class="form-group col-xs-12 ">
								<button type="button" class="btn btn-info" id="qualAdd" onclick="addQualification()">Add Qualification</button>
								<button type="button" class="btn btn-primary" id="qualDelbtn" onclick="removeQualification()">Remove Qualification</button>
							</div>
						</div>
                     </div>
                     </div>
                                          
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Work Experience  <a id="exp-btn" data-toggle="collapse" data-target="#expInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                     <div class="collapse" id="expInfo"> 
                     <div id="wexp1" style="display:none">
                     <div class="row control-group col-lg-offset-2">
                           <label>Job 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Job Title</label>                            
                                <input class="form-control" placeholder="Job Title" id="jobTitle" name="workExperience[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2 input-group">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>From</label>
                                <input class="form-control pull-right date" placeholder="From Date" id="fromDate1" name="workExperience[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>To</label>
                                <input class="form-control pull-right date" placeholder="To Date" id="toDate1" name="workExperience[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" id="companyName" name="workExperience[][company]" >
                            </div>
                          </div>
                          <br>
                          <div class="row control-group col-lg-offset-2">
                            <div class="row control-group col-lg-offset-2">
                            <label>Company Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" name="workExperience[][address][address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="workExperience[][address][state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="workExperience[][address][city]">
									<option selected disabled>City</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" name="workExperience[][address][tehsil]" >
							</div>
						</div>
                     </div>
                     <br>
                     </div>
                     
                     	<div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 ">
                   			<button type="button" class="btn btn-info" onclick="addWorkExp()">Add Job</button>
								<button type="button" id="wexpDelbtn" class="btn btn-primary" onclick="removeWorkExp()">Remove Job</button>
							</div>
						</div>
					</div>
                   </div>    

                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Training  <a id="training-btn" data-toggle="collapse" data-target="#trainingInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                     <div class="collapse" id="trainingInfo"> 
                     <div id="train1" style="display:none">
                     <div class="row control-group col-lg-offset-2">
                     	
                           <label>Training 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Job Title</label>                            
                                <input class="form-control"  placeholder="Job Title" id="jobTitle" name="training[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>From</label>
                                <input class="form-control pull-right date" placeholder="From Date" id="trfromDate1" name="training[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>To</label>
                                <input class="form-control pull-right date" placeholder="To Date" id="trtoDate1" name="training[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" required id="companyName" name="training[][company]" >
                            </div>
                          </div>
                          <br>
                          <div class="row control-group col-lg-offset-2">
                            <div class="row control-group col-lg-offset-2">
                            <label>Company Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Address</label> 
								<input class="form-control"  placeholder="Address" id="address" name="training[][address][address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="training[][address][state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="training[][address][city]">
									<option selected disabled>City</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" name="training[][address][tehsil]" >
							</div>
						</div>
						</div><br>						
                     </div>
                     
            	         <div class="row control-group col-lg-offset-2" id="trAddRemDiv">
                            <div  class="col-xs-6 ">
								<button type="button" id="trAddbtn" class="btn btn-info" onclick="addTraining()">Add Training</button>
								<button type="button" id="trDelbtn" class="btn btn-primary" onclick="removeTraining()" >Remove Training</button>
							</div>	
						</div>
                    
                     </div>
                     
                   </div>

                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Job Function  <a id="jf-btn" data-toggle="collapse" data-target="#jfInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                    	<div class="collapse" id="jfInfo"> 
                           <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Type</label> 
								<select  class="form-control col-xs-6" 	id="jobType" name="jobType">
									<option selected disabled>Job Type</option>
									<c:forEach var="jt" items="${jobTypes}">
                                		<option value="${jt}">${jt.jobType}</option>
                                	</c:forEach>
								</select>
							</div>
						</div>
						</div>
					</div>   

                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Job Preference  <a id="jp-btn" data-toggle="collapse" data-target="#jpInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                     <div class="collapse" id="jpInfo"> 
                           <div class="row control-group col-lg-offset-2">
                            <label>Location</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Location 1</label> 
								<select  class="form-control col-xs-6" 	id="location1" name="jobPreferance[location1]">
									<option selected disabled>City1</option>
									<c:forEach var="city" items="${cities}">
                                		<option value="${city}">${city}</option>
                                	</c:forEach>
								</select>
							</div>
							<div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Location 2</label> 
								<select  class="form-control col-xs-6" 	id="location2" name="jobPreferance[location2]">
									<option selected disabled>City2</option>
									<c:forEach var="city" items="${cities}">
                                		<option value="${city}">${city}</option>
                                	</c:forEach>
								</select>
							</div>
							<div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Location 3</label> 
								<select  class="form-control col-xs-6" 	id="location3" name="jobPreferance[location3]">
									<option selected disabled>City3</option>
									<c:forEach var="city" items="${cities}">
                                		<option value="${city}">${city}</option>
                                	</c:forEach>
								</select>
							</div>
						</div><br>
						<div class="row control-group col-lg-offset-2">
							<div class="form-group col-xs-6 floating-label-form-group controls">
    						<select  class="form-control col-xs-6" 	id="shift" name="jobPreferance[shift]">
								<option selected disabled>Shift</option>
								<option value="NIGHT">Night Shift</option>
								<option value="DAY">Day Shift</option>
								<option value="ANY">Any Shift</option>
							</select>   
                        	</div>
                        </div>
                        <br>
                     	<div class="row control-group col-lg-offset-2">
  
					   <input type="checkbox" name=jobPreferance[abroad] >Willing to Work Abroad
                        </div>
                        </div>
					</div>   
					                    
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Salary  <a id="sal-btn" data-toggle="collapse" data-target="#salInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                    <div class="collapse" id="salInfo"> 
                    <div class="row control-group col-lg-offset-2">
                            <label>Salary</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Current</label>                            
                                <input class="form-control" required type="number" placeholder="Current Salary (p.a)" id="currentSalary" name="personalInfo[currentSalary]" >
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Expected</label>
                                <input class="form-control" required type="number" placeholder="Expected Salary (p.a)" id="expectedSalary" name="personalInfo[expectedSalary]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>    
                    </div>    
                        <div class="row">
                            <div class="form-group col-xs-12">
                            <br><br><br>
                               	<button type="button" class="btn btn-success btn-lg" id="addBtn">Register</button>
                            </div>
                        </div>
                    </form>
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
    <script src="/static/vendor/jquery/jquery.validate.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>


    <!-- Theme JavaScript -->
    <script src="/static/js/freelancer.js"></script>
    <script src="/static/js/menu.js"></script>
    <script src="/static/js/add.js"></script>
    <script src="/static/js/jquery.serialize-object.min.js"></script>
	
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</body>

</html>
