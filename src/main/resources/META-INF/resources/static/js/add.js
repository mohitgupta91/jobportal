$(document).ready(function(){
	// addable div remove buttons
	$("#trDelbtn").hide();
	$("#wexpDelbtn").hide();
	$("#qualDelbtn").hide();
	
	// collapsible div button
	$("#per-btn").click(function(){
      $("#personalInfo").collapse('toggle'); // toggle collapse
    });
    $("#qual-btn").click(function(){
        $("#qualInfo").collapse('toggle'); // toggle collapse
      });
    $("#exp-btn").click(function(){
        $("#expInfo").collapse('toggle'); // toggle collapse
      });
    $("#jf-btn").click(function(){
        $("#jfInfo").collapse('toggle'); // toggle collapse
      });
    $("#jp-btn").click(function(){
        $("#jpInfo").collapse('toggle'); // toggle collapse
      });
    $("#add-btn").click(function(){
        $("#addInfo").collapse('toggle'); // toggle collapse
      });
    $("#training-btn").click(function(){
        $("#trainingInfo").collapse('toggle'); // toggle collapse
      });
//    $("#trAddbtn").click(function(e){
//    	e.preventDefault();
//        var div = $("#trainingInfo").clone();
//        $("#trainingInfo").append(div);        
//      });
    $('#datepicker').datepicker({
        autoclose: true
      });
//    $(".state").change(cityPopulation());
    
    $("#addForm").validate({
  	    // Specify validation rules
  	    rules: {
  	      "personalInfo[name]": "required",
  	      "personalInfo[fatherName]": "required",
  	      "personalInfo[motherName]":"required",
  	      "personalInfo[email]": {
  	        required: true,
  	        email: true
  	      }
  	      
  	    },
  	    // Specify validation error messages
  	    messages: {
  	    	"personalInfo[name]": "Please enter your Name",
  	    	"personalInfo[fatherName]": "Please enter your Father's name",
  	     	"personalInfo[email]": "Please enter a valid email address"
  	    },
  	  submitHandler: function() {
  		json = $("#addForm").serializeJSON();
  		$.ajax({
  			   url: 'http://localhost:8080/register/add',
  			   type : 'POST',
  			   dataType : 'json',
  			   contentType : 'application/json',
  			   data: json ,
  			  success: function(data) {
  				  alert(data);
  			  },
  			  error: function() {
  			         alert('error');
  			      }
  			   });
  	  }
  	});
});

var qual = 1;
var wex = 1;
var tr = 1;

function addQualification() {
	++qual;
    var html = "<div id=\"qual"+qual+"\">"+
    	"<br><br><div class=\"row control-group col-lg-offset-2\">"+
    		"<label>Qualification "+qual+"</label><br>"+
		        "<div  class=\"form-group col-xs-6 floating-label-form-group controls\">"+
		            "<label>Degree</label>"+                            
		            "<select class=\"form-control col-xs-6\" id=\"degree"+qual+"\" name=\"qualifications[][degree]\">"+
		            "<option selected disabled>Degree</option>"+
						"<option value=\"Maharashtra\">B.A</option>"+
					"</select>"+
				"</div>"+
		     "</div>"+
  "<div class=\"row control-group col-lg-offset-2\">"+
    "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
        "<label>College</label>"+
        "<input class=\"form-control\" placeholder=\"College\" id=\"college"+qual+"\" name=\"qualifications[][college]\" >"+
    "</div>"+
    "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+	
        "<label>University</label>"+
        "<input class=\"form-control\" placeholder=\"University\" id=\"university"+qual+"\" name=\"qualifications[][university]\" >"+
    "</div>"+
  "</div>"+ 
  "<div class=\"row control-group col-lg-offset-2\">"+
    "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
        "<label>Grade</label>"+
        "<input class=\"form-control\" placeholder=\"Grade\" id=\"grade"+qual+"\" name=\"qualifications[][grade]\" >"+
    "</div>"+
      "<div  class=\"form-group col-xs-12 floating-label-form-group controls\">"+
		"<label>Year</label>"+ 
		"<input class=\"form-control\" placeholder=\"Year\" id=\"year"+qual+"\" name=\"qualifications[][year]\" >"+
	"</div>"+
  "</div>"+
  "<div class=\"row control-group col-lg-offset-2\">"+
    "<div  class=\"form-group col-xs-12 floating-label-form-group controls\">"+
		"<label>Subjects</label>"+ 
		"<input class=\"form-control\" placeholder=\"Subjects\" id=\"subjects"+qual+"\" name=\"qualifications[][subjects]\" >"+
	"</div>"+
	"</div>"+
	"<br><br>"+
"</div>";
	$("#qual").append(html);
	if(qual > 1)
		$("#qualDelbtn").show();
	else
		$("#qualDelbtn").hide();
	
	
}

function removeQualification(){
	$("#qual"+qual).remove();
	--qual;
	if(qual > 1)
		$("#qualDelbtn").show();
	else
		$("#qualDelbtn").hide();
}


function addWorkExp(){
	++wex;
	var html = "<div id=\"wex"+wex+"\">"+
		"<br><br><div class=\"row control-group col-lg-offset-2\">"+
    "<label>Job"+wex+"</label>"+
    "<br><div  class=\"form-group col-xs-6 floating-label-form-group controls\">"+
        "<label>Job Title</label>"+                            
        "<input class=\"form-control\" placeholder=\"Job Title\" id=\"jobTitle\" name=\"workExperience[][jobTitle]\" >"+
    "</div>"+
 "</div>"+
  "<div class=\"row control-group col-lg-offset-2\">"+
    "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
        "<label>From</label>"+
        "<input class=\"form-control\" placeholder=\"From Date\" id=\"fromDate\" name=\"workExperience[][fromDate]\" >"+
    "</div>"+
    "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
        "<label>To</label>"+
        "<input class=\"form-control\" placeholder=\"To Date\" id=\"toDate\" name=\"workExperience[][toDate]\" >"+
    "</div>"+
  "</div>"+ 
  "<div class=\"row control-group col-lg-offset-2\">"+
    "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
        "<label>Company Name</label>"+
        "<input class=\"form-control\" placeholder=\"Company Name\" id=\"companyName"+wex+"\" name=\"workExperience[][companyName]\" >"+
    "</div>"+
  "</div>"+
  "<br>"+
  "<div class=\"row control-group col-lg-offset-2\">"+
    "<div class=\"row control-group col-lg-offset-2\">"+
    "<label>Company Address</label>"+
    "<br>"+
    "<div  class=\"form-group col-xs-12 floating-label-form-group controls\">"+
		"<label>Address</label>"+ 
		"<input class=\"form-control\" placeholder=\"Address\" id=\"address"+wex+"\" name=\"workExperience[][address][address]\" >"+
	"</div>"+
"</div>"+
"<div class=\"row control-group col-lg-offset-2\">"+
    "<div  class=\"form-group col-xs-6 floating-label-form-group controls\">"+
		"<label>State</label> <select class=\"form-control col-xs-6\" id=\"state"+wex+"\" name=\"workExperience[][address][state]\">"+
			"<option selected disabled>State</option>"+
			"<c:forEach var=\"state\" items=\"+${states}\"><option value=\"${state}\">\$\{state\}</option></c:forEach>"+
		"</select>"+
	"</div>"+
	"<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
		"<label>City</label> <select class=\"form-control col-xs-6\" id=\"city"+wex+"\" name=\"workExperience[][address][city]\">"+
			"<option selected disabled>City</option>"+
			"<option value=\"Nagpur\">Nagpur</option>"+
		"</select>"+
	"</div>"+
"</div>"+   
"<div class=\"row control-group col-lg-offset-2\">"+
    "<div  class=\"form-group col-xs-6 floating-label-form-group controls\">"+
		"<label>Tehsil/Taluka</label>"+ 
		"<input class=\"form-control\" placeholder=\"Tehsil / Taluka\" id=\"tehsil"+wex+"\" name=\"workExperience[][address][tehsil]\" >"+
	"</div>"+
	"</div>"+
"</div>";
	$("#wexp").append(html);
	if(wex > 1)
		$("#wexpDelbtn").show();
	else
		$("#wexpDelbtn").hide();
}

function removeWorkExp(){
	$("#wex"+wex).remove();
	--wex;
	if(wex > 1)
		$("#wexpDelbtn").show();
	else
		$("#wexpDelbtn").hide();
}

function addTraining(){
	++tr;
	var html = "<div id=\"tr"+tr+"\"><br><br>" +
			"<div class=\"row control-group col-lg-offset-2\" >"+
	"<label>Training "+tr+"</label>"+
	 "<br>"+
	 "<div  class=\"form-group col-xs-6 floating-label-form-group controls\">"+
	     "<label>Job Title</label>"+                            
	     "<input class=\"form-control\" placeholder=\"Job Title\" id=\"jobTitle"+tr+"\" name=\"training[][jobTitle]\" >"+
	 "</div>"+
	"</div>"+
	"<div class=\"row control-group col-lg-offset-2\">"+
	 "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
	     "<label>From</label>"+
	     "<input class=\"form-control\" placeholder=\"From Date\" id=\"fromDate"+tr+"\" name=\"training[][fromDate]\" >"+
	 "</div>"+
	 "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
	     "<label>To</label>"+
	     "<input class=\"form-control\" placeholder=\"To Date\" id=\"toDate"+tr+"\" name=\"training[][toDate]\" >"+
	 "</div>"+
	"</div> "+
	"<div class=\"row control-group col-lg-offset-2\">"+
	 "<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
	     "<label>Company Name</label>"+
	     "<input class=\"form-control\" placeholder=\"Company Name\" id=\"companyName"+tr+"\" name=\"training[][companyName]\" >"+
	 "</div>"+
	"</div>"+
	"<br>"+
	"<div class=\"row control-group col-lg-offset-2\">"+
	 "<div class=\"row control-group col-lg-offset-2\">"+
	 "<label>Company Address</label>"+
	 "<br>"+
	 "<div  class=\"form-group col-xs-12 floating-label-form-group controls\">"+
			"<label>Address</label> "+
			"<input class=\"form-control\" placeholder=\"Address\" id=\"address"+tr+"\" name=\"training[][address][address]\" >"+
		"</div>"+
	"</div>"+
	"<div class=\"row control-group col-lg-offset-2\">"+
	 "<div  class=\"form-group col-xs-6 floating-label-form-group controls\">"+
			"<label>State</label> <select class=\"form-control col-xs-6 state\" id=\"state"+tr+"\" name=\"training[][address][state]\ \">"+
				"<option selected disabled>State</option>"+
				"<option value=\"Maharashtra\">Maharashtra</option>"+
			"</select>"+
		"</div>"+
		"<div class=\"form-group col-xs-6 floating-label-form-group controls\">"+
			"<label>City</label> <select class=\"form-control col-xs-6\" id=\"city"+tr+"\" name=\"training[][address][city]\">"+
				"<option selected disabled>City</option>"+
			"</select>"+
		"</div>"+
	"</div>   "+
	"<div class=\"row control-group col-lg-offset-2\">"+
	 "<div  class=\"form-group col-xs-6 floating-label-form-group controls\">"+
			"<label>Tehsil/Taluka</label> "+
			"<input class=\"form-control\" placeholder=\"Tehsil / Taluka\" id=\"tehsil"+tr+"\" name=\"training[][address][tehsil]\" >"+
		"</div>"+
	"</div>"+
	"</div>"+
	"</div>";
	
	if(tr > 1)
		$("#trDelbtn").show();
	else
		$("#trDelbtn").hide();
	
	$("#train").append(html);
	$('.state').bind('change',cityPopulation());
	
}

function removeTraining(){
	$("#tr"+tr).remove();
	--tr;
	if(tr > 1)
		$("#trDelbtn").show();
	else
		$("#trDelbtn").hide();
}

function cityPopulation(){
	alert("Here");
	var city = $(this).next('select');
	alert(state);
	$.ajax({
		   url: 'http://localhost:8080/getCity',
		   type : 'GET',
		   data: { state:  state },
		  success: function(data) {
			  $(city).empty();
			  $(city).append("<option selected disabled>City</option>")
			  for(i=0;i<data.length;i++)
				 $(city).append("<option value="+data[i]+">"+data[i]+"</option>")
		  },
		  error: function() {
			  	 $('#notification-bar').show();
		         $('#notification-bar').text('An error occurred');
		         $('#notification-bar').attr('class','alert fade in alert-danger');
		  }
	});
}
