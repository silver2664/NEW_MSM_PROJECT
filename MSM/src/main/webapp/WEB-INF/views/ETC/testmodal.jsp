<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta id = "_csrf" name = "_csrf" content = "${_csrf.token}" />
<title>Material Design Bootstrap</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
</head>
<body>

<nav class = "navbar  navbar-expand-lg navbar-light white scrolling-navbar">
	<div class = "container-fluid">
		
	
		<!-- Header Menu -->
		<div class = "navbar" id = "headerMenu">
			<ul class = "navbar-nav ml-auto">
				<!-- SignUP -->
				<li class = "nav-item">
					<a type = "button" class = "btn btn-link waves-effect" data-toggle = "modal" data-target = "#signUp" style = "color : black">sign up</a>
					<div id = "signUp" class = "modal fade" tabindex = "-1" role = "dialog">
						<div class = "modal-dialog" role = "document">
							<div class = "modal-content">
								<div class = "modal-header text-center">
									<h4 class = "modal-title w-100 font-weight-bold">Sign Up</h4>
								</div>
							</div>
						</div>							
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>

<form action = "logout" method = "post">
	<a class = "btn" role = "button" type = "submit">LOG OUT</a>
	<input type = "submit" value = "LOGOUT"/>	
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />						
</form>

<a href = "/board/writeView">BOARD</a><br/>
<a href = "/home">home</a>

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>
</body>
</html>