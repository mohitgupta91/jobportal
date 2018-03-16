<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	window.print();
</script>
<body>
<div id="container" style="display:table">
	<div class="personalinfo" style="display:table-cell">
            <h5>Personal Information</h5>
				<label>Name: </label><span id="name"><b>${data.name}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Father's Name: </label><span id="fathername"><b>${data.fatherName}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Mother's Name: </label><span id="mothername"><b>${data.motherName}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Date Of Birth: </label><span id="dob"><b>${data.dob}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Gender: </label><span id="gender"><b>${data.gender}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Religion: </label><span id="caste"><b>${data.religion}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Category: </label><span id="caste"><b>${data.category}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Marital Status: </label><span id="maritalstatus"><b>${data.maritalStatus}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Contact Number: </label><span id="contactnumber"><b>${data.contactNumber}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Other Contact: </label><span id="othercontact"><b>${data.contactNumber2}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Total Experience: </label><span id="totexp"><b>${data.totalExperience}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Expected Salary: </label><span id="expsal"><b>${data.expectedSalary}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Current Salary: </label><span id="currsal"><b>${data.currentSalary}</b></span>&nbsp;&nbsp;&nbsp;<br>
            
			</div>
            <div class="addressinfo" style="display:table-cell">
            <h5>Address</h5>
            <div>
            	<h6>Permanent Address</h6>
				<label>Address: </label><span id="permadd"><b>${data.permanentAddress.address}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>State: </label><span id="permstate"><b>${data.permanentAddress.state}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>City: </label><span id="permcity"><b>${data.permanentAddress.city}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Tehsil/Taluka: </label><span id="permtehsil"><b>${data.permanentAddress.tehsil}</b></span>&nbsp;&nbsp;&nbsp;<br>
			</div>
			<div>
				<h6>Temporary Address</h6>
				<label>Address: </label><span id="tempadd"><b>${data.temporaryAddress.address}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>State: </label><span id="tempstate"><b>${data.temporaryAddress.state}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>City: </label><span id="tempcity"><b>${data.temporaryAddress.city}</b></span>&nbsp;&nbsp;&nbsp;<br>
				<label>Tehsil/Taluka: </label><span id="temptehsil"><b>${data.temporaryAddress.tehsil}</b></span>&nbsp;&nbsp;&nbsp;<br>
			</div>
			</div>
			<div id="qualifications" style="display:table-cell"><h5>Qualifications</h5>
		
	<c:forEach var="qual" items="${data.qualifications}">
		<div id="quali">
			<label>Degree: </label><span id="degree"><b>${qual.degree}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>College: </label><span id="college"><b>${qual.college}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>University: </label><span id="univ"><b>${qual.university}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Year of Graduation: </label><span id="year"><b>${qual.passYear}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Grade: </label><span id="grade"><b>${qual.grade}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Subjects: </label><span id="subjects"><b>${qual.subjects}</b></span>&nbsp;&nbsp;&nbsp;<br>
			</div>
		</c:forEach>
		</div><br>
		<div class="workexperience" style="display:table-cell">
			<h5>Work Experience</h5>
			<c:forEach var="wex" items="${data.workExp}">
			<c:if test="${ wex.training != true}">
			 <div id="company1">
				  <label>Company Name: </label><span id="compname"><b>${wex.company}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>Title: </label><span id="title"><b>${wex.jobTitle}</b></span>&nbsp;&nbsp;&nbsp;<br>
				  <label>From: </label><span id="from"><b>${wex.fromDate}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>To: </label><span id="to"><b>${wex.toDate}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>Address: </label><span id="compaddr"><b>${wex.address.address}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>State: </label><span id="compstate"><b>${wex.address.state}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>City: </label><span id="compcity"><b>${wex.address.city}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>Tehsil/Taluka: </label><span id="comptehsil"><b>${wex.address.tehsil}</b></span>&nbsp;&nbsp;&nbsp;<br>
				</div><br>
			</c:if>
		</c:forEach>
			
		<br><div class="training" style="display:table-cell"><h5>Training</h5>
		
		<c:forEach var="wex" items="${data.workExp}">
			<c:if test="${ wex.training == true}">
			 <div id="company1">
				  <label>Company Name: </label><span id="compname"><b>${wex.company}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>Title: </label><span id="title"><b>${wex.jobTitle}</b></span>&nbsp;&nbsp;&nbsp;<br>
				  <label>From: </label><span id="from"><b>${wex.fromDate}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>To: </label><span id="to"><b>${wex.toDate}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>Address: </label><span id="compaddr"><b>${wex.address.address}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>State: </label><span id="compstate"><b>${wex.address.state}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>City: </label><span id="compcity"><b>${wex.address.city}</b></span>&nbsp;&nbsp;&nbsp;<br>
					<label>Tehsil/Taluka: </label><span id="comptehsil"><b>${wex.address.tehsil}</b></span>&nbsp;&nbsp;&nbsp;<br>
				</div><br>
			</c:if>
		</c:forEach>
		</div></div><br><div class="jobpref" style="display:table-cell">
		<h5>Job Preferences</h5>
		<div>
			<label>Job Type: </label><span id="jt"><b>${data.jobRequirement.jobType}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Preffered Location1: </label><span id="pl1"><b>${data.preferance.location1}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Preffered Location2: </label><span id="pl2"><b>${data.preferance.location2}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Preffered Location3: </label><span id="pl3"><b>${data.preferance.location3}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Shift: </label><span id="shift"><b>${data.preferance.shift}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Computer Proficiency: </label><span id="comppro"><b>${data.computerSkill == true ? 'Yes' : 'No'}</b></span>&nbsp;&nbsp;&nbsp;<br>
			<label>Willing to Work abroad: </label><span id="abroad"><b>${data.preferance.abroad == true ? 'Yes' : 'No'}</b></span>&nbsp;&nbsp;&nbsp;<br>
		</div>
		</div>
		</div>
		<br><br>
</body>
</html>