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
    			  $("#city").append("<option selecetd disabled>City</option>")
    			  for(i=0;i<data.length;i++)
    				 $("#city").append("<option value="+data[i]+">"+data[i]+"</option>")
    		  },
    		  error: function() {
    		         $('#notification-bar').text('An error occurred');
    		      }
    		   });
    });
});

