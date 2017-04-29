$(document).ready(function() {
	$('#chPasswdUser')
    .on('submit', function(e) {
         e.preventDefault();
         
         $.ajax({
  		   
  		   url: 'http://localhost:8080/user/'+$("#userId").val()+'/changePassword',
  		   type : 'POST',
  		   data : { passwd : $("#userpasswd").val()},
  		  success: function(data) {
  			     $('#notification-bar').text('Password Successfully Changed');
  		         $('#notification-bar').attr('class','alert fade in alert-success');
  		         $('#notification-bar').show();
  		         $('#chPwd').modal('hide');
		      },
  		  error: function() {
		         	$('#notification-bar').text('Error Occured While Changing Password. Contact Admin');
		         	$('#notification-bar').attr('class','alert fade in alert-danger');
		         	$('#chPwd').modal('hide');
		         	$('#notification-bar').show();
		      	}
  		   });
    });
});

function passwdModal(id){
	$("#userId").val(id);
	$("#chPwd").modal('show');
}