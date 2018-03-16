$(document).ready(function() {
    $('#table').DataTable(
//    		{
//        "processing": true,
//        "ajax": "http://localhost:8080/search/getResult",
//        "columns": [
//            { "data": "name" },
//            { "data": "hr.position" },
//            { "data": "contact.0" },
//            { "data": "contact.1" },
//            { "data": "hr.start_date" },
//            { "data": "hr.salary" }
//        ]
//    }
    		);
    
} );

function getDetails(regID)
{
    $.ajax({
		   
		   url: 'http://localhost:8080/search/getResult',
		   type : 'GET',
		   data : { regID : regID},
		  success: function(data) {
			  console.log(data);
			    showModal(data);  
		  	}
		 });
}


function showModal(data){
	
	var content = "";
	$("#regId").html("Registeration ID : "+data.registrationId);
	content +="<div class=\"personalinfo\">"+
            "<h5>Personal Information</h5>"+
				"<label>Name: </label><span id=\"name\">"+data.name+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Father's Name: </label><span id=\"fathername\">"+data.fatherName+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Mother's Name: </label><span id=\"mothername\">"+data.motherName+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Date Of Birth: </label><span id=\"dob\">"+data.dob.dayOfMonth+"-"+data.dob.month+"-"+data.dob.year+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Gender: </label><span id=\"gender\">"+data.gender+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Religion: </label><span id=\"caste\">"+data.religion+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Category: </label><span id=\"category\">"+data.category+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Marital Status: </label><span id=\"maritalstatus\">"+data.maritalStatus+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Contact Number: </label><span id=\"contactnumber\">"+data.contactNumber+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Other Contact: </label><span id=\"othercontact\">"+data.contactNumber2+"</span>&nbsp;&nbsp;&nbsp;<br>";
				"<label>Total Experience: </label><span id=\"totexp\">"+data.totalExperience+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Expected Salary: </label><span id=\"expsal\">"+data.expectedSalary+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>Current Salary: </label><span id=\"currsal\">"+data.currentSalary+"</span>&nbsp;&nbsp;&nbsp;<br>"+
            "</div>"+
            "<br><br>"+
            "<div class=\"addressinfo\">"+
            "<h5>Address</h5>"+
            "<div>"+
            	"<h6>Permanent Address</h6>"+
				"<label>Address: </label><span id=\"permadd\">"+data.permanentAddress.address+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>State: </label><span id=\"permstate\">"+data.permanentAddress.state+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>City: </label><span id=\"permcity\">"+data.permanentAddress.city+"</span>&nbsp;&nbsp;&nbsp;<br>";
			if(data.permanentAddress.tehsil != null && data.permanentAddress.tehsil != "")
				content+="<label>Tehsil/Taluka: </label><span id=\"permtehsil\">"+data.permanentAddress.tehsil+"</span>&nbsp;&nbsp;&nbsp;<br>";
			content+="</div>"+
			"<div>"+
				"<h6>Temporary Address</h6>"+
				"<label>Address: </label><span id=\"tempadd\">"+data.temporaryAddress.address+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>State: </label><span id=\"tempstate\">"+data.temporaryAddress.state+"</span>&nbsp;&nbsp;&nbsp;<br>"+
				"<label>City: </label><span id=\"tempcity\">"+data.temporaryAddress.city+"</span>&nbsp;&nbsp;&nbsp;<br>";
			if(data.temporaryAddress.tehsil != null && data.temporaryAddress.tehsil != "")
				content += "<label>Tehsil/Taluka: </label><span id=\"temptehsil\">"+data.temporaryAddress.tehsil+"</span>&nbsp;&nbsp;&nbsp;<br>";
			content +="</div>"+
			"</div>"+
			"<br><br>"+
			"<div id=\"qualifications\"><h5>Qualifications</h5>";
		
	for( var i= 0 ;i < data.qualifications.length;i++ )
		{			
			content += "<div id=\"qual"+i+">"+
			"<label>Degree: </label><span id=\"degree\">"+data.qualifications[i].degree+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>College: </label><span id=\"college\">"+data.qualifications[i].college+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>University: </label><span id=\"univ\">"+data.qualifications[i].university+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Year of Graduation: </label><span id=\"year\">"+data.qualifications[i].passYear+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Grade: </label><span id=\"grade\">"+data.qualifications[i].grade+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Subjects: </label><span id=\"subjects\">"+data.qualifications[i].subjects+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"</div><br>";
		}
		var wexcont = "</div><br><br><div class=\"workexperience\"><h5>Work Experience</h5>";
		var trcont = "<br><br><div class=\"training\"><h5>Training</h5>";
		
		for( var i= 0 ;i < data.workExp.length;i++ )
		{	
			if(data.workExp[i].training == true)
			{
				trcont += "<div id=\"company1\">"+
				  "<label>Company Name: </label><span id=\"compname\">"+data.workExp[i].company+"</span>&nbsp;&nbsp;&nbsp;<br>"+
					"<label>Title: </label><span id=\"title\">"+data.workExp[i].jobTitle+"</span>&nbsp;&nbsp;&nbsp;<br>";
				if(data.workExp[i].fromDate != null)
					trcont += "<label>From: </label><span id=\"from\">"+data.workExp[i].fromDate.dayOfMonth+"-"+data.workExp[i].fromDate.month+"-"+data.workExp[i].fromDate.year+"</span>&nbsp;&nbsp;&nbsp;<br>";
				if(data.workExp[i].toDate != null)
					trcont += "<label>To: </label><span id=\"to\">"+data.workExp[i].toDate.dayOfMonth+"-"+data.workExp[i].toDate.month+"-"+data.workExp[i].toDate.year+"</span>&nbsp;&nbsp;&nbsp;<br>";
				trcont +="<br><h6>Company Address</h6>"+
					"<label>Address: </label><span id=\"compaddr\">"+data.workExp[i].address.address+"</span>&nbsp;&nbsp;&nbsp;<br>"+
					"<label>State: </label><span id=\"compstate\">"+data.workExp[i].address.state+"</span>&nbsp;&nbsp;&nbsp;<br>"+
					"<label>City: </label><span id=\"compcity\">"+data.workExp[i].address.city+"</span>&nbsp;&nbsp;&nbsp;<br>";
				if(data.workExp[i].address.tehsil != null && data.workExp[i].address.tehsil != "")
					trcont+= "<label>Tehsil/Taluka: </label><span id=\"comptehsil\">"+data.workExp[i].address.tehsil+"</span>&nbsp;&nbsp;&nbsp;<br>";
				trcont+="</div><br><br>";					
			}
			else
			{
				wexcont += "<div id=\"company1\">"+
				  "<label>Company Name: </label><span id=\"compname\">"+data.workExp[i].company+"</span>&nbsp;&nbsp;&nbsp;<br>"+
					"<label>Title: </label><span id=\"title\">"+data.workExp[i].jobTitle+"</span>&nbsp;&nbsp;&nbsp;<br>";
				if(data.workExp[i].fromDate != null)
					wexcont+="<label>From: </label><span id=\"from\">"+data.workExp[i].fromDate.dayOfMonth+"-"+data.workExp[i].fromDate.month+"-"+data.workExp[i].fromDate.year+"</span>&nbsp;&nbsp;&nbsp;<br>";
				if(data.workExp[i].toDate != null)
					wexcont+="<label>To: </label><span id=\"to\">"+data.workExp[i].toDate.dayOfMonth+"-"+data.workExp[i].toDate.month+"-"+data.workExp[i].toDate.year+"</span>&nbsp;&nbsp;&nbsp;<br>";
					
				wexcont +="<br><h6>Company Address</h6>"+
					"<label>Address: </label><span id=\"compaddr\">"+data.workExp[i].address.address+"</span>&nbsp;&nbsp;&nbsp;<br>"+
					"<label>State: </label><span id=\"compstate\">"+data.workExp[i].address.state+"</span>&nbsp;&nbsp;&nbsp;<br>"+
					"<label>City: </label><span id=\"compcity\">"+data.workExp[i].address.city+"</span>&nbsp;&nbsp;&nbsp;<br>";
				if(data.workExp[i].address.tehsil != null && data.workExp[i].address.tehsil != "")
					wexcont += "<label>Tehsil/Taluka: </label><span id=\"comptehsil\">"+data.workExp[i].address.tehsil+"</span>&nbsp;&nbsp;&nbsp;<br>";
				wexcont+="</div><br><br>";
			}
		}
		content += wexcont + trcont;
		content+="</div></div><br><div class=\"jobpref\">"+
		"<h5>Job Preferences</h5>"+
		"<div>"+
			"<label>Job Type: </label><span id=\"jt\">"+data.jobRequirement+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Preffered Location1: </label><span id=\"pl1\">"+data.preferance.location1+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Preffered Location2: </label><span id=\"pl2\">"+data.preferance.location2+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Preffered Location3: </label><span id=\"pl3\">"+data.preferance.location3+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Shift: </label><span id=\"shift\">"+data.preferance.shift+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Computer Proficiency: </label><span id=\"comppro\">"+(data.computerSkill == "true" ? "Yes" : "No")+"</span>&nbsp;&nbsp;&nbsp;<br>"+
			"<label>Willing to Work abroad: </label><span id=\"abroad\">"+(data.preferance.abroad == "true" ? "Yes" : "No") +"</span>&nbsp;&nbsp;&nbsp;<br>"+
		"</div>"+
		"</div>";
		content +="<br><br><div>" +
				"<form metod=\"post\" action=\"http://localhost:8080/register/edit/home\">" +
				"<input type=\"hidden\" name=\"id\" value=\""+data.registrationId+"\">"+
				"<button class=\"btn btn-primary\" >Edit</button> " +
				"<a target=\"_blank\" href=\"http://localhost:8080/print/"+data.registrationId+"\" class=\"btn btn-info\" \">Print</button>" +
				"</form>"+
				"</div>"; 
				
	$("#content").html(content);
//	$("#content").addClass("printable");
//	$("#content").append();
	$("#viewModal").modal('show');
}

function edit(id)
{
	$("#viewModal").modal('hide');
}

function printElement(divname){
	var printContents = $("#content").html();
//    var originalContents = document.body.innerHTML;
	var myWindow = window.open();
//    document.body.innerHTML = printContents;
	myWindow.document.write(printContents);
    myWindow.print();

  //  document.body.innerHTML = originalContents;
}