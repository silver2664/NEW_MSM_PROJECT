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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>상품 목록 -- MSM</title>

<style>
body{
    font-size:12px;
    line-height:15px;
    word-spacing:1px;
    letter-spacing:-1px;
    font-color:black;
}

.row {
	
	
}
div#root {
	width:90%;
	margin: 0 auto;
}
 
.card {
	margin-bottom:20px;
	
}

#brandIntro {
	height : 100vh;
	background-image : url("/resources/images/indexPageImg/ms1.jpg");
	background-size : cover;
	background-position : center;
	background-repeat : no-repeat;
}

</style>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">

</head>

<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<div class = "mask rgba-black-white d-flex justify-content-start align-items-center" style = "height : 600px;" id ="brandIntro">
	<div class = "text-left mx-5">
		<h3 class = "mb-4 font-weight-bold text-monospace"><strong>BBS-STUDIO</strong></h3>
		<p class = "mb-3 text-monospace font-weight-bolder font-italic"><strong>젠더리스 쥬얼리 아스 - Find your second skin</strong></p>
		<p class = "text-monospace mb-3 font-weight-light" style = "font-size : 12px;">
			컬러를 담은 쥬얼리. <br/>
			블랙 화이트 그레이가 대부분인 패션에 자신이 좋아하던 컬러를 하나쯤은 걸쳐보면 어떨까요? <br/>
			어릴 적 좋아하던 컬러가 확실했던 그때를 기억하며 나만의 색깔을 표현하기를 원합니다.
		</p>
		<p class = "text-monospace mb-3 font-weight-light" style = "font-size : 12px;">
			아스의 쥬얼리는 직접 손으로 제작해야 하는 작업 방식입니다. <br/>
			컬러를 더하기 위한 작업입니다. <br/>
			한 분 한 분의 색깔을 담고 사이즈를 맞춘 단 하나의 주얼리입니다.
		</p>
		<p class = "text-monospace mb-3 font-weight-light" style = "font-size : 12px;">
			처음부터 마무리까지 제작자의 손을 거쳐 완성됩니다. <br/>
			기다리시기에 조금은 긴 기간일 수 있지만 받으실 때의 기쁨을 소중히 생각하고 만들고 있습니다. <br/>
			단순히 화력하게 보이기 위한 악세사리가 아닌 <br/>
			소장하고 싶고 모으고 싶은, 하나의 작품으로서 가치를 인정받고 시습니다. <br/>
			아스의 가치를 알아주시는 모든 분을 생각하며 처음과 변함없는 마음가짐을 지켜가겠습니다.
		</p>
		<a target = "_blank" href = "http://aas-studio.com" class = "btn btn-outline-secondary btn-lg">BBS-STUDIO HOMEPAGE</a>
	</div>	
</div>

<br/>

<div class = "container" style = "height : 80px;">
	<nav class = "navbar navbar-expand-lg white">
		<img src = "/resources/images/logo/aasLogo.jpg" style = "width : 120px; height : 80px;">
		<!-- Collapse Menu -->
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#goodsNav">
	   		<span class="navbar-toggler-icon"></span>
	    </button>
	    <!-- Header Menu -->
		<div class = "collapse navbar-collapse" id = "goodsNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/product/bbsList">ALL</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/product/listView3?c=201">RING</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/product/listView3?c=202">earring</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/product/listView3?c=203">bracelet</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/product/listView3?c=204">necklace</a>									
				</li>
			</ul>
			<form class = "form-inline my-2 my-lg-0 ml-auto">
				<input class = "form-control" type = "search" placeholder = "search"/>
				<button class = "btn btn-outline-secondary btn-md my-2 my-sm-0 ml-3" type = "submit">Search</button>
			</form>
		</div>	
	</nav>
</div>

<br/><br/>

<div class="container">
	<div class="row">		
		<c:forEach var = "row" items = "${list}">
			<div class="col-xl-3 col-md-3 col-sm-3 card card-cascade narrow card-ecommerce d-flex">
			
				<!-- Card Image -->				
				<div class="view zoom view-cascade overlay">
					<a href = "${path}/product/productView/${row.mgNum}"><img src = "/resources/${row.mgImg}" style="width:100%"></a>
				</div>
				
				<!-- Card Content -->
				<div class="card-body card-body-cascade text-center pb-3">
				
					<!-- Title -->
					<h6 class="card-title mb-1">
						<a style = "color : black;" href="${path}/product/productView/${row.mgNum}">${row.mgName}</a>
					</h6>
					
					<!-- Card Footer -->
					<div class="card-footer px-1">
						<span class="float-left font-weight-bold">
							<strong><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${row.mgPrice}"/></strong>
						</span> 
						<span class="float-right"> 
							<a class="material-tooltip-main" data-toggle="tooltip" data-place="top" title="Add to Cart" id = "addCart" href="/cart/insert?mgNum=${row.mgNum}&amount=1">
							<input type="hidden" value="${row.mgNum}" name="mgNum"id="mgNum"/> 
							<i class="fas fa-shopping-cart grey-text ml-3"></i></a> 
							
							<a class="material-tooltip-main" data-toggle="tooltip" data-place="top" title="Add to WishList"> 
							<i class="fas fa-heart grey-text ml-3"></i></a>
						</span>
					</div>
				</div>
			</div>
		</c:forEach>		
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

<script>
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})

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

<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
</body>
</html>