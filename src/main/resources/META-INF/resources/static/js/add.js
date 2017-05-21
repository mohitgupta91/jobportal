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

    initializeDatepicker();
    
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
  		$.ajax({
  			   url: 'http://localhost:8080/register/add',
  			   type : 'POST',
  			   dataType : 'json',
  			   contentType : 'application/json',
  			   data: json ,
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

var qual = 1;
var wex = 1;
var tr = 1;

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

	initializeDatepicker();    
	if(wex > 1)
		$("#wexpDelbtn").show();
	else
		$("#wexpDelbtn").hide();
}



function addTraining(){
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

function initializeDatepicker() {
    $('.date').datepicker({
    	dateFormat:"yy-mm-dd",
    	changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        yearRange: '1950:2017'
        });
}