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

    $('.datepicker').datepicker();
    
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
    			  	 $('#notification-bar').show();
    		         $('#notification-bar').text('An error occurred');
    		         $('#notification-bar').attr('class','alert fade in alert-danger');
    		  }
    	});
    });
    
    $("#editForm").validate({
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
  		json = $("#editForm").serializeJSON();
  		$.ajax({
  			   url: 'http://localhost:8080/register/edit',
  			   type : 'POST',
  			   dataType : 'json',
  			   contentType : 'application/json',
  			   data: json ,
  			  success: function(data) {
  			     $('#notification-bar').text(data);
  		         $('#notification-bar').attr('class','alert fade in alert-success');
  		         $('#notification-bar').show();
  		         },
  			  error: function() {
  			     $('#notification-bar').text(data);
  		         $('#notification-bar').attr('class','alert fade in alert-success');
  		         $('#notification-bar').show();
  		      }
  			   });
  	  }
  	});
});

var qual = $("#qualIndex").val();
var tr = $("#trIndex").val();
var wex = $("#wexIndex").val();

function addQualification() {
	var div = $("#qual"+qual).clone(true,true);
	div.attr('id', 'qual'+ ++qual);
	div.find('label').first().html('Qualification '+qual);
	div.find("input:text").val("");
	div.find("input:text").removeClass('floating-label-form-group-with-value');
	div.find("div").removeClass('floating-label-form-group-with-value');
	
	$("#qual"+(qual-1)).after(div);
	if(qual > 1)
		$("#qualDelbtn").show();
	else
		$("#qualDelbtn").hide();
	
	
}



function addWorkExp(){
	var div = $("#wexp"+wex).clone(true,true);
	div.attr('id', 'wexp'+ ++wex);
	div.find('label').first().html('Job '+wex);
	div.find("select.city").html("<option selected disabled>City</option>");
	div.find("input:text").val("");
	div.find("input:text").removeClass('floating-label-form-group-with-value');
	div.find("div").removeClass('floating-label-form-group-with-value');
	
	div.find('#fromDate'+(wex-1)).attr('id','fromDate'+wex);
	div.find('#toDate'+(wex-1)).attr('id','toDate'+wex);
//	div.find(".datepicker").datepicker();
	
	$("#wexp"+(wex-1)).after(div);

	if(wex > 1)
		$("#wexpDelbtn").show();
	else
		$("#wexpDelbtn").hide();
}



function addTraining(){
	var div = $("#train"+tr).clone(true,true);
	div.attr('id', 'train'+ ++tr);
	div.find('label').first().html('Training '+tr);
	div.find("select.city").html("<option selected disabled>City</option>");
	div.find("input:text").val("");
	div.find("input:text").removeClass('floating-label-form-group-with-value');
	div.find("div").removeClass('floating-label-form-group-with-value');
	
	div.find('#trfromDate'+(tr-1)).attr('id','trfromDate'+tr);
	div.find('#trtoDate'+(tr-1)).attr('id','trtoDate'+tr);
//	div.find(".datepicker").datepicker();
	

	
	$("#train"+(tr-1)).after(div);
	if(tr > 1)
		$("#trDelbtn").show();
	else
		$("#trDelbtn").hide();

}

function removeWorkExp(){
	$("#wexp"+wex).remove();
	--wex;
	if(wex > 1)
		$("#wexpDelbtn").show();
	else
		$("#wexpDelbtn").hide();
}


function removeTraining(){
	$("#train"+tr).remove();
	--tr;
	if(tr > 1)
		$("#trDelbtn").show();
	else
		$("#trDelbtn").hide();
}

function removeQualification(){
	$("#qual"+qual).remove();
	--qual;
	if(qual > 1)
		$("#qualDelbtn").show();
	else
		$("#qualDelbtn").hide();
}