<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session = "true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta id = "_csrf" name = "_csrf" content = "${_csrf.token}"/>
<title>Basic Form</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">
<!-- CK EDITOR -->
<script src="/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<div class = "container">
	<!-- Material form login -->
	<div class = "row">
	<div class="card col-md-6 offset-md-3" style = "width : 50%;">
	
	  <h5 class="card-header secondary-color white-text text-center py-4">
	    <strong>Sign In</strong>
	  </h5>
	
	  <!--Card content-->
	  <div class="card-body px-lg-5 pt-0">
	
	    <!-- Form -->
	    <form class="text-center" style="color: #757575;" action="/login" method = "POST">
	    <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
	
	      <!-- ID -->
	      <div class="md-form">
	        <input type="text" id="materialLoginFormEmail" class="form-control" name = "mId" required>
	        <label for="materialLoginFormEmail">ID</label>
	      </div>
	
	      <!-- Password -->
	      <div class="md-form">
	        <input type="password" id="materialLoginFormPassword" class="form-control" name = "mPw" required>
	        <label for="materialLoginFormPassword">Password</label>
	      </div>
	
	      <div class="d-flex justify-content-around">
	        <div>
	          <!-- Remember me -->
	          <div class="form-check">
	            <input type="checkbox" class="form-check-input" id="materialLoginFormRemember">
	            <label class="form-check-label" for="materialLoginFormRemember">Remember me</label>
	          </div>
	        </div>
	        <div>
	          <!-- Forgot password -->
	          <a href="#">Forgot password?</a>
	        </div>
	      </div>
	
	      <!-- Sign in button -->
	      <button class="btn btn-outline-info btn-block my-4 waves-effect z-depth-0" type="submit" style = "border-radius : 20px;">Sign In</button>
	      
	      <c:if test ="${not empty param.fail}">
		  	<div class = col-md-12>
				<font color = "red">
					<p>Your SIGN IN attempt was not successful, try again.</p>
					<p>Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>														
				</font>
				<c:remove scope = "session" var = "SPRING_SECURITY_LAST_EXCEPTION"/>
			</div>
		</c:if>	
	
	      <!-- Register -->
	      <p>Not a member?
	        <a href="/member/step1">Register</a>
	      </p>
	
	      <!-- Social login -->
	      <p>or sign in with:</p>
	      <a type="button" class="btn-floating btn-fb btn-sm">
	        <i class="fab fa-facebook-f"></i>
	      </a>
	      <a type="button" class="btn-floating btn-tw btn-sm">
	        <i class="fab fa-twitter"></i>
	      </a>
	      <a type="button" class="btn-floating btn-li btn-sm">
	        <i class="fab fa-linkedin-in"></i>
	      </a>
	      <a type="button" class="btn-floating btn-git btn-sm">
	        <i class="fab fa-github"></i>
	      </a>
	
	    </form>
	    <!-- Form -->
	
	  </div>
	
	</div>
	</div>
</div>
<!-- Material form login -->











<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>
<script>
function openNav() {
	  document.getElementById("mySidenav").style.width = "30vw";
	}
	
function openNav2() {
	  document.getElementById("mySidenav2").style.width = "30vw";
	}

function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}

function closeNav2() {
	  document.getElementById("mySidenav2").style.width = "0";
	}
</script>
</body>
</html>