<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    line-height:16px;
    word-spacing:1px;
    letter-spacing:-1px;
    
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


</style>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<!-- Carousel Wrapper -->
<div id="video-carousel-example2" class="carousel slide carousel-fade" data-ride="carousel">
	<!--Indicators-->
	<ol class="carousel-indicators">
    	<li data-target="#video-carousel-example2" data-slide-to="0" class="active"></li>
    	<li data-target="#video-carousel-example2" data-slide-to="1"></li>
    	<li data-target="#video-carousel-example2" data-slide-to="2"></li>
  	</ol>
  	<!--/.Indicators-->
  	<!--Slides-->
  	<div class="carousel-inner" role="listbox">
  		<!-- First slide -->
    	<div class="carousel-item active">
      		<!--Mask color-->
      		<div class="view">
        	<!--Video source-->
        		<video class="video-fluid" autoplay loop muted>
          		<source src="https://mdbootstrap.com/img/video/Lines.mp4" type="video/mp4" />
        		</video>
        	<div class="mask rgba-indigo-light"></div>
      		</div>
      		    		
    		<!--Caption-->
      		<div class="carousel-caption">
        		<div class="animated fadeInDown">
          			<h3 class="h3-responsive text-weight-bold">GRAND OPEN!!</h3>
          			<p>2020. 02. 26. wed.</p>
        		</div>
      		</div>
      		<!--Caption-->
      		
    	</div>
    	<!-- /.First slide -->
    	<!-- Second slide -->
   	 	<div class="carousel-item">
      		<!--Mask color-->
      		<div class="view">
        		<!--Video source-->
        		<video class="video-fluid" autoplay loop muted>
         	 		<source src="https://mdbootstrap.com/img/video/animation-intro.mp4" type="video/mp4" />
        		</video>
       	 	<div class="mask rgba-purple-slight"></div>
      		</div>
	      	<!--Caption-->
      		<div class="carousel-caption">
        		<div class="animated fadeInDown">
          			<h3 class="h3-responsive text-weight-bold">GRAND OPEN!!</h3>
          			<p>2020. 02. 26. wed.</p>
        		</div>
      		</div>
      		<!--Caption-->
    	</div>
    	<!-- /.Second slide -->
    	<!-- Third slide -->
    	<div class="carousel-item">
      		<!--Mask color-->
      		<div class="view">
        		<!--Video source-->
        		<video class="video-fluid" autoplay loop muted>
          			<source src="https://mdbootstrap.com/img/video/Tropical.mp4" type="video/mp4" />
        		</video>
        		<div class="mask rgba-black-strong"></div>
      		</div>
      		<!--Caption-->
      		<div class="carousel-caption">
        		<div class="animated fadeInDown">
          			<h3 class="h3-responsive text-weight-bold">GRAND OPEN!!</h3>
          			<p>2020. 02. 26. wed.</p>
        		</div>
      		</div>
      		<!--Caption-->
    	</div>
    	<!-- /.Third slide -->
  	</div>
  	<!--/.Slides-->
  	<!--Controls-->
  	<a class="carousel-control-prev" href="#video-carousel-example2" role="button" data-slide="prev">
    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    	<span class="sr-only">Previous</span>
  	</a>
  	<a class="carousel-control-next" href="#video-carousel-example2" role="button" data-slide="next">
    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
    	<span class="sr-only">Next</span>
  	</a>
  	<!--/.Controls-->
</div>
<!-- /Carousel Wrapper -->
<br/><br/>
<!-- ALL PRODUCT NAVIGATION -->
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
						style = "font-size : 14px; color : black" href = "/brand/allList">ALL</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/brand/ringList">RING</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/brand/earringList">earring</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/brand/braceletList">bracelet</a>									
				</li>
				<li class="nav-item">
					<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
						style = "font-size : 14px; color : black" href = "/brand/necklaceList">necklace</a>									
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
				<div class="view view-cascade overlay">
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
							<strong><fmt:setLocale value="ko_KR"/>
							<fmt:formatNumber type="currency" value="${row.mgPrice}"/></strong>
						</span> 
						<span class="float-right">
							<a class="material-tooltip-main" data-toggle="tooltip" data-place="top" title="Add to Cart" href="/cart/insert?mgNum=${row.mgNum}&amount=1">
								<input type="hidden" value="${row.mgNum}" name="mgNum"id="mgNum"/>
								<i class="fas fa-shopping-cart grey-text ml-3"></i></a>
							<a class="material-tooltip-main" data-toggle="tooltip"	data-place="top" title="Add to WishList">
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