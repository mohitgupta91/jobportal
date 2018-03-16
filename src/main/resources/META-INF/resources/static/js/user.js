$(document).ready(function() {
	$('#userTable').DataTable();
	
	$('#chPasswdUser')
    .on('submit', function(e) {
         e.preventDefault();
         
         $.ajax({
  		   
  		   url: 'http://localhost:8080/user/'+$("#userId").val()+'/changePassword',
  		   type : 'POST',
  		   data : { passwd : $("#userpasswd").val()},
  		  success: function(data) {
  			     $('#notification-msg').html('Password Successfully Changed');
  		         $('#notification').attr('class','alert fade in alert-success');
  		         $('#notification').show();
  		         $('#chPwd').modal('hide');
		      },
  		  error: function() {
		         	$('#notification-msg').text('Error Occured While Changing Password. Contact Admin');
		         	$('#notification').attr('class','alert fade in alert-danger');
		         	$('#chPwd').modal('hide');
		         	$('#notification').show();
		      	}
  		   });
    });	
	
	
	$('#addBtn')
    .on('click', function(e) {
        var emailId = $("#emailId").val();
        var role = $("#role").val();
    	var message = "";
        $.ajax({
  		   
  		   url: 'http://localhost:8080/user/check?username='+$("#userName").val(),
  		   type : 'GET',
  		   success: function(data) {
  			   if(data == "true"){
  				 message += "Username already registered. Please try a different one.\n";  
  		   		}
  			  }
  		   });
        if(emailId == null || emailId == ""){
        	message += "Please provide Email ID. \n"
        }
        if(role == null || role == ""){
        	message += "Please select a Role. \n"
        }
    	if(message != ""){
    		$('#notification-msg1').text(message);
			$('#notification1').attr('class','alert fade in alert-danger');
	        $('#notification1').show();	      	
    	}
    	else{
			$("#userAdd").submit();  
		}
    });
});

function passwdModal(id){
	$("#userId").val(id);
	 $.ajax({
  		   url: 'http://localhost:8080/user/'+id+'/userName',
  		   type : 'GET',
  		  success: function(data) {
  			$("#lbl").html("Changing Password for : "+data);
		}
	 });
	$("#chPwd").modal('show');
}