<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
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
	
        <div class="container" style="padding:none" id="searchForms">
    <h5>Registration ID : ${data.registrationId}</h5>
            <div class="row">
            
                 <form name="editForm" id="editForm">
<%--                  action="<c:url value="/register/add"/>" method="post"> --%>
                 
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                         <h2>Personal Information <a id="per-btn" data-toggle="collapse" data-target="#personalInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a> 
                         </h2>
                        </div>
                          <br>
                   	 <div class="collapse" id="personalInfo"> 
                   	 	<div class="row control-group col-lg-offset-2">
                   	 	<input type="hidden" name="personalInfo[registrationId]" value="${data.registrationId}">
                            <div  class="form-group col-xs-8 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Full Name</label>                            
                                <input class="form-control" placeholder="Name" id="name" value="${data.name}" name="personalInfo[name]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-8 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Email ID</label>                            
                                <input class="form-control" placeholder="Email Id" id="emailId" value="${data.email}" name="personalInfo[email]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group col-lg-offset-2 ">
<!-- 							<div class="input-group-addon"><i class="fa fa-calendar"></i></div> -->
                  			<div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Date Of Birth</label>                            
                                <input class="form-control pull-right date"  value="${data.dob}" type="text" placeholder="Date Of Birth" id="dob" name="personalInfo[dob]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Father's Name</label>                            
                                <input class="form-control" placeholder="Father's Name" id="fatherName" value="${data.fatherName}" name="personalInfo[fatherName]" >
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Mother's Name</label>                            
                                <input class="form-control" placeholder="Mother's Name" id="motherName" value="${data.motherName}" name="personalInfo[motherName]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>    
                        <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-4 floating-label-form-group floating-label-form-group-with-value controls">
                              <label >Gender</label>
                                <select class="form-control col-xs-4 " id="gender" name="personalInfo[gender]" >
                               	 	<c:choose>
                                	 	<c:when test="${data.gender == 'm'}">
                                	 	<option selected value="m">Male</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option value="m">Male</option>
                                		</c:otherwise>
                                		</c:choose>
                                		<c:choose>
                                	 	<c:when test="${data.gender == 'f'}">
                                	 		<option selected value="f">Female</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option value="f">Female</option>
                                		</c:otherwise>
                                		</c:choose>	<c:choose>
                                	 	<c:when test="${data.gender == 'o'}">
                                	 		<option selected value="o">Other</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option value="o">Other</option>
                                		</c:otherwise>
                                		</c:choose>
                                </select>
                            </div>
                            <div  class="form-group col-xs-4 floating-label-form-group floating-label-form-group-with-value controls">
                            	<label>Caste</label>
                                	<select class="form-control col-xs-4"  id="caste" name="personalInfo[caste]" >
                                	 <c:forEach var="caste" items="${castes}">
                                	 	<c:choose>
                                	 	<c:when test="${caste.value == data.caste.value}">
                                			<option selected value="${caste.value}">${caste.value}</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option  value="${caste.value}">${caste.value}</option>
                                		</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </select>
                            </div>
        				</div>             

                      <br><br>
                        <div class="row control-group col-lg-offset-2">
                            <br>
                        	<div  class="form-group col-xs-4 floating-label-form-group floating-label-form-group-with-value controls">
                            	<label>Marital Status</label>
                                <select class="form-control col-xs-4"  id="maritalStatus" name="personalInfo[maritalStatus]" >
                       	    	    <c:choose>
                                	 	<c:when test="${data.maritalStatus == 'Single'}">
                                	 	<option selected value="Single">Single</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option value="Single">Single</option>
                                		</c:otherwise>
                                		</c:choose>
                                		  <c:choose>
                                	 	<c:when test="${data.maritalStatus == 'Married'}">
                                	 		<option selected value="Married">Married</option>
                                		</c:when>
                                		<c:otherwise>
                                			<option value="Married">Married</option>
                                		</c:otherwise>
                                		</c:choose>
                                	
                                </select>
                            </div>
                        	<div  class="form-group col-xs-4 floating-label-form-group floating-label-form-group-with-value controls">
                            	<label>Spouse's Name</label>                            
                                <input class="form-control" placeholder="Spouse's Name" id="spouseName" value="${spouseName}" name="personalInfo[spouseName]" >
<!--                                 <p class="help-block text-danger"></p> -->
                           </div>
                        </div>
                        
                        <div class="row control-group col-lg-offset-2">
                            <br>
                        	<div  class="form-group col-xs-4 floating-label-form-group floating-label-form-group-with-value controls">
                            	<label>ID Type</label>
                                <select class="form-control col-xs-4"  id="idType" name="personalInfo[idType]" >
                       	    	    <option selected value="${data.idType}">${data.idType}</option>
                       	    	    <option value="dl">Driving License</option>
                       	    	    <option value="passport">Passport</option>
                       	    	    <option value="aadhar">Aadhar Card</option>
                       	    	    <option value="pan">PAN Card</option>
                                </select>
                            </div>
                        	<div  class="form-group col-xs-4 floating-label-form-group floating-label-form-group-with-value controls">
                            	<label>ID Number</label>                            
                                <input class="form-control" placeholder="ID Number" id="idNumber" value="${data.idNumber}" name="personalInfo[idNumber]" >
                           </div>
                        </div>
          				<br>
          				<div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Contact Number</label>                            
                                <input class="form-control" placeholder="Contact Number" id="contactNumber1" value="${data.contactNumber}" name="personalInfo[contactNumber]" >
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Other Number</label>                            
                                <input class="form-control" placeholder="Other Number" id="otherNumber" value="${data.contactNumber2}" name="personalInfo[contactNumber2]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group col-lg-offset-2">
                        	<label>Total Experience</label>
                        </div>
                        <div class="row control-group col-lg-offset-2">
                        	<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Year</label>                            
                                <input class="form-control" type="number" placeholder="Years" id="expYears" value="<fmt:formatNumber type = "number" 
          maxFractionDigits = "0" value = "${(data.totalExperience - (data.totalExperience%12)) /12}" />" name="personalInfo[expYears]" >
                                <p class="help-block text-danger"></p>
                            </div>
                           	<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Months</label>                            
                                <input class="form-control" placeholder="Months" id="expMonths" value="${data.totalExperience%12}" name="personalInfo[expMonths]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group col-lg-offset-2">
                        	<c:if test="${data.computerSkill == true }">
                        		<input type="checkbox"  checked name=personalInfo[computerSkill] >Computer Proficient
                        	</c:if>
                        	<c:if test="${data.computerSkill == false }">
                        		<input type="checkbox"  name=personalInfo[computerSkill] >Computer Proficient
                        	</c:if>	
                        </div>    
                    	</div>    
                       </div>
 					
 	
 					<div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Address  <a id="add-btn" data-toggle="collapse" data-target="#addInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                     <br>
                      <input type="hidden" value="${data.permanentAddress.id}" name="permamentAddress[id]">
                      <div class="collapse" id="addInfo"> 
                       <div class="row control-group col-lg-offset-2">
                            <label>Permanent Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" value="${data.permanentAddress.address}" name="permamentAddress[address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="permamentAddress[state]">
									<c:forEach var="state" items="${states}">
									<c:choose>
									<c:when test="${state == data.permanentAddress.state }">
										<option selected value="${state}">${state}</option>
									</c:when>
									<c:otherwise>
										<option value="${state}">${state}</option>
									</c:otherwise>
									</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="permamentAddress[city]">
									<option selected value="${data.permanentAddress.city}">${data.permanentAddress.city}</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" value="${data.permanentAddress.tehsil}" name="permamentAddress[tehsil]" >
							</div>
						</div>
						
						
						<br><br>
                       <div class="row control-group col-lg-offset-2">
                            <label>Temporary Address</label>
                            <br>
                            <input type="hidden" value="${data.temporaryAddress.id}" name="temporaryAddress[id]">
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" value="${data.temporaryAddress.address}" name="temporaryAddress[address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="temporaryAddress[state]">
									<c:forEach var="state" items="${states}">
									<c:choose>
									<c:when test="${state == data.temporaryAddress.state }">
										<option selected value="${state}">${state}</option>
									</c:when>
									<c:otherwise>
										<option value="${state}">${state}</option>
									</c:otherwise>
									</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="temporaryAddress[city]">
									<option selected value="${data.temporaryAddress.city}">${data.temporaryAddress.city}</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" value="${data.temporaryAddress.tehsil}" name="temporaryAddress[tehsil]" >
							</div>
						</div>
						</div>
 					</div>

                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Qualifications  <a id="qual-btn" data-toggle="collapse" data-target="#qualInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                     <br>
                     <div class="collapse" id="qualInfo"> 
                     <c:set var="qualIndex" value="0" />
                     <c:forEach var="qual" items="${data.qualifications}" varStatus="loop">
                     <c:set var="qualIndex" value="${qualIndex+1}" />
                     <div id="qual${qualIndex}">
                     <input type="hidden" value="${qual.id}" id="qualid" name="qualifications[][id]">                          
                     <div class="row control-group col-lg-offset-2">
                           <label>Qualification ${loop.index+1}</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Degree</label>                            
                                <select class="form-control col-xs-6"
									id="degree" name="qualifications[][degree]">
									<option selected disabled>Degree</option>
									<c:forEach var="degree" items="${degree}">
									<c:choose>
									<c:when test="${degree == qual.degree }">	
										<option selected value="${degree}">${degree}</option>
									</c:when>
									<c:otherwise>
										<option value="${degree}">${degree}</option>
									</c:otherwise>
									</c:choose>
									</c:forEach>
								</select>
							</div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>College</label>
                                <input class="form-control" value="${qual.college}" placeholder="College" id="college" name="qualifications[][college]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>University</label>
                                <input class="form-control" placeholder="University" value="${qual.university}" id="university" name="qualifications[][university]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Grade</label>
                                <input class="form-control" placeholder="Grade" id="grade" value="${qual.grade}" name="qualifications[][grade]" >
                            </div>
                              <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Year</label> 
								<input class="form-control" placeholder="Year" id="year" value="${qual.passYear}" name="qualifications[][passYear]" >
							</div>
                          </div>
                          <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Subjects</label> 
								<input class="form-control" placeholder="Subjects" id="subjects" value="${qual.subjects}" name="qualifications[][subjects]" >
							</div>
						</div><br><br>
						</div>
						</c:forEach>
						<c:if test="${qualIndex==0}">
						<c:set var="qualIndex" value="${qualIndex+1}" />
						<div id="qual1">
                     	<div class="row control-group col-lg-offset-2">
                           <label>Qualification 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Degree</label>                            
                                <select class="form-control col-xs-6"
									id="degree" name="qualifications[][degree]">
									<option selected disabled>Degree</option>
									<c:forEach var="degree" items="${degree}">
										<option value="${degree}">${degree}</option>
									</c:forEach>
								</select>
							</div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>College</label>
                                <input class="form-control" placeholder="College" id="college" name="qualifications[][college]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>University</label>
                                <input class="form-control" placeholder="University" id="university" name="qualifications[][university]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Grade</label>
                                <input class="form-control" placeholder="Grade" id="grade" name="qualifications[][grade]" >
                            </div>
                              <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Year</label> 
								<input class="form-control" placeholder="Year" id="yaer" name="qualifications[][passYear]" >
							</div>
                          </div>
                          <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Subjects</label> 
								<input class="form-control" placeholder="Subjects" id="subjects" name="qualifications[][subjects]" >
							</div>
						</div><br><br>
						</div>
						</c:if>
						<input type="hidden" id="qualIndex" value="${qualIndex}">
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
                     <br>
                     <div class="collapse" id="expInfo"> 
                     <c:set var="wexIndex" value="0" />
                     <c:forEach var="wexp" items="${data.workExp}" varStatus="loop">
                     <c:if test="${wexp.training != true}">
                     <c:set var="wexIndex" value="${wexIndex+1}"/>
                     <div id="wexp${wexIndex}">
                     <div class="row control-group col-lg-offset-2">
                           <label>Job ${wexIndex}</label>
                           <input type="hidden" value="${wexp.id}" id="wexid" name="workExperience[][id]">
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Job Title</label>                            
                                <input class="form-control" placeholder="Job Title" id="jobTitle" value="${wexp.jobTitle}" name="workExperience[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>From</label>
                                <input class="form-control pull-right date" placeholder="From Date" value="${wexp.fromDate}" id="fromDate1" name="workExperience[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>To</label>
                                <input class="form-control pull-right date" placeholder="To Date" id="toDate1" value="${wexp.toDate}" name="workExperience[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" id="companyName" value="${wexp.company}" name="workExperience[][company]" >
                            </div>
                          </div>
                          <br>
                          <div class="row control-group col-lg-offset-2">
                            <div class="row control-group col-lg-offset-2">
                            <label>Company Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" value="${wexp.address.address}" name="workExperience[][address][address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="workExperience[][address][state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
									<c:choose>
									<c:when test="${state == wexp.address.state }">
										<option selected value="${state}">${state}</option>
									</c:when>
									<c:otherwise>
										<option value="${state}">${state}</option>
									</c:otherwise>
									</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="workExperience[][address][city]">
									<option selected value="${wexp.address.city}">${wexp.address.city}</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" value="${wexp.address.tehsil}" name="workExperience[][address][tehsil]" >
							</div>
						</div>
                     </div>
                     </div>
                     </c:if>
                     </c:forEach>
                     <c:if test="${wexIndex == 0 }">
                     <c:set var="wexIndex" value="${wexIndex+1}" />
                     <div id="wexp1">
                     <div class="row control-group col-lg-offset-2">
                           <label>Job 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Job Title</label>                            
                                <input class="form-control" placeholder="Job Title" id="jobTitle" name="workExperience[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>From</label>
                                <input class="form-control pull-right date" placeholder="From Date" id="fromDate1" name="workExperience[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>To</label>
                                <input class="form-control pull-right date" placeholder="To Date" id="toDate1" name="workExperience[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" id="companyName" name="workExperience[][company]" >
                            </div>
                          </div>
                          <br>
                          <div class="row control-group col-lg-offset-2">
                            <div class="row control-group col-lg-offset-2">
                            <label>Company Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" name="workExperience[][address][address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="workExperience[][address][state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="workExperience[][address][city]">
									<option selected disabled>City</option>
									<option value="Nagpur">Nagpur</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" name="workExperience[][address][tehsil]" >
							</div>
						</div>
					     </div>
                     </div>
                     </c:if>
                     <input type="hidden" value="${wexIndex}" id="wexIndex">
                     	<div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 ">
                            <br><br><br>
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
                     <br>
                     <div class="collapse" id="trainingInfo"> 
                     <c:set var="trIndex" value="0"/>
                     
                     <c:forEach var="train" items="${data.workExp}" varStatus="loop">
                     <c:if test="${train.training == true }">
                     <c:set var="trIndex" value="${trIndex+1 }"/>
                     <div id="train${trIndex}">
                     <div class="row control-group col-lg-offset-2">
                     	
                           <label>Training ${trIndex }</label>
                           <input type="hidden" value="${train.id}" id="trid" name="training[][id]">
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Job Title</label>                            
                                <input class="form-control" placeholder="Job Title" id="jobTitle" value="${train.jobTitle}" name="training[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2 ">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>From</label>
                                <input class="form-control pull-right date" placeholder="From Date" value="${train.fromDate}" id="trfromDate1" name="training[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>To</label>
                                <input class="form-control pull-right date" placeholder="To Date" value="${train.toDate}" id="trtoDate1" name="training[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" id="companyName" value="${train.company}" name="training[][company]" >
                            </div>
                          </div>
                          <br>
                          <div class="row control-group col-lg-offset-2">
                            <div class="row control-group col-lg-offset-2">
                            <label>Company Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" value="${train.address.address}" name="training[][address][address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="training[][address][state]">
									<c:forEach var="state" items="${states}">
									<c:choose>
									<c:when test="${state == train.address.state }">
										<option selected value="${state}">${state}</option>
									</c:when>
									<c:otherwise>
										<option value="${state}">${state}</option>
									</c:otherwise>
									</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="training[][address][city]">
									<option selected value="${train.address.city}">${train.address.city}</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" value="${train.address.tehsil}" name="training[][address][tehsil]" >
							</div>
						</div>
						</div>						
                     </div>
                     </c:if>
                     </c:forEach>
                     <c:if test="${trIndex==0 }">
                     <div id="train1">
                     <c:set var="trIndex" value="${trIndex+1 }"/>
                     <div class="row control-group col-lg-offset-2">
                     	
                           <label>Training 1</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Job Title</label>                            
                                <input class="form-control" placeholder="Job Title" id="jobTitle" name="training[][jobTitle]" >
                            </div>
                         </div>
                          <div class="row control-group col-lg-offset-2 ">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>From</label>
                                <input class="form-control pull-right date" placeholder="From Date" id="trfromDate1" name="training[][fromDate]" >
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>To</label>
                                <input class="form-control pull-right date" placeholder="To Date" id="trtoDate1" name="training[][toDate]" >
                            </div>
                          </div> 
                          <div class="row control-group col-lg-offset-2">
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Company Name</label>
                                <input class="form-control" placeholder="Company Name" id="companyName" name="training[][company]" >
                            </div>
                          </div>
                          <br>
                          <div class="row control-group col-lg-offset-2">
                            <div class="row control-group col-lg-offset-2">
                            <label>Company Address</label>
                            <br>
                            <div  class="form-group col-xs-12 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Address</label> 
								<input class="form-control" placeholder="Address" id="address" name="training[][address][address]" >
							</div>
						</div>
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>State</label> <select class="form-control col-xs-6 state"
									id="state" name="training[][address][state]">
									<option selected disabled>State</option>
									<c:forEach var="state" items="${states}">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>City</label> <select class="form-control col-xs-6 city"
									id="city" name="training[][address][city]">
									<option selected disabled>City</option>
								</select>
							</div>
						</div>   
                       <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Tehsil/Taluka</label> 
								<input class="form-control" placeholder="Tehsil / Taluka" id="tehsil" name="training[][address][tehsil]" >
							</div>
						</div>
						</div>						
                     </div>
                     </c:if>
                     <input type="hidden" value="${trIndex}" id="trIndex">
            	         <div class="row control-group col-lg-offset-2" id="trAddRemDiv">
                            <br><br><br>
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
                     <br>
                    	<div class="collapse" id="jfInfo"> 
                           <div class="row control-group col-lg-offset-2">
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Type</label> 
								<select  class="form-control col-xs-6" 	id="jobType" name="jobType">
									<option value="">Job Type</option>
									<c:forEach var="jt" items="${jobTypes}">
                                	<c:choose>
                                	<c:when test="${jt == data.jobRequirement }">
                                		<option selected value="${jt}">${jt.jobType}</option>
                                	</c:when>
                                	<c:otherwise>
                                		<option value="${jt}">${jt.jobType}</option>
                                	</c:otherwise>
                                	</c:choose>
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
                     <br>
<%--                      <input type="hidden" value="${data.preferance.id}" name="jobPreferance[id]"> --%>
                     <div class="collapse" id="jpInfo"> 
                           <div class="row control-group col-lg-offset-2">
                            <label>Location</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Location 1</label> 
								<select  class="form-control col-xs-6" 	id="location1" name="jobPreferance[location1]">
									<c:forEach var="city" items="${cities}">
                                	<c:choose>
                                	<c:when test="${city == data.preferance.location1 }">
                                		<option selected value="${city}">${city}</option>
                                	</c:when>
                                	<c:otherwise>
                                		<option value="${city}">${city}</option>
                                	</c:otherwise>
                                	</c:choose>
                                	</c:forEach>
								</select>
							</div>
							<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Location 2</label> 
								<select  class="form-control col-xs-6" 	id="location2" name="jobPreferance[location2]">
									<c:forEach var="city" items="${cities}">
                                	<c:choose>
                                	<c:when test="${city == data.preferance.location2 }">
                                		<option selected value="${city}">${city}</option>
                                	</c:when>
                                	<c:otherwise>
                                		<option value="${city}">${city}</option>
                                	</c:otherwise>
                                	</c:choose>
                                	</c:forEach>
								</select>
							</div>
							<div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
								<label>Location 3</label> 
								<select  class="form-control col-xs-6" 	id="location3" name="jobPreferance[location3]">
									<c:forEach var="city" items="${cities}">
                                	<c:choose>
                                	<c:when test="${city == data.preferance.location3 }">
                                		<option selected value="${city}">${city}</option>
                                	</c:when>
                                	<c:otherwise>
                                		<option value="${city}">${city}</option>
                                	</c:otherwise>
                                	</c:choose>
                                	</c:forEach>
								</select>
							</div>
						</div><br>
						<div class="row control-group col-lg-offset-2">
							<div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
    						<select  class="form-control col-xs-6" 	id="shift" name="jobPreferance[shift]">
								<option value="">Shift</option>
								<c:if test="${data.preferance.shift == 'NIGHT' }">
									<option selected value="NIGHT">Night Shift</option>
									<option value="DAY">Day Shift</option>
									<option value="ANY">Any Shift</option></c:if>
								<c:if test="${data.preferance.shift == 'DAY' }">
									<option selected value="DAY">Day Shift</option>
									<option selected value="NIGHT">Night Shift</option>
									<option selected value="ANY">Any Shift</option></c:if>
								<c:if test="${data.preferance.shift == 'ANY' }">
									<option selected value="ANY">Any Shift</option>
									<option value="DAY">Day Shift</option>
									<option value="NIGHT">Night Shift</option>
								</c:if>
							</select>   
                        	</div>
                        </div>
                        <br>
                     	<div class="row control-group col-lg-offset-2">
  						<c:if test="${data.preferance.abroad == true }">
  							<input type="checkbox" checked name=jobPreferance[abroad] >Willing to Work Abroad
  						</c:if>
					   <c:if test="${data.preferance.abroad == false }">
  							<input type="checkbox" name=jobPreferance[abroad] >Willing to Work Abroad
  						</c:if>
                        </div>
                        </div>
					</div>   
					                    
                    <div class="col-lg-8 ">
                        <div class="modal-body">
                            <h2>Salary  <a id="sal-btn" data-toggle="collapse" data-target="#salInfo">
                         	<span><i class="toggle-icon fa fa-chevron-right"></i></span></a></h2>
                     	</div>
                     <br>
                    <div class="collapse" id="salInfo"> 
                    <div class="row control-group col-lg-offset-2">
                            <label>Salary</label>
                            <br>
                            <div  class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Current</label>                            
                                <input class="form-control" placeholder="Current Salary (p.a)" id="currentSalary" value="${data.currentSalary}" name="personalInfo[currentSalary]" >
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group col-xs-6 floating-label-form-group floating-label-form-group-with-value controls">
                                <label>Expected</label>
                                <input class="form-control" placeholder="Expected Salary (p.a)" id="expectedSalary" value="${data.expectedSalary}" name="personalInfo[expectedSalary]" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>    
                    </div>    
                        <div class="row">
                            <div class="form-group col-xs-12">
                            <br><br><br>
                                <button type="button" id="editFormBtn" class="btn btn-success btn-lg" >Update</button>
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
    <script src="/static/js/edit.js"></script>
    <script src="/static/js/jquery.serialize-object.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</body>

</html>
