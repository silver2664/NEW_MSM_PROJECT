<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session = "true"%>
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
<title>Material Design Bootstrap</title>
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
<!-- Header Navbar -->
<nav class = "navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
	<div class = "container-fluid">
		<!-- BRAND -->
		<a class = "navbar-brand wave-effect" href = "/home">
			<strong class = "blue-text">MSM</strong>
		</a>
		<!-- Collapse Menu -->
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#headerMenu">
	   		<span class="navbar-toggler-icon"></span>
	    </button>
		<!-- Header Menu -->
		<div class = "collapse navbar-collapse" id = "headerMenu">
			<ul class = "navbar-nav ml-auto">
				<!-- SignUP -->
				<li class = "nav-item">					
					<!-- <a type = "button" class = "btn btn-link waves-effect" data-toggle = "modal" data-target = "#signUp" style = "color : black">sign up</a> -->		
					<a type = "button" class = "btn btn-link waves-effect" href = "/member/step1">SIGN UP</a>
				</li>
				<!-- //SignUp -->
				<!-- LOGIN -->
				<li class = "nav-item">
					<sec:authorize access = "isAnonymous()">
						<a type = "button" class = "btn btn-link waves-effect" href = "#" onclick = "openNav2()" id = "login">sign in</a>
					</sec:authorize>
					<sec:authorize access = "isAuthenticated()">
						<form action = "logout" method = "post">
							<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
							<button type = "submit" class = "btn btn-link waves-effect" style = "color : black">sign out</button>
						</form>
					</sec:authorize>
					<div id = "mySidenav2" class = "sidenav">				
						<h3 class = "text-center text-white mb-5">Sign In</h3>
						<div class = "container-fluid">
							<section class = "text-center text-lg-center dark-gery-text">
								<div class = "row">
									<div class = "col-md-12">
										<form class = "text-center" action = "login" method = "post">
											<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
											<input type = "text" class = "form-control mb-4" name = "mId" placeholder = "ID" required>
											<input type = "password" class = "form-control mb-4" name = "mPw" placeholder = "PassWord" required>
											<div class = "col-md-12 d-flex justify-content-left">
												<div>
													<div class = "custom-control custom-checkbox">
														<input type = "checkbox" class = "custom-control-input" id = "remember_me" checked>
														<label class = "custom-control-label text-white" for = "remember_me">Remember Me</label>
													</div>
												</div>
											</div>
											<button class = "btn btn-primary text-white my-4" id = "logBtn" type = "submit">SIGN IN</button>
											<p class = "text-white">Not Member?
												<a href = "/member/step1" style = "display : inline; color : white; padding : 4px; font-size : 16px">REGISTER</a>
											</p>
											<c:if test ="${not empty param.fail}">
												<div class = col-md-12>
													<font color = "red">
														<p>Your SIGN IN attempt was not successful, try again.</p>
														<p>Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>														
													</font>
													<c:remove scope = "session" var = "SPRING_SECURITY_LAST_EXCEPTION"/>
												</div>
											</c:if>											
										</form>
									</div>		
								</div>
							</section>
						</div>
						<a href = "javascript:void(0)" class = "closebtn" onclick = "closeNav2()">&times;</a>
					</div>
				</li>
				<!-- //LOGIN -->
				<li class = "nav-item">				
					<!-- My Account Sidebar Btn -->
					<a type = "button" class = "btn btn-link waves-effect" href = "#" onclick = "openNav()">My Account</a>
					<div id = "mySidenav" class = "sidenav">
						<h3 class = "text-center text-white mb-5">My Account</h3>
						<a href = "javascript:void(0)" class = "closebtn" onclick = "closeNav()">&times;</a>
						<a class = "btn btn-outline-white mb-5" href = "#" target = "_blank" role = "button">
							Profile
						</a>
						<a class = "btn btn-outline-white mb-5" href = "/cart/cartView" role = "button">
							Cart
						</a>
						<a class = "btn btn-outline-white mb-5" href = "/board/list" role = "button">
							BOARD
						</a>
						<sec:authorize access = "isAuthenticated()">
						<form action = "logout" method = "post">
							<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
							<button type = "submit" class = "btn btn-outline-white mb-5" style = "color : black" id = "signOut1">Sign Out</button>
						</form>
					</sec:authorize>
					</div>					
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- Carousel Wrapper -->
<div id = "carousel-example-1z" class = "carousel slide carousel-fade pt-5" data-ride = "carousel">
	<!--Indicators-->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-1z" data-slide-to="1"></li>
      <li data-target="#carousel-example-1z" data-slide-to="2"></li>
    </ol>
    <!-- Slides -->
    <div class = "carousel-inner" role = "listbox">
    	<!-- First Slide -->
    	<div class = "carousel-item active">
    		<div class="view" style="background-image: url('/resources/images/indexPageImg/se2.jpg'); 
    			background-repeat: no-repeat; background-size: cover;">
    			<!-- Mask & FlexBox Option -->
    			<div class = "mask rgba-black-strong d-flex justify-content-center align-items-center">
    				<div class = "text-center white-text mx-5 wow fadeIn">
    					<h1 class = "mb-4">
    						<strong>Test MSM Home</strong>
    					</h1>
    					<p>
    						<strong>Example Mask &amp; FlexBox Option!</strong>
    					</p>
    					<p class = "mb-4 d-none d-md-block">
    						<strong> Example MSM Homepage <br/> 2019.12.30. AM 10 : 39. Monday.</strong>
    					</p>
    				</div>
    			</div>
    		</div>
    	</div>
    	<!-- Second Slide -->
    	<div class = "carousel-item">
    		<div class="view" style="background-image: url('/resources/images/indexPageImg/se1.jpg'); 
    			background-repeat: no-repeat; background-size: cover;">
    			<!-- Mask & FlexBox Option -->
    			<div class = "mask rgba-black-strong d-flex justify-content-center align-items-center">
    				<div class = "text-center white-text mx-5 wow fadeIn">
    					<h1 class = "mb-4">
    						<strong>Test MSM Home</strong>
    					</h1>
    					<p>
    						<strong>Example Mask &amp; FlexBox Option!</strong>
    					</p>
    					<p class = "mb-4 d-none d-md-block">
    						<strong> Example MSM Homepage <br/> 2019.12.30. AM 10 : 39. Monday.</strong>
    					</p>
    				</div>
    			</div>
    		</div>
    	</div>
    	<!-- Third Slide -->
    	<div class = "carousel-item">
    		<div class="view" style="background-image: url('/resources/images/indexPageImg/ms1.jpg'); 
    			background-repeat: no-repeat; background-size: cover;">
    			<!-- Mask & FlexBox Option -->
    			<div class = "mask rgba-black-strong d-flex justify-content-center align-items-center">
    				<div class = "text-center white-text mx-5 wow fadeIn">
    					<h1 class = "mb-4">
    						<strong>Test MSM Home</strong>
    					</h1>
    					<p>
    						<strong>Example Mask &amp; FlexBox Option!</strong>
    					</p>
    					<p class = "mb-4 d-none d-md-block">
    						<strong> Example MSM Homepage <br/> 2019.12.30. AM 10 : 39. Monday.</strong>
    					</p>
    				</div>
    			</div>
    		</div>
    	</div>
    	<!--Controls-->
    	<a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
      		<span class="carousel-control-prev-icon"></span>
      		<span class="sr-only">Previous</span>
    	</a>
    	<a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
      		<span class="carousel-control-next-icon"></span>
      		<span class="sr-only">Next</span>
    	</a>
    </div>
</div>
<!-- Main -->
<main>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light white mt-1 mb-5">
		<!-- Navbar Brand -->
		<span class="navbar-brand">Categories : </span>
		<!-- Collapse button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#CategoryNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Collapsible Content -->
		<div class="collapse navbar-collapse" id="CategoryNav">
			<!-- Links -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown mega-dropdown">
					<a class="nav-link text-uppercase" data-toggle="dropdown">brand</a>					
					<div class="dropdown-menu mega-menu v-2 z-depth-1 py-4 px-0">
						<div class = "row">										
							<div class="col-md-6 col-xl-3 sub-menu mb-xl-0 mb-4">
								<h6 class="sub-title text-uppercase font-weight-bold">ACCESSORY</h6>
								<ul class="list-unstyled">
									<li><a href="/product/listView" class="menu-item">AAS-Studio</a></li>
									<li><a href="#" class="menu-item">Example01</a></li>
									<li><a href="#" class="menu-item">Example02</a></li>
								</ul>
							</div>
							<div class="col-md-6 col-xl-3 sub-menu mb-xl-0 mb-4">
								<h6 class="sub-title text-uppercase font-weight-bold">PhoneCase</h6>
								<ul class="list-unstyled">
									<li><a href="#" class="menu-item">Example</a></li>
									<li><a href="#" class="menu-item">Example01</a></li>
									<li><a href="#" class="menu-item">Example02</a></li>
								</ul>
							</div>
							<div class="col-md-6 col-xl-3 sub-menu mb-xl-0 mb-4">
								<h6 class="sub-title text-uppercase font-weight-bold">New Category</h6>
								<ul class="list-unstyled">
									<li><a href="#" class="menu-item">Example</a></li>
									<li><a href="#" class="menu-item">Example01</a></li>
									<li><a href="#" class="menu-item">Example02</a></li>
								</ul>
							</div>
							<div class="col-md-6 col-xl-3 sub-menu mb-xl-0 mb-4">
								<h6 class="sub-title text-uppercase font-weight-bold">New Category</h6>
								<ul class="list-unstyled">
									<li><a href="#" class="menu-item">Example</a></li>
									<li><a href="#" class="menu-item">Example01</a></li>
									<li><a href="#" class="menu-item">Example02</a></li>
								</ul>
							</div>	
						</div>						
					</div>					
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle = "dropdown" href="#">ACCESSORY</a>
					<ul class = "dropdown-menu">
						<li class = "dropdown-item">
							<a class = "dropdown-link">RINGS</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">BRACELETS</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">NECKLACES</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EARRINGS</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">PET NECKLACES</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">GOLD PRODUCTS</a>
						</li>	
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">GLASSES CHAINS</a>
						</li>					
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle = "dropdown" href="#">PHONECASE</a>
					<ul class = "dropdown-menu">
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 01</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 02</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 03</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 04</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 05</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 06</a>
						</li>	
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 07</a>
						</li>					
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle = "dropdown" href="#">Ex_Category 01</a>
					<ul class = "dropdown-menu">
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 01</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 02</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 03</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 04</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 05</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 06</a>
						</li>	
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 07</a>
						</li>					
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle = "dropdown" href="#">Ex_Category 02</a>
					<ul class = "dropdown-menu">
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 01</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 02</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 03</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 04</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 05</a>
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 06</a>
						</li>	
						</li>
						<li class = "dropdown-item">
							<a class = "dropdown-link">EXAMPLE 07</a>
						</li>					
					</ul>
				</li>
			</ul>
			<!-- Search -->
			<form class="form-inline">
				<div class="md-form my-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
				</div>
			</form>
		</div>
	</nav>
		<!-- MSM Policy -->
	<div class = "container-fluid">
		<div class = "row">
			<div class = "col-lg-3 col-md-6 text-center p-5" id = "pol1">
				<i class="fas fa-sync-alt fa-10x mb-5 green-text"></i>
				<h4 class = "mb-3 font-italic font-weight-bold">30 Days Returns</h4>
			</div>
			<div class = "col-lg-3 col-md-6 text-center p-5" id = "pol2">
				<i class="fas fa-truck fa-10x mb-5 green-text"></i>
				<h4 class = "mb-3 font-italic font-weight-bold">Free Shipping</h4>
			</div>
			<div class = "col-lg-3 col-md-6 text-center p-5" id = "pol1">
				<i class="fas fa-shield-alt fa-10x mb-5 green-text"></i>
				<h4 class = "mb-3 font-italic font-weight-bold">Security Payment</h4>
			</div>
			<div class = "col-lg-3 col-md-6 text-center p-5" id = "pol2">
				<i class="fas fa-gift fa-10x mb-5 green-text"></i>
				<h4 class = "mb-3 font-italic font-weight-bold">Member DisCount</h4>
			</div>
		</div>
	</div>
	<!-- BestSeller -->
	<div class="container my-5">
		<!-- Section : Content -->
		<section class="dark-grey-text text-center">
			<!-- Section Heading -->
			<h3 class="font-weight-bold mb-4 pb-2">MSM BestSellers</h3>
			<!-- Section Description -->
			<p class="grey-text w-responsive mx-auto mb-5">
				Example BestSellers Section. <br /> 2019. 12. 30. 13 : 10. Monday.
			</p>
			<!-- Grid Row -->
			<div class="row">
				<!-- Card1 -->
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card card-cascade narrow card-ecommerce">
						<!-- Card Image -->
						<div class="view view-cascade overlay">
							<img
								src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/1.jpg"
								class="card-img-top" alt="sample photo"> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<!-- Card Content -->
						<div class="card-body card-body-cascade text-center pb-3">
							<!-- Title -->
							<h5 class="card-title mb-1">
								<strong> <a href="#">Example No.1</a>
								</strong>
							</h5>
							<!-- Rating -->
							<div class="container">
								<i class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i>
							</div>
							<!-- Description -->
							<p class="card-text">MSM Goods No.1 Example</p>
							<!-- Card Footer -->
							<div class="card-footer px-1">
								<span class="float-left font-weight-bold"> <strong>99,000원</strong>
								</span> <span class="float-right"> <a
									class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
								</a> <a class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to WishList"> <i
										class="fas fa-heart grey-text ml-3"></i>
								</a>
								</span>
							</div>
						</div>
					</div>
				</div>
					<!-- Card 2 -->
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card card-cascade narrow card-ecommerce">
						<!-- Card Image -->
						<div class="view view-cascade overlay">
							<img
								src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/2.jpg"
								class="card-img-top" alt="sample photo"> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<!-- Card Content -->
						<div class="card-body card-body-cascade text-center pb-3">
							<!-- Title -->
							<h5 class="card-title mb-1">
								<strong> <a href="#">Example No.2</a>
								</strong>
							</h5>
							<!-- Rating -->
							<div class="container">
								<i class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star-half-alt amber-text"></i>
							</div>
							<!-- Description -->
							<p class="card-text">MSM Goods No.2 Example</p>
							<!-- Card Footer -->
							<div class="card-footer px-1">
								<span class="float-left font-weight-bold"> <strong>79,000원</strong>
								</span> <span class="float-right"> <a
									class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
								</a> <a class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to WishList"> <i
										class="fas fa-heart grey-text ml-3"></i>
								</a>
								</span>
							</div>
						</div>
					</div>
				</div>
					<!-- Card 3 -->
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card card-cascade narrow card-ecommerce">
						<!-- Card Image -->
						<div class="view view-cascade overlay">
							<img
								src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/3.jpg"
								class="card-img-top" alt="sample photo"> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<!-- Card Content -->
						<div class="card-body card-body-cascade text-center pb-3">
							<!-- Title -->
							<h5 class="card-title mb-1">
								<strong> <a href="#">Example No.3</a>
								</strong>
							</h5>
							<!-- Rating -->
							<div class="container">
								<i class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="fas fa-star amber-text"></i> <i
									class="far fa-star amber-text"></i>
							</div>
							<!-- Description -->
							<p class="card-text">MSM Goods No.3 Example</p>
							<!-- Card Footer -->
							<div class="card-footer px-1">
								<span class="float-left font-weight-bold"> <strong>89,000원</strong>
								</span> <span class="float-right"> <a
									class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
								</a> <a class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to WishList"> <i
										class="fas fa-heart grey-text ml-3"></i>
								</a>
								</span>
							</div>
						</div>
					</div>
				</div>
					<!-- Card 4 -->
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card card-cascade narrow card-ecommerce">
						<!-- Card Image -->
						<div class="view view-cascade overlay">
							<img
								src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/4.jpg"
								class="card-img-top" alt="sample photo"> <a>
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<!-- Card Content -->
						<div class="card-body card-body-cascade text-center pb-3">
							<!-- Title -->
							<h5 class="card-title mb-1">
								<strong> <a href="#">Example No.4</a>
								</strong>
							</h5>
							<!-- Rating -->
							<div class="container">
								<div class="container">
									<i class="fas fa-star amber-text"></i> <i
										class="fas fa-star amber-text"></i> <i
										class="fas fa-star amber-text"></i> <i
										class="fas fa-star amber-text"></i> <i
										class="far fa-star amber-text"></i>
								</div>
							</div>
							<!-- Description -->
							<p class="card-text">MSM Goods No.4 Example</p>
							<!-- Card Footer -->
							<div class="card-footer px-1">
								<span class="float-left font-weight-bold"> <strong>79,000원</strong>
								</span> <span class="float-right"> <a
									class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
								</a> <a class="material-tooltip-main" data-toggle="tooltip"
									data-place="top" title="Add to WishList"> <i
										class="fas fa-heart grey-text ml-3"></i>
								</a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- //BestSellers -->
	
	<!-- New Arrival -->
	<div class="container my-5">
	  <!-- Section -->
	  <section>
	    <h3 class="font-weight-bold text-center dark-grey-text pb-2">New Arrival</h3>
	    <hr class="w-header my-4">
	    <p class="lead text-center text-muted pt-2 mb-5">You can find several product design by our professional team in
	      this section.</p>
	      		
	    <!--First row-->
	    <div class="row mb-5">
	      <!--First column-->
	      <div class="col-12">
	        <!-- Nav tabs -->
	        <ul class="nav md-pills flex-center flex-wrap mx-0" role="tablist">
	          <li class="nav-item">
	            <a class="nav-link active font-weight-bold text-uppercase" data-toggle="tab" href="#allList" role="tab">ALL</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#ringList" role="tab">RINGS</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#necklaceList" role="tab">NECKACES</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#earingList" role="tab">EARINGS</a>
	          </li>
	        </ul>
	      </div>
	      <!--First column-->
	    </div>
	    <!--First row-->
	    
	    <!--Tab panels-->
	    <div class="tab-content mb-5">
	      <!--ALL GOODS PANEL-->
	      <div class="tab-pane fade show in active" id="allList" role="tabpanel">
	        <!-- Grid row  -->
	        <div class="row">
	          <!-- Grid column A -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card1 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150918_213/kudshop_1442512514663UeVJ9_JPEG/1.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name1</h5>
	                <p class="card-text text-uppercase mb-3">RING</p>
	              </div>
	            </a>
	            <!-- //Card1 -->
	
	            <!-- Card2 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="https://i.etsystatic.com/7353734/r/il/f366ff/924652814/il_570xN.924652814_cl1d.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name2</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card2 -->
	            
	            <!-- Card3 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://www.chuu.co.kr/chuu-up/jyj/2018/180517/2/CU18051000001_d5.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name3</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card3 -->
	          </div>
	          <!-- //Grid column A -->
	
	          <!-- Grid column B -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card1 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150918_250/kudshop_1442507644498HBCzm_JPEG/5-1.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name4</h5>
	                <p class="card-text text-uppercase mb-3">Ring</p>
	              </div>
	            </a>
	            <!-- //Card1 -->
	
	            <!-- Card2 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="https://i.etsystatic.com/7353734/r/il/2d3d48/930966039/il_570xN.930966039_cx2f.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name5</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card2 -->
	            
	            <!-- Card3 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://www.chuu.co.kr/chuu-up/jyj/2018/180517/2/CU18051000001_d3.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name6</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card3 -->
	          </div>
	          <!-- //Grid column B -->
	
	          <!-- Grid column C -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card1 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150602_96/kudshop_14332503433334YBku_PNG/Screen_Shot_2015-05-29_at_6.36.41_AM.png" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name7</h5>
	                <p class="card-text text-uppercase mb-3">RING</p>
	              </div>
	            </a>
	            <!-- //Card1 -->
	
	            <!-- Card2 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="https://img1.etsystatic.com/101/1/7961003/il_570xN.836639293_pvr7.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name8</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card2 -->
	            
	            <!-- Card3 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://vivamoon.co.kr/web/upload/NNEditor/20180110/%EA%B7%80%EA%B1%B8%EC%9D%B4-%EB%94%94%ED%85%8C%EC%9D%BC_04_shop1_185757.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name9</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card3 -->
	          </div>
	          <!-- // Grid columnC -->
	          
	          <!-- Grid column D -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card1 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150918_23/kudshop_14425125151783VGro_JPEG/4.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name10</h5>
	                <p class="card-text text-uppercase mb-3">RING</p>
	              </div>
	            </a>
	            <!-- //Card1 -->
	
	            <!-- Card2 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://www.uncommongoods.com/images/items/42100/42191_1_640px.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name11</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card2 -->
	            
	            <!-- Card3 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://cherry07.img12.kr/product/170925_C708PWEA1/5.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name12</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card3 -->
	          </div>
	          <!-- // Grid column D -->          
	        </div>
	        <!-- // Grid row -->
	      </div>
	      <!--// All Goods Panel-->
	
	      <!-- Ring Panel -->
	      <div class="tab-pane fade" id="ringList" role="tabpanel">
	        <!-- Grid row -->
	        <div class="row">
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card1 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150918_213/kudshop_1442512514663UeVJ9_JPEG/1.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name1</h5>
	                <p class="card-text text-uppercase mb-3">RING</p>
	              </div>
	            </a>
	            <!-- //Card1 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card2 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150918_250/kudshop_1442507644498HBCzm_JPEG/5-1.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name2</h5>
	                <p class="card-text text-uppercase mb-3">RING</p>
	              </div>
	            </a>
	            <!-- //Card2 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card3 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150602_96/kudshop_14332503433334YBku_PNG/Screen_Shot_2015-05-29_at_6.36.41_AM.png" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name3</h5>
	                <p class="card-text text-uppercase mb-3">RING</p>
	              </div>
	            </a>
	            <!-- //Card3 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card4 Ring -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://blogfiles.naver.net/20150918_23/kudshop_14425125151783VGro_JPEG/4.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name4</h5>
	                <p class="card-text text-uppercase mb-3">RING</p>
	              </div>
	            </a>
	            <!-- //Card4 -->
	          </div>
	          <!-- Grid column --> 
	        </div>
	        <!-- Grid row -->
	      </div>
	      <!-- RingPanel 2-->
	      
	      <!-- Necklace Panel 3 -->
	      <div class="tab-pane fade" id="necklaceList" role="tabpanel">
	        <!-- Grid row -->
	        <div class="row">
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card1 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="https://i.etsystatic.com/7353734/r/il/f366ff/924652814/il_570xN.924652814_cl1d.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name1</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card1 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card2 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="https://i.etsystatic.com/7353734/r/il/2d3d48/930966039/il_570xN.930966039_cx2f.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name2</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card2 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card3 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="https://img1.etsystatic.com/101/1/7961003/il_570xN.836639293_pvr7.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name3</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card3 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card4 Necklace -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://www.uncommongoods.com/images/items/42100/42191_1_640px.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name4</h5>
	                <p class="card-text text-uppercase mb-3">Necklace</p>
	              </div>
	            </a>
	            <!-- //Card4 -->
	          </div>
	          <!-- Grid column --> 
	        </div>
	        <!-- Grid row -->
	      </div>
	      <!-- NecklacePanel 3-->
	      
	      <!-- Earing Panel 3 -->
	      <div class="tab-pane fade" id="earingList" role="tabpanel">
	        <!-- Grid row -->
	        <div class="row">
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card1 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://www.chuu.co.kr/chuu-up/jyj/2018/180517/2/CU18051000001_d5.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name1</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card1 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card2 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://www.chuu.co.kr/chuu-up/jyj/2018/180517/2/CU18051000001_d3.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name2</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card2 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card3 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://vivamoon.co.kr/web/upload/NNEditor/20180110/%EA%B7%80%EA%B1%B8%EC%9D%B4-%EB%94%94%ED%85%8C%EC%9D%BC_04_shop1_185757.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name3</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card3 -->
	          </div>
	          <!-- Grid column -->
	          
	          <!-- Grid column -->
	          <div class="col-md-6 col-lg-3">
	            <!-- Card4 Earing -->
	            <a class="card hoverable mb-4">
	              <!-- Card image -->
	              <img class="card-img-top new-arrival" src="http://cherry07.img12.kr/product/170925_C708PWEA1/5.jpg" alt="Card image cap">
	              <!-- Card content -->
	              <div class="card-body">
	                <h5 class="my-3">Goods Name4</h5>
	                <p class="card-text text-uppercase mb-3">Earing</p>
	              </div>
	            </a>
	            <!-- //Card4 -->
	          </div>
	          <!-- Grid column --> 
	        </div>
	        <!-- Grid row -->
	      </div>
	      <!-- EaringPanel 3-->
	    </div>
	    <!--Tab panels-->
	  </section>
	  <!-- Section -->
	</div>

	<!-- //New Arrival -->
	
	<!-- Recommand Goods -->
	<div class = container>
		<h3 class = "font-weight-bold text-center dark-grey-text pb-2">Recommand Goods</h3>
		<hr class = "w-header my-4">
		<div class = "row">
			<div class = "col-md-12 dark-gery-text d-flex justify-content-center mb-5">
				<button type = "button" class = "btn btn-link btn-lg m-0 px-3 py-1 filter">All</button>
				<p class = "font-weight-bold mb-0 px-1 py-1">/</p>
				<button type = "button" class = "btn btn-link btn-lg m-0 px-3 py-1 filter">ACCESSORIES</button>
				<p class = "font-weight-bold mb-0 px-1 py-1">/</p>
				<button type = "button" class = "btn btn-link btn-lg m-0 px-3 py-1 filter">PHONECASE</button>
				<p class = "font-weight-bold mb-0 px-1 py-1">/</p>
				<button type = "button" class = "btn btn-link btn-lg m-0 px-3 py-1 filter">CATEGORY NO.1</button>
				<p class = "font-weight-bold mb-0 px-1 py-1">/</p>
				<button type = "button" class = "btn btn-link btn-lg m-0 px-3 py-1 filter">CATEGORY NO.2</button>
			</div>
		</div>
		<div class = "gallery mb-5" id = "gallery">
			<div class = "mb-3 pics all 2 animation">
				<a href = "#">
					<img class = "img-fluid z-depth-1 rounded" src = "https://mdbootstrap.com/img/Photos/Others/images/58.jpg">
				</a>
			</div>
			<div class = "mb-3 pics">
				<a href = "#">
					<img class = "img-fluid z-depth-1 rounded" src = "https://mdbootstrap.com/img/Photos/Vertical/7.jpg">
				</a>
			</div>
			<div class = "mb-3 pics">
				<a href = "#">
					<img class = "img-fluid z-depth-1 rounded" src = "https://mdbootstrap.com/img/Photos/Vertical/4.jpg">
				</a>
			</div>
			<div class = "mb-3 pics">
				<a href = "#">
					<img class = "img-fluid z-depth-1 rounded" src = "https://mdbootstrap.com/img/Photos/Others/images/63.jpg">
				</a>
			</div>
			<div class = "mb-3 pics">
				<a href = "#">
					<img class = "img-fluid z-depth-1 rounded" src = "https://mdbootstrap.com/img/Photos/Others/images/64.jpg">
				</a>
			</div>
			<div class = "mb-3 pics">
				<a href = "#">
					<img class = "img-fluid z-depth-1 rounded" src = "https://mdbootstrap.com/img/Photos/Vertical/5.jpg">
				</a>
			</div>
		</div>
	</div>
	<!-- //Recommand Goods -->
	
	<!-- Brand-Logo -->
	<div class = "container mb-5">
		<div class = "card text-white" style = "max-width : 100%; background-color : #ce93d8">
			<div class = "card-body">
				<h4 class = "text-center">MSM PARTNER BRAND</h4>
			</div>
		</div>
	</div>
	<div class = "container">
		<section>
			<div class = "row">
				<div class = "col-lg-4 col-md-6 mb-5">
					<div class = "view zoom z-depth-1 rounded view-logo">
						<a href = "#">
							<img src = "http://blogfiles.naver.net/20150830_55/kudshop_14408818986977UrjW_PNG/Screen_Shot_2015-08-30_at_5.57.33_AM.png" class = "img-fluid logo1">
						</a>
					</div>
				</div>
				<div class = "col-lg-4 col-md-6 mb-5">
					<div class = "view zoom z-depth-1 rounded view-logo">
						<a href = "#">
							<img src = "http://thumbnail.10x10.co.kr/webimage/image/add1_600/146/A001462480_01-1.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false" class = "img-fluid logo1">
						</a>
					</div>
				</div>
				<div class = "col-lg-4 col-md-6 mb-5">
					<div class = "view zoom z-depth-1 rounded view-logo">						
						<a href = "#">
							<img src = "http://blogfiles.naver.net/20150419_47/sye821_1429414910763K4qfm_JPEG/11101832_1558861107735935_1999409747053864656_n.jpg" class = "img-fluid logo1">
						</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- //Brand-Logo -->
	
</main>

<footer class = "page-footer text-center font-small mt-4">
	<!-- Call to Action -->
	<div class = "pt-4">
		<a class = "btn btn-outline-white" href = "#" target = "_blank" role = "button">
			The Project MSM.
		</a>
	</div>
	
	<!-- Social icons -->
	<div class = "my-4">
    	<div class="pb-4">
	      	<a href="https://www.facebook.com/mdbootstrap" target="_blank">
	        	<i class="fab fa-facebook-f mr-3"></i>
	      	</a>
	
	      	<a href="https://twitter.com/MDBootstrap" target="_blank">
	        	<i class="fab fa-twitter mr-3"></i>
	      	</a>
	
	      	<a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
	        	<i class="fab fa-youtube mr-3"></i>
	      	</a>
	
	      	<a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
	        	<i class="fab fa-google-plus-g mr-3"></i>
	      	</a>
	
	      	<a href="https://dribbble.com/mdbootstrap" target="_blank">
	       		<i class="fab fa-dribbble mr-3"></i>
	      	</a>
	
	      	<a href="https://pinterest.com/mdbootstrap" target="_blank">
	        	<i class="fab fa-pinterest mr-3"></i>
	      	</a>
	
	      	<a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
	        	<i class="fab fa-github mr-3"></i>
	      	</a>
	
	      	<a href="http://codepen.io/mdbootstrap/" target="_blank">
	        	<i class="fab fa-codepen mr-3"></i>
	      	</a>
		</div>
	</div>
	
	<!--Copyright-->
    <div class="footer-copyright py-3">
      © 2020 Copyright:
      <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank"> Project MSM </a>
    </div>
    
</footer>

<!-- Modal Signup -->
<!-- 
<div id="signUp" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">Sign Up</h4>
				<button type = "button" class = "close" data-dismiss = "modal">
					<span>&times;</span>
				</button> 
			</div>
			<div class = "modal-body mx-3">
				<div class = "md-form mb-5">					
					<form action = "join" method = "post">
						<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token }"/> 
						<div class = "md-form mb-5">
							<input type = "text" id = "mId" name = "mId" size = "50" class = "form-control validate mb-5" placeholder = "ID" required>
							<label data-error = "wrong" data-success = "right" for = "mId"></label>
						</div>
						<div class = "md-form mb-5">
							<input type = "password" id = "mPw" name = "mPw" size = "50" placeholder = "Password" class = "form-control validate mb-5" required>
							<label data-error = "wrong" data-success = "right" for = "mPw"></label>
						</div>
						
						<div class = "md-form mb-5">
							<input type = "password" id = "mPw2" name = "mPw2" size = "50" placeholder = "Password 확인" class = "form-control validate mb-5" required>
							<label data-error = "wrong" data-success = "right" for = "mPw2"></label>
						</div>
						
						<div class = "md-form mb-5">
							<input type = "email" id = "mEmail" name = "mEmail" size = "50" placeholder = "Email" class = "form-control validate mb-5" required>
							<label data-error = "wrong" data-success = "right" for = "mEmail"></label>						
						</div>
						<div class = "d-flex justify-content-center">
							<button class = "btn btn-primary" type = "submit">Sign Up</button>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</div>
</div>
 -->
<!-- //Modal Signup -->





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