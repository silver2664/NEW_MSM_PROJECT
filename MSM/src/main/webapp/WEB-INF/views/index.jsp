<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MSM INDEX</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- FULL PAGE -->
<link rel ="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
</head>
<style media ="screen"> 
* {
	margin:0;,padding:0;
}
#fullpage{
	z-index :2;
}
span {
	z-index: 3;
	position :fixed;
	height:50%
}
body {
  font-family: "Lato", sans-serif;
}
.sidenav {
  height: 100%;
  width: 300px;
  position: fixed;
  z-index: 4;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 180px;
}

.sidenav a {
  padding: 32px 0px 0px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}


#fullpage {
}
#sec1 {
	background-image : url("/resources/images/indexPageImg/ms1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
#sec2 {
	background-image : url("/resources/images/indexPageImg/se2.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
#sec3 {
	background-image : url("/resources/images/indexPageImg/se3.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
#sec4 {
	background-image : url("/resources/images/indexPageImg/se4.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
#slide1 {
	background-image : url("/resources/images/indexPageImg/ms1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
#slide2  {
	background-image : url("/resources/images/indexPageImg/se2.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
#slide3  {
	background-image : url("/resources/images/indexPageImg/se3.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
#slide4 {
	background-image : url("/resources/images/indexPageImg/se4.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
</style>
<body>

<div id="root">

	<div id="mySidenav" class="sidenav">
  		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  		<a href="/home">MSM HOME</a>
  		<a href="/product/listView">BRAND MALL</a>
  		<a href="/product/listView">ACCESSORY MALL</a>
  		<a href="/login">SIGN IN</a>
  		<a href="/member/step1">REGISTER</a>
	</div>

	<span style="font-size:30px; cursor:pointer" onclick="openNav()">&#9776;</span>

	<div id="fullpage">
		<div class="section" id ="sec1">
			<div class="slide" id="slide1"></div>
			<div class="slide" id="slide2"></div>
			<div class="slide" id="slide3"></div>
			<div class="slide" id="slide4"></div>
		</div>
	
		<div class="section" id ="sec2"></div>
		
		<div class="section" id ="sec3"></div>
		
		<div class="section" id ="sec4"></div>
	</div>
</div>

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>
<!-- Full Page -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.js"> </script>
<script>
function openNav() {	
	document.getElementById("mySidenav").style.width = "300px";
}
function closeNav() {	
	document.getElementById("mySidenav").style.width ="0";
}

$(document).ready(function () {
    $('#fullpage').fullpage({
    });
});
</script>
</body>
</html>