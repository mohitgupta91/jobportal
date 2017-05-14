$(document).ready(function() {
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
});

function passwdModal(id){
	$("#userId").val(id);
	$("#chPwd").modal('show');
}