 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Job Search</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a href="<c:url value="/search"/>">Search</a>
                    </li>
                    <li>
                        <a href="<c:url value="/register"/>" >Register</a>
                    </li>
                    <li>
                        <a href="<c:url value="/view"/>">View</a>
                    </li>
                    <li class="dropdown">
    					<a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">Settings</a>
    						<div class="dropdown-content" id="myDropdown">
						      <a href="<c:url value="/user"/>" >Users</a>
						      <a href="#passwdModal" class="portfolio-link" data-toggle="modal">Change Password</a>
						      <a href="<c:url value="/logout"/>">Logout</a>
						    </div>
  					</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    
        <!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" id="passwdModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Change Password</h2>
                            <hr class="star-primary">
                 	<form name="chPasswd" id="chPasswd"  method="post" action="<c:url value="/user/changePassword" />">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="New Password" id="newPasswd" name="newPasswd" required data-validation-required-message="Please enter your New Password.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Change</button>
                            </div>
                        </div>
                    </form>
                         <br><br><br>   
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
 