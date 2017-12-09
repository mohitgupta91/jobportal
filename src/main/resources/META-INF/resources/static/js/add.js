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

    initializeDatePicker();
    
    $('.state').change(function(){
    	var state = $(this).val();
    	var city = $(this).parent().next().find('select.city');
    	$.ajax({
    		   url: 'http://localhost:8080/getCity',
    		   type : 'GET',
    		   data: { state:  state },
    		  success: function(data) {
    			  city.empty();
    			  city.append("<option selected disabled>City</option>")
    			  for(i=0;i<data.length;i++)
    				city.append("<option value="+data[i]+">"+data[i]+"</option>")
    		  },
    		  error: function() {
    			  	 $('#notification').show();
    			  	$('#notification').focus();
    		         $('#notification-msg').text('An error occurred');
    		         $('#notification').attr('class','alert fade in alert-danger');
    		  }
    	});
    });
    
    $("#addBtn").click(function(){
    	json = $("#addForm").serializeJSON();
  		var formData = JSON.parse(json);
  		
  		if(tr == 0) delete formData.training;
  		if(wex == 0) delete formData.workExperience;
  		if(qual == 0) delete formData.qualifications;
 
 		validateJson(formData);
 		 
  		$.ajax({
  			   url: 'http://localhost:8080/register/add',
  			   type : 'POST',
  			   dataType : 'json',
  			   contentType : 'application/json',
  			   data: JSON.stringify(formData) ,
  			  success: function(data) {
  				 window.location="http://localhost:8080/register?id="+data;
  		         },
  			  error: function(data) {
  			     $('#notification-msg').text("Error occured please contact Admin or Fill the form properly");
  		         $('#notification').attr('class','alert fade in alert-danger');
  		         $('#notification').show();
  		      }
  			   });
  	});
    
});

var qual = 0;
var wex = 0;
var tr = 0;

function addQualification() {
	if(qual == 0) {
		$("#qual1").show();
		$("#qualDelbtn").show();
		++qual;
	} 
	else {
		var div = $("#qual"+qual).clone(true,true);
		div.attr('id', 'qual'+ ++qual);
		div.find('label').first().html('Qualification '+qual);
		div.find("input:text").val("");
		div.find("input:text").removeClass('floating-label-form-group-with-value');
		div.find("div").removeClass('floating-label-form-group-with-value');
		
		$("#qual"+(qual-1)).after(div);
		if(qual >= 1)
			$("#qualDelbtn").show();
		else{
			$("#qualDelbtn").hide();
			$("#qual1").hide();	
		}
	}
}



function addWorkExp(){
	if(wex == 0) {
		$("#wexp1").show();
		$("#wexpDelbtn").show();
		++wex;
	} 
	else 
	{ 
		$('.date').datepicker("destroy");	
		var div = $("#wexp"+wex).clone(true,true);
		div.attr('id', 'wexp'+ ++wex);
		div.find('label').first().html('Job '+wex);
		div.find("select.city").html("<option selected disabled>City</option>");
		div.find("input:text").val("");
		div.find("input:text").removeClass('floating-label-form-group-with-value');
		div.find("div").removeClass('floating-label-form-group-with-value');
		div.find("input:text")
		div.find('#fromDate'+(wex-1)).attr('id','fromDate'+wex);
		div.find('#toDate'+(wex-1)).attr('id','toDate'+wex);
		
		$("#wexp"+(wex-1)).after(div);
	
		initializeDatePicker();    
		if(wex >= 1)
			$("#wexpDelbtn").show();
		else {
			$("#wexpDelbtn").hide();
			$("#wexp1").hide();
		}
	}
}



function addTraining(){
	if(tr == 0) {
		$("#train1").show();
		$("#trDelbtn").show();
		++tr;
	} 
	else 
	{ 
		$('.date').datepicker("destroy");	
		var div = $("#train"+tr).clone(true,true);
		div.attr('id', 'train'+ ++tr);
		div.find('label').first().html('Training '+tr);
		div.find("select.city").html("<option selected disabled>City</option>");
		div.find("input:text").val("");
		div.find("input:text").removeClass('floating-label-form-group-with-value');
		div.find("div").removeClass('floating-label-form-group-with-value');
		
		div.find('#trfromDate'+(tr-1)).attr('id','trfromDate'+tr);
		div.find('#trtoDate'+(tr-1)).attr('id','trtoDate'+tr);
		initializeDatePicker();	
		
		$("#train"+(tr-1)).after(div);
		if(tr >= 1)
			$("#trDelbtn").show();
		else {
			$("#trDelbtn").hide();
			$("#train1").hide();
		}
	}
}

function removeWorkExp(){
	if(wex > 1){
		$("#wexpDelbtn").show();
		$("#wexp"+wex).remove();
		--wex;
	}
	else{
		$("#wexpDelbtn").hide();
		$("#wexp"+wex).hide();
		--wex;
	}	
}


function removeTraining(){
	if(tr > 1){
		$("#trDelbtn").show();
		$("#train"+tr).remove();	
		--tr;
	}
	else{
		$("#trDelbtn").hide();
		$("#train"+tr).hide();
		tr--;
	}
}

function removeQualification(){
	if(qual > 1){
		$("#qualDelbtn").show();
		$("#qual"+qual).remove();
		--qual;
	}
	else {
		$("#qualDelbtn").hide();
		$("#qual"+qual).hide();
		--qual;
	}
		
}

function initializeDatePicker() {
    $('.date').datepicker({
    	dateFormat:"yy-mm-dd",
    	changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        yearRange: '1950:2017'
        });
}


function validateJson(form){
	var error_msg = "";
	var text_reg = new RegExp("([a-zA-Z])\D\w*");
	var email_reg = new RegExp("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

	if( regTester(text_reg, form.personalInfo.name))
		error_msg += "Incorrect Full Name\n"
	if( regTester(text_reg, form.personalInfo.email))
		error_msg += "Invalid Email ID\n"		
	if( regTester(text_reg, form.personalInfo.fatherName))
		error_msg += "Incorrect Father Name\n"		
	if( regTester(text_reg, form.personalInfo.motherName))
		error_msg += "Incorrect Mother Name\n"
	if( regTester(text_reg, form.personalInfo.gender))
		error_msg += "Select Gender\n"
	if( regTester(text_reg, form.personalInfo.caste))
		error_msg += "Select Caste\n"		
	if( form.personalInfo.dob == "")
		error_msg += "Enter Date of Birth\n"		
	if( regTester(text_reg, form.personalInfo.maritalStatus))
		error_msg += "Choose Martial Status\n"
	if( form.personalInfo.maritalStatus == "Married" && regTester(text_reg, form.personalInfo.spouseName))
		error_msg += "Invalid Spouse Name\n"
	if( regTester(text_reg, form.personalInfo.idType))
		error_msg += "Choose Id Type\n"
	if( regTester(text_reg, form.personalInfo.idNumber))
		error_msg += "Invalid ID\n"
	if( form.personalInfo.contactNumber == "")
		error_msg += "Invalid Contact Number\n"
										
			

} 

function regTester(regex,v){
	return ( v == "" || regex.test(v))
}