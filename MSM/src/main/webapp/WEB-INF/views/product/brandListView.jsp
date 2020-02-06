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
<title>MSM Brand Mall</title>
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
<style>
#brandIntro {
	height : 100vh;
	background-image : url("/resources/images/indexPageImg/ms1.jpg");
	background-size : cover;
	background-position : center;
	background-repeat : no-repeat
	
}
</style>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<div style = "height : 550px;" id = "brandIntro"></div>
<div class = "mt-2" style = "border : 3px solid red; height : 150px;">
	<div class = "container-fluid">
		<div class = "row" style = "margin : auto">
			<div class = "col-sm-2 mt-3 mb-2 ml-4" style = "height : 100px; border : 3px solid purple; margin : auto">BRAND</div>
			<div class = "col-sm-2 mt-3 mb-2 ml-4" style = "height : 100px; border : 3px solid purple; margin : auto">BRAND</div>
			<div class = "col-sm-2 mt-3 mb-2 ml-4" style = "height : 100px; border : 3px solid purple; margin : auto">BRAND</div>
			<div class = "col-sm-2 mt-3 mb-2 ml-4" style = "height : 100px; border : 3px solid purple; margin : auto">BRAND</div>
			<div class = "col-sm-2 mt-3 mb-2 ml-4" style = "height : 100px; border : 3px solid purple; margin : auto">BRAND</div>	
		</div>
	</div>
</div>
<div class = "container-fluid">
	<div class = "row">
		<div class = "col-lg-2 col-md-3 col-sm-3 mt-3" style = "border : 3px solid purple; height : 100vh;">Search And Category</div>
		<div class = "col-lg-10">			
			<div class = "row">
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-2 col-md-2 col-sm-2 mt-3 mb-2 ml-3" style = "border : 3px solid black; height : 250px; margin : auto"></div>
				<div class = "col-xl-6 offset-md-6 mt-5" style = "border : 3px solid black; height : 50px; margin : auto;">Pagination</div>			
			</div>			
		</div>
	</div>
</div>












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