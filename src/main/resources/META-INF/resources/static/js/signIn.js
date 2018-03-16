$(document).ready(function() {
	$('#signUpBtn')
    .on('click', function(e) {
         $.ajax({
  		   
  		   url: 'http://localhost:8080/user/check?username='+$("#userName").val(),
  		   type : 'GET',
  		   success: function(data) {
  			   if(data == "true"){
  				 $('#notification-msg').text('Username already registered. Please try a different one.');
		         $('#notification').attr('class','alert fade in alert-danger');
		         $('#notification').show();
		      	}
  			   else{
  				 $("#signInForm").submit();  
  			   }
  		   	}
  		   });
    });
});
