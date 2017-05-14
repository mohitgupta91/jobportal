$(document).ready(function(){
	   		
	$("#per-btn").click(function(){
      $("#personalInfo").collapse('toggle'); // toggle collapse
    });
    $("#edu-btn").click(function(){
        $("#eduInfo").collapse('toggle'); // toggle collapse
      });
    $("#exp-btn").click(function(){
        $("#expInfo").collapse('toggle'); // toggle collapse
      });
    $("#jf-btn").click(function(){
        $("#jfInfo").collapse('toggle'); // toggle collapse
      });
    $("#sal-btn").click(function(){
        $("#salInfo").collapse('toggle'); // toggle collapse
      });
    

    // search form
$('#state').change(function(){
    	$.ajax({
    		   
    		   url: 'http://localhost:8080/getCity',
    		   type : 'GET',
    		   data: {
    		      state:  $("#state").val()
    		   },
    		  success: function(data) {
    			  $("#city").empty();
    			  $("#city").append("<option selected disabled>City</option>")
    			  for(i=0;i<data.length;i++)
    				 $("#city").append("<option value="+data[i]+">"+data[i]+"</option>")
    		  },
    		  error: function() {
    		         $('#notification').text('An error occurred');
    		      }
    		   });
    });

$('#searchByIdForm')
.on('submit', function(e) {
     e.preventDefault();
     
     $.ajax({
		   
		   url: 'http://localhost:8080/search/getResult',
		   type : 'GET',
		   data : { regID : $("#regID").val()},
		  success: function(data) {
			  console.log(data);
			  
			  if(data.length == 0){
				 	$('#notification-msg').html('No Result Found');
		         	$('#notification').attr('class','alert fade in alert-danger');
		         	$('#notification').show();
		      }
			  else{
				  showModal(data);  
			  }
		},
		  error: function() {
	         	$('#notification-msg').html('Error Occured. Contact Admin');
	         	$('#notification').attr('class','alert fade in alert-danger');
	         	$('#notification').show();
	      	}
		   });
});

//function showModal(data){
//	var qual=1;
//	var wex=1;
//	var tr=1;
//	
//	$("#regId").html("Registeration Id: "+data.registrationId);
//	$("#name").html(data.name);
//	$("#fathername").html(data.fatherName);
//	$("#mothername").html(data.motherName);
//	var dateStr = data.dob.dayOfMonth+"/"+data.dob.month+"/"+data.dob.year;
//	$("#dob").html(dob);
//	$("#gender").html(data.gender);
//	$("#caste").html(data.caste);
//	$("#maritalstatus").html(data.maritalStatus);
//	$("#contactnumber").html(data.contactNumber);
//	$("#othercontact").html(data.contactNumber2);
//	$("#totexp").html(data.totalExperience);
//	$("#expsal").html(data.expectedSalary);
//	$("#currsal").html(data.currentSalary);
//
//	$("#contactnumber").html(data.contactNumber);
//	$("#contactnumber").html(data.contactNumber);
//	$("#contactnumber").html(data.contactNumber);
//
//	$("#permadd").html(data.permanentAddress.address);
//	$("#permcity").html(data.permanentAddress.city);
//	$("#permstate").html(data.permanentAddress.state);
//	$("#permtehsil").html(data.permanentAddress.tehsil);
//
//	$("#tempadd").html(data.temporaryAddress.address);
//	$("#tempcity").html(data.temporaryAddress.city);
//	$("#tempstate").html(data.temporaryAddress.state);
//	$("#temptehsil").html(data.temporaryAddress.tehsil);
//	
//	$("#jt").html(data.jobRequirement);
//	$("#pl1").html(data.preferance.location1);
//	$("#pl2").html(data.preferance.location2);
//	$("#pl3").html(data.preferance.location3);
//	$("#shift").html(data.preferance.shift);
//	$("#compro").html(data.computerSkill);
//	$("#abroad").html(data.preferance.abroad);
//	
////	$("#qualifications").empty();
////	$("#qualifications").append("<h5>Qualifications</h5>");
////	while( (qual-1) < data.qualifications.length ){			
////		html += "<div id=\"qual"+qual+">"+
////    	"<label>Degree: </label><span id=\"degree\">"+data.qualifications[qual-1].degree+"</span>&nbsp;&nbsp;&nbsp;"+
////		"<label>College: </label><span id=\"college\">"+data.qualifications[qual-1].college+"</span>&nbsp;&nbsp;&nbsp;"+
////		"<label>University: </label><span id=\"univ\">"+data.qualifications[qual-1].university+"</span>&nbsp;&nbsp;&nbsp;"+
////		"<label>Year of Graduation: </label><span id=\"year\">"+data.qualifications[qual-1].passYear+"</span>&nbsp;&nbsp;&nbsp;"+
////		"<label>Grade: </label><span id=\"grade\">"+data.qualifications[qual-1].grade+"</span>&nbsp;&nbsp;&nbsp;"+
////		"<label>Subjects: </label><span id=\"subjects\">"+data.qualifications[qual-1].subjects+"</span>&nbsp;&nbsp;&nbsp;"+
////		"</div>";
////		alert(html);
////		qual++;
////	}
////	$("#qualifications").html(html);
//	var wexdiv = $("#company1").clone();
//	var trdiv = $("#train1").clone();
//	var wdiv = $("#company1");
//	var tdiv = $("#train1");
//	tdiv.empty();
//	wdiv.empty();
//	
//	for( var i= 0 ;i < data.workExp.length;i++ ){			
//		if(data.workExp[i].training == true)
//		{
//			trdiv.attr("id","train"+tr);
//			if(tr == 1)
//				tdiv.html(trdiv);
//			else{
//				tdiv.after(trdiv);
//				tdiv = tdiv.next();
//			}
//			tdiv.append('<br>');
//			tdiv.find("#trcompname").html(data.workExp[i].company);
//			dateStr = data.workExp[i].fromDate.dayOfMonth+"/"+data.workExp[i].fromDate.month+"/"+data.workExp[i].fromDate.year;
//			tdiv.find("#trfrom").html(dateStr);
//			dateStr = data.workExp[i].toDate.dayOfMonth+"/"+data.workExp[i].toDate.month+"/"+data.workExp[i].toDate.year;
//			tdiv.find("#trto").html(dateStr);
//			tdiv.find("#trtitle").html(data.workExp[i].jobTitle);
//			tdiv.find("#trcompaddr").html(data.workExp[i].address.address);
//			tdiv.find("#trcompstate").html(data.workExp[i].address.state);
//			tdiv.find("#trcompcity").html(data.workExp[i].address.city);
//			tdiv.find("#trcomptehsil").html(data.workExp[i].address.tehsil);
//			tr++;
//		}
//		else
//		{
//			wexdiv.attr("id","company"+wex);
//			if(wex == 1){
////				wdiv.html(wexdiv);
////			else{
//				wdiv.after(wexdiv);
//				wdiv = wdiv.next();
//			}
//			wdiv.append("<br>");
//			wdiv.find("#compname").html(data.workExp[i].company);
//			dateStr = data.workExp[i].fromDate.dayOfMonth+"/"+data.workExp[i].fromDate.month+"/"+data.workExp[i].fromDate.year;
//			wdiv.find("#from").html(data.workExp[wex-1].fromDate);
//			dateStr = data.workExp[i].toDate.dayOfMonth+"/"+data.workExp[i].toDate.month+"/"+data.workExp[i].toDate.year;
//			wdiv.find("#to").html(dateStr);
//			wdiv.find("#title").html(data.workExp[i].jobTitle);
//			wdiv.find("#compaddr").html(data.workExp[i].address.address);
//			wdiv.find("#compstate").html(data.workExp[i].address.state);
//			wdiv.find("#compcity").html(data.workExp[i].address.city);
//			wdiv.find("#comptehsil").html(data.workExp[i].address.tehsil);
//			wex++;
//		}
//	}		
//	
//	$("#viewModal").modal('show');
//}
//
});
function showModal(data){
		
		var content = "";
		content +="<div class=\"personalinfo\">"+
                "<h5>Personal Information</h5>"+
					"<label>Name: </label><span id=\"name\">"+data.name+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Father's Name: </label><span id=\"fathername\">"+data.fatherName+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Mother's Name: </label><span id=\"mothername\">"+data.motherName+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Date Of Birth: </label><span id=\"dob\">"+data.dob+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Gender: </label><span id=\"gender\">"+data.gender+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Caste: </label><span id=\"caste\">"+data.caste+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Marital Status: </label><span id=\"maritalstatus\">"+data.maritalStatus+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Contact Number: </label><span id=\"contactnumber\">"+data.contactNumber+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Other Contact: </label><span id=\"othercontact\">"+data.contactNumber2+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Total Experience: </label><span id=\"totexp\">"+data.totalExperience+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Expected Salary: </label><span id=\"expsal\">"+data.expectedSalary+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Current Salary: </label><span id=\"currsal\">"+data.currentSalary+"</span>&nbsp;&nbsp;&nbsp;"+
                "</div>"+
                "<br><br>"+
                "<div class=\"addressinfo\">"+
                "<h5>Address</h5>"+
                "<div>"+
                	"<h6>Permanent Address</h6>"+
					"<label>Address: </label><span id=\"permadd\">"+data.permanentAddress.address+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>State: </label><span id=\"permstate\">"+data.permanentAddress.state+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>City: </label><span id=\"permcity\">"+data.permanentAddress.city+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Tehsil/Taluka: </label><span id=\"permtehsil\">"+data.permanentAddress.tehsil+"</span>&nbsp;&nbsp;&nbsp;"+
				"</div>"+
				"<div>"+
					"<h6>Temporary Address</h6>"+
					"<label>Address: </label><span id=\"tempadd\">"+data.temporaryAddress.address+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>State: </label><span id=\"tempstate\">"+data.temporaryAddress.state+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>City: </label><span id=\"tempcity\">"+data.temporaryAddress.city+"</span>&nbsp;&nbsp;&nbsp;"+
					"<label>Tehsil/Taluka: </label><span id=\"temptehsil\">"+data.temporaryAddress.tehsil+"</span>&nbsp;&nbsp;&nbsp;"+
				"</div>"+
				"</div>"+
				"<br><br>"+
				"<div id=\"qualifications\"><h5>Qualifications</h5>";
			
		for( var i= 0 ;i < data.qualifications.length;i++ )
			{			
				content += "<div id=\"qual"+i+">"+
				"<label>Degree: </label><span id=\"degree\">"+data.qualifications[i].degree+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>College: </label><span id=\"college\">"+data.qualifications[i].college+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>University: </label><span id=\"univ\">"+data.qualifications[i].university+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Year of Graduation: </label><span id=\"year\">"+data.qualifications[i].passYear+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Grade: </label><span id=\"grade\">"+data.qualifications[i].grade+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Subjects: </label><span id=\"subjects\">"+data.qualifications[i].subjects+"</span>&nbsp;&nbsp;&nbsp;"+
				"</div><br>";
			}
			var wexcont = "<br><br><div class=\"workexperience\"><h5>Work Experience</h5>";
			var trcont = "<br><br><div class=\"training\"><h5>Training</h5>";
			
			for( var i= 0 ;i < data.workExp.length;i++ )
			{	
				if(data.workExp[i].training == true)
				{
					trcont += "<div id=\"company1\">"+
					  "<label>Company Name: </label><span id=\"compname\">"+data.workExp[i].company+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>Title: </label><span id=\"title\">"+data.workExp[i].jobTitle+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>From: </label><span id=\"from\">"+data.workExp[i].from+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>To: </label><span id=\"to\">"+data.workExp[i].to+"</span>&nbsp;&nbsp;&nbsp;"+
						"<br><h6>Company Address</h6>"+
						"<label>Address: </label><span id=\"compaddr\">"+data.workExp[i].address.address+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>State: </label><span id=\"compstate\">"+data.workExp[i].address.state+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>City: </label><span id=\"compcity\">"+data.workExp[i].address.city+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>Tehsil/Taluka: </label><span id=\"comptehsil\">"+data.workExp[i].address.tehsil+"</span>&nbsp;&nbsp;&nbsp;"+
					"</div><br><br>";					
				}
				else
				{
					wexcont += "<div id=\"company1\">"+
					  "<label>Company Name: </label><span id=\"compname\">"+data.workExp[i].company+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>Title: </label><span id=\"title\">"+data.workExp[i].jobTitle+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>From: </label><span id=\"from\">"+data.workExp[i].from+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>To: </label><span id=\"to\">"+data.workExp[i].to+"</span>&nbsp;&nbsp;&nbsp;"+
						"<br><h6>Company Address</h6>"+
						"<label>Address: </label><span id=\"compaddr\">"+data.workExp[i].address.address+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>State: </label><span id=\"compstate\">"+data.workExp[i].address.state+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>City: </label><span id=\"compcity\">"+data.workExp[i].address.city+"</span>&nbsp;&nbsp;&nbsp;"+
						"<label>Tehsil/Taluka: </label><span id=\"comptehsil\">"+data.workExp[i].address.tehsil+"</span>&nbsp;&nbsp;&nbsp;"+
					"</div><br><br>";
				}
			}
			content += wexcont + trcont;
			content+="<div class=\"jobpref\">"+
			"<h5>Job Preferences</h5>"+
			"<div>"+
				"<label>Job Type: </label><span id=\"jt\">"+data.jobRequirement+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Preffered Location1: </label><span id=\"pl1\">"+data.preferance.location1+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Preffered Location2: </label><span id=\"pl2\">"+data.preferance.location2+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Preffered Location3: </label><span id=\"pl3\">"+data.preferance.location3+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Shift: </label><span id=\"shift\">"+data.preferance.shift+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Computer Proficiency: </label><span id=\"comppro\">"+data.computerSkill+"</span>&nbsp;&nbsp;&nbsp;"+
				"<label>Willing to Work abroad: </label><span id=\"abroad\">"+data.preferance.abroad+"</span>&nbsp;&nbsp;&nbsp;"+
			"</div>"+
			"</div>";
		$("#content").html(content);
		$("#viewModal").modal('show');
}

function getData(regID)
{
    $.ajax({
		   
		   url: 'http://localhost:8080/search/getResult',
		   type : 'GET',
		   data : { regID : regID},
		  success: function(data) {
			    showModal(data);  
		  	}
		 });
}