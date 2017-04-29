<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                        <span class="name">${title}</span>
                        <hr class="star-light">
                    </div>
                </div>
            </div>
        </div>
    </header>
	<c:if test="${not empty message}">
   		<div id="notification" class="alert alert-${type} fade in">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
				${message}
		</div>
	</c:if>
	<div id="notification-bar" class="alert fade in" style="display:none">
		<a href="#" class="close" data-dismiss="alert">&times;</a>
	</div>