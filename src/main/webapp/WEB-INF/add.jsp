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
                 <form name="addForm" id="addForm">
<%--                  action="<c:url value="/register/add"/>" method="post"> --%>
                 
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                         <h2>Personal Information <a id="per-btn" data-toggle="collapse" data-target="#personalInfo">
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a> 
                         </h2>
                        </div>
                          <br>
                   	 <div class="collapse" id="personalInfo"> 
                   	 	<div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-8 floating-label-form-group controls">
                                <label>Full Name</label>                            
                                <input class="form-control" placeholder="Name" id="name" name="personalInfo[name]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-8 floating-label-form-group controls">
                                <label>Email ID</label>                            
                                <input class="form-control" placeholder="Email Id" id="emailId" name="personalInfo[email]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group col-lg-offset-2 input-group date">
<!-- 							<div class="input-group-addon"><i class="fa fa-calendar"></i></div> -->
                  			<div  class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Date Of Birth</label>                            
                                <input class="form-control pull-right"  type="text" placeholder="Choose Date Of Birth" id="datepicker" name="personalInfo[dob]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Father's Name</label>                            
                                <input class="form-control" placeholder="Father's Name" id="fatherName" name="personalInfo[fatherName]" >
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Mother's Name</label>                            
                                <input class="form-control" placeholder="Mother's Name" id="motherName" name="personalInfo[motherName]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>    
                        <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-4 floating-label-form-group controls">
                              <label >Gender</label>
                                <select class="form-control col-xs-4 " id="gender" name="personalInfo[gender]" >
                               	 	<option selected disabled>Gender</option>
                                	<option value="m">Male</option>
                                	<option value="f">Female</option>
                                	<option value="o">Other</option>
                                </select>
                            </div>
                            <div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>Caste</label>
                                	<select class="form-control col-xs-4"  id="caste" name="personalInfo[caste]" >
                                	<option selected disabled>Caste</option>
                                	 <c:forEach var="caste" items="${castes}">
                                		<option value="${caste.value}">${caste.value}</option>
                                	</c:forEach>
                                </select>
                            </div>
        				</div>             

                      <br><br>
                        <div class="row control-group col-lg-offset-2">
                            <br>
                        	<div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>Marital Status</label>
                                <select class="form-control col-xs-4"  id="maritalStatus" name="personalInfo[maritalStatus]" >
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
                       	    	    <option value="dl">Driving License</option>
                       	    	    <option value="passport">Passport</option>
                       	    	    <option value="aadhar">Aadhar Card</option>
                       	    	    <option value="pan">PAN Card</option>
                                </select>
                            </div>
                        	<div  class="form-group col-xs-4 floating-label-form-group controls">
                            	<label>ID Number</label>                            
                                <input class="form-control" placeholder="ID Number" id="idNumber" name="personalInfo[idNumber]" >
                           </div>
                        </div>
          				<br>
          				<div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Contact Number</label>                            
                                <input class="form-control" placeholder="Contact Number" id="contactNumber1" name="personalInfo[contactNumber]" >
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Other Number</label>                            
                                <input class="form-control" placeholder="Other Number" id="otherNumber" name="personalInfo[contactNumber2]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>    
                    	</div>    
                       </div>
 					
 	
 					<div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Address  <a id="add-btn" data-toggle="collapse" data-target="#addInfo">
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a></h2>
                     	</div>
                     <br>
                     
                      <div class="collapse" id="addInfo"> 
                       <div class="row control-group col-lg-offset-2">
                            <label>Permanent Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" name="permamentAddress[address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6"
									id="state" name="permamentAddress[state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6"
									id="city" name="permamentAddress[city]">
									<option selected disabled>City</option>
									<option value="Nagpur">Nagpur</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" name="permamentAddress[tehsil]" >
							</div>
						</div>
						
						
						<br><br>
                       <div class="row control-group col-lg-offset-2">
                            <label>Temporary Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" name="temporaryAddress[address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6"
									id="state" name="temporaryAddress[state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6"
									id="city" name="temporaryAddress[city]">
									<option selected disabled>City</option>
									<option value="Nagpur">Nagpur</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" name="temporaryAddress[tehsil]" >
							</div>
						</div>
						</div>
 					</div>

                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Qualifications  <a id="qual-btn" data-toggle="collapse" data-target="#qualInfo">
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a></h2>
                     	</div>
                     <br>
                     <div class="collapse" id="qualInfo"> 
                     <div id="qual">
                     <div class="row control-group col-lg-offset-2">
                           <label>Qualification 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Degree</label>                            
                                <select class="form-control col-xs-6"
									id="degree" name="qualifications[][degree]">
									<option selected disabled>Degree</option>
									<option value="Maharashtra">B.A</option>
								</select>
							</div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>College</label>
                                <input class="form-control" placeholder="College" id="college" name="qualifications[][college]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>University</label>
                                <input class="form-control" placeholder="University" id="university" name="qualifications[][university]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Grade</label>
                                <input class="form-control" placeholder="Grade" id="grade" name="qualifications[][grade]" >
                            </div>
                              <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Year</label> 
								<input class="form-control" placeholder="Year" id="yaer" name="qualifications[][year]" >
							</div>
                          </div>
                          <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Subjects</label> 
								<input class="form-control" placeholder="Subjects" id="subjects" name="qualifications[][subjects]" >
							</div>
						</div>
						</div>
						<br><br>
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
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a></h2>
                     	</div>
                     <br>
                     <div class="collapse" id="expInfo"> 
                     <div id="wexp">
                     <div class="row control-group col-lg-offset-2">
                           <label>Job 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Job Title</label>                            
                                <input class="form-control" placeholder="Job Title" id="jobTitle" name="workExperience[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>From</label>
                                <input class="form-control" placeholder="From Date" id="fromDate" name="workExperience[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>To</label>
                                <input class="form-control" placeholder="To Date" id="toDate" name="workExperience[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" id="companyName" name="workExperience[][companyName]" >
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
								<label>State</label> <select class="form-control col-xs-6"
									id="state" name="workExperience[][address][state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6"
									id="city" name="workExperience[][address][city]">
									<option selected disabled>City</option>
									<option value="Nagpur">Nagpur</option>
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
                     </div>
                     <br>
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
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a></h2>
                     	</div>
                     <br>
                     <div class="collapse" id="trainingInfo"> 
                     <div id="train">
                     <div class="row control-group col-lg-offset-2">
                     	
                           <label>Training 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Job Title</label>                            
                                <input class="form-control" placeholder="Job Title" id="jobTitle" name="training[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>From</label>
                                <input class="form-control" placeholder="From Date" id="fromDate" name="training[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>To</label>
                                <input class="form-control" placeholder="To Date" id="toDate" name="training[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" id="companyName" name="training[][companyName]" >
                            </div>
                          </div>
                          <br>
                          <div class="row control-group col-lg-offset-2">
                            <div class="row control-group col-lg-offset-2">
                            <label>Company Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" name="training[][address][address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>State</label> <select class="form-control col-xs-6"
									id="state" name="training[][address][state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group controls">
								<label>City</label> <select class="form-control col-xs-6"
									id="city" name="training[][address][city]">
									<option selected disabled>City</option>
									<option value="Nagpur">Nagpur</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" name="training[][address][tehsil]" >
							</div>
						</div>
						</div>
						
                     </div>
                     <br>
            	          <div class="row control-group col-lg-offset-2">
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
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a></h2>
                     	</div>
                     <br>
                    	<div class="collapse" id="jfInfo"> 
                           <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Type</label> 
								<select  class="form-control col-xs-6" 	id="jobType" name="jobType">
									<option selected disabled>Job Type</option>
									<c:forEach var="jt" items="${jobTypes}">
                                		<option value="${jt.jobType}">${jt.jobType}</option>
                                	</c:forEach>
								</select>
							</div>
						</div>
						</div>
					</div>   

                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Job Preference  <a id="jp-btn" data-toggle="collapse" data-target="#jpInfo">
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a></h2>
                     	</div>
                     <br>
                     <div class="collapse" id="jpInfo"> 
                           <div class="row control-group col-lg-offset-2">
                            <label>Location</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Location 1</label> 
								<select  class="form-control col-xs-6" 	id="location1" name="jobPreferance[location1]">
									<option selected disabled>Location1</option>
									<c:forEach var="city" items="${cities}">
                                		<option value="${city}">${city}</option>
                                	</c:forEach>
								</select>
							</div>
							<div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Location 2</label> 
								<select  class="form-control col-xs-6" 	id="location2" name="jobPreferance[location2]">
									<option selected disabled>Location2</option>
									<c:forEach var="city" items="${cities}">
                                		<option value="${city}">${city}</option>
                                	</c:forEach>
								</select>
							</div>
							<div  class="form-group col-xs-6 floating-label-form-group controls">
								<label>Location 3</label> 
								<select  class="form-control col-xs-6" 	id="location3" name="jobPreferance[location3]">
									<option selected disabled>Location3</option>
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
								<option value="Night">Night Shift</option>
								<option value="Day">Day Shift</option>
								<option value="Anytime">Any Shift</option>
							</select>   
                        	</div>
                        </div>
                        <br>
                     	<div class="row control-group col-lg-offset-2">
  
					   <input type="checkbox" name=jobPreferance[abroad]>Willing to Work Abroad</input>
                        </div>
                        </div>
					</div>   
					                    
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Salary  <a id="sal-btn" data-toggle="collapse" data-target="#salInfo">
                         	<span><i class="toggle-icon fa fa-chevron-down"></i></span></a></h2>
                     	</div>
                     <br>
                    <div class="collapse" id="salInfo"> 
                    <div class="row control-group col-lg-offset-2">
                            <label>Salary</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Current</label>                            
                                <input class="form-control" placeholder="Current Salary" id="currentSalary" name="currentSalary" >
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group controls">
                                <label>Expected</label>
                                <input class="form-control" placeholder="Expected Salary" id="expectedSalary" name="expectedSalary" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>    
                    </div>    
                        <div class="row">
                            <div class="form-group col-xs-12">
                            <br><br><br><br>
                                <button  class="btn btn-success btn-lg" >Add</button>
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

    <!-- Contact Form JavaScript -->
    <script src="/static/js/jqBootstrapValidation.js"></script>
    <script src="/static/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="/static/js/freelancer.min.js"></script>
    
    <script src="/static/js/menu.js"></script>
    <script src="/static/js/add.js"></script>
    <script src="/static/js/jquery.serialize-object.min.js"></script>
    <script src="/static/js/bootstrap-datepicker.js"></script>
	
</body>

</html>
