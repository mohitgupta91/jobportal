<!-- Theme JavaScript -->
    
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    for (var d = 0; d < dropdowns.length; d++) {
      var openDropdown = dropdowns[d];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


$(document).ready(function() {
    $('#chPasswd')
        .on('submit', function(e) {
             e.preventDefault();
             alert("Here : ");
             $.ajax({
      		   
      		   url: 'http://localhost:8080/user/changePassword',
      		   type : 'POST',
      		   data : { passwd : $("#newPasswd").val()},
      		  success: function(data) {
      			  alert("Here : ");
      		         $('#notification-bar').text('Password Successfully Changed');
      		         $('#notification-bar').addClass('alert-success');
      		         $('#notification-bar').show();
      		         $('#passwdModal').modal('hide');
    		      },
      		  error: function() {
   		         	$('#notification-bar').text('Error Occured While Changing Password. Contact Admin');
   		         	$('#notification-bar').addClass('alert-danger');
   		         	$('#passwdModal').modal('hide');
   		         	$('#notification-bar').show();
  		      	}
      		   });
        });
});