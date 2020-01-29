<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Material Design Bootstrap</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
<!-- Material Design Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/css/mdb.min.css" rel="stylesheet" />
<!-- Your custom styles (optional) -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" />
</head>
<body>
<!-- Start Navbar -->
<nav class = "navbar fixed-top navbar-expand-lg navbar-dark secondary-color scrolling-navbar">
	<div class = "container-fluid">
		<!-- Brand -->
		<a class="navbar-brand" href="#">
        <strong class="white-text">MSM</strong>
      	</a>
      	<!-- collapse -->
      	<button class = "navbar-toggler" type = "button" data-toggle = "collapse" data-target = "#navbarSupportedContent">
      		<span class = "navbar-toggler-icon"></span>
      	</button>
      	<!-- LINK -->
      	<div class = "collapse navbar-collapse" id = "navbarSupportedContent">
      		<!-- Left -->
      		<ul class = "navbar-nav ml-5 mr-auto">
      			<li class = "nav-item dropdown mega-dropdown ml-3">
      				<a class = "nav-link waves-effect" id = "brandMenu" data-toggle = "dropdown" href = "#">BRAND</a>
      				<div class = "dropdown-menu mega-menu v-2 z-depth-1 info-color py-5 px-3">
      					<div class = "row">
      						<div class = "col-md-6 col-xl-3 sub-menu mb-xl-0 mb-4">
      							<h6 class = "sub-title text-uppercase font-weight-bold white-text">Launching brand</h6>
      							<ul class = "list-unstyled">
      								<li>
      									<a class = "menu-item pl-0" href = "#">
      										<i class = "fas fa-caret-right pl-1 pr-3"></i>AAS STORE
      									</a>
      								</li>
      								<li>
      									<a class = "menu-item pl-0" href = "#">
      										<i class = "fas fa-caret-right pl-1 pr-3"></i>BRAND2[PHONECASE]
      									</a>
      								</li>
      							</ul>
      						</div>
      					</div>
      				</div>
      			</li>
      			<li class = "nav-item ml-3">
      				<a class = "nav-link waves-effect" href = "#">BRAND</a>
      			</li>
      			<li class = "nav-item ml-3">
      				<a class = "nav-link waves-effect" href = "#">GOODS</a>
      			</li>
      		</ul>
      		<!-- Right -->
      		<ul class = "navbar-nav nav-flex-icons">
      			<li class = "nav-item ml-5">
      				<a class = "nav-link waves-effect">
      					<i class = "fas fa-shopping-cart"></i>
      					<span class = "clearfix d-none d-sm-inline-block">Cart</span>
      				</a>
      			</li>
      			<li class = "nav-item ml-5">
      				<a class = "nav-link waves-effect">
      					<i class = "fab fa-facebook-f"></i>
      				</a>
      			</li>
      			<li class="nav-item ml-5">
            		<a class="nav-link waves-effect">
              			<i class="fab fa-twitter"></i>
            		</a>
          		</li>
          		<li class="nav-item ml-5">
            		<a class="nav-link border border-light rounded waves-effect">
              			<i class="fab fa-github mr-2"></i>MSM Subscribe
            		</a>
         		 </li>
      		</ul>
      	</div>
	</div>
</nav>
<!-- End Navbar -->
<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>
</body>
</html>