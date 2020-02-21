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
<!-- CK EDITOR -->
<script src="/resources/js/ckeditor/ckeditor.js"></script>
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">
<style>

  html,
  body,
  header,
  .view {
    height: 100%;
  }

  @media (max-width: 740px) {
    html,
    body,
    header,
    .view {
      height: 100vh;
    }
  }

  .top-nav-collapse {
    background-color: #82b1ff !important;
  }

  .navbar:not(.top-nav-collapse) {
    background: transparent !important;
  }

  @media (max-width: 991px) {
   .navbar:not(.top-nav-collapse) {
    background: #82b1ff !important;
   }
  }
  
  h5 {
    letter-spacing: 3px;
  }

</style>

</head>
<body>

<!-- header Nav -->
<nav class = "navbar fixed-top navbar-expand-lg navbar-light white" id = "headerNav">
		<div class = "container-fluid">
			<!-- BRAND -->
			<a class = "navbar-brand wave-effect" href = "/home">
				Multi Shopping Mall
			</a>
			<!-- Collapse Menu -->
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#headerMenu">
		   		<span class="navbar-toggler-icon"></span>
		    </button>
			<!-- Header Menu -->
			<div class = "collapse navbar-collapse" id = "headerMenu">
				<ul class="navbar-nav" style = "margin : auto">
					<li class="nav-item">
						<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
							style = "font-size : 16px;" href = "/brand/brandIndex">brandmall</a>									
					</li>
					<li class="nav-item">
						<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
							style = "font-size : 16px;" href="/brand/ringList">ring</a>					
					</li>
					<li class="nav-item">
						<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
							style = "font-size : 16px;" href="/brand/earringList">earring</a>
					</li>
					<li class="nav-item">
						<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
							style = "font-size : 16px;" href="/brand/braceletList">bracelet</a>
					</li>
					<li class="nav-item">
						<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
							style = "font-size : 16px;" href="/brand/necklaceList">necklace</a>
					</li>
				</ul>
				<ul class = "navbar-nav" style= "margin : auto">
					<!-- SignUP -->
					<li class = "nav-item">		
						<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
							style = "font-size : 16px;" href = "/member/step1">SIGN UP</a>
					</li>
					<!-- //SignUp -->
					<!-- LOGIN -->
					<li class = "nav-item">
						<sec:authorize access = "isAnonymous()">
							<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
								style = "font-size : 16px;" href = "/member/loginForm" id = "login">sign in</a>
						</sec:authorize>
						<sec:authorize access = "isAuthenticated()">
							<form action = "/logout" method = "post">
								<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
								<button type = "submit" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
									style = "font-size : 16px; color : black;">sign out</button>
							</form>
						</sec:authorize>								
					</li>
					<!-- //LOGIN -->
					<li class = "nav-item">				
						<!-- My Account Sidebar Btn -->
						<a type = "button" class="btn btn-link waves-effect text-uppercase text-monospace font-weight-bold" 
							style = "font-size : 16px; color : black;" onclick = "openNav()">My Account</a>
						<div id = "mySidenav" class = "sidenav">
							<a href = "javascript:void(0)" class = "closebtn" onclick = "closeNav()">&times;</a>						
							<sec:authorize access="isAnonymous()">
							<h3 class = "text-center text-white mb-5">방문자 님 환영합니다!</h3>
							<a class = "btn btn-outline-white mb-5" href = "/member/step1" role = "button">
								회원가입
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/member/loginForm" role = "button">
								로그인
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/board/notice/noticeList" role = "button">
								공지사항
							</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_USER')">
							<sec:authentication property ="principal.username" var = "mId"/>
							<h3 class = "text-center text-white mb-5">${mId} 님 환영합니다.</h3>												
							<a id ="mId" class = "btn btn-outline-white mb-3" href = "/member/memberDetail?mId=${mId}&page=1&perPageNum=10&searchType=&keyword=" role = "button">
								Profile
							</a>						
							<a class = "btn btn-outline-white mb-3" href = "/cart/cartView" role = "button">
								Cart
							</a>						
							<a class = "btn btn-outline-white mb-3" href = "/order/order" role = "button">
								Order List
							</a>					
							<a class = "btn btn-outline-white mb-3" href = "/board/notice/noticeList" role = "button">
								Notice
							</a>
							<a class = "btn btn-outline-white mb-3" href = "/board/qna/qnaList" role = "button">
								Q&amp;A
							</a>
							<a class = "btn btn-outline-white mb-3" href = "/board/notice/faq" role = "button">
								FAQ
							</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<h3 class = "text-center text-white mb-5">관리자(ADMIN)계정 접속</h3>
							<a class = "btn btn-outline-white mb-5" href = "/admin/admin" role = "button">
								ADMIN Page
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/board/notice/noticeList" role = "button">
								Notice
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/board/qna/qnaList" role = "button">
								QnA
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/product/listView" role = "button">
								Goods List
							</a>
							<form action = "/logout" method = "post">
								<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
								<button type = "submit" class = "btn btn-outline-white mb-5" style = "color : black" id = "signOut1">Sign Out</button>
							</form>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MANAGER')">
							<h3 class = "text-center text-white mb-5">매니저(MANAGER)계정 접속</h3>
							<a class = "btn btn-outline-white mb-5" href = "/admin/admin" role = "button">
								ADMIN Page
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/board/notice/noticeList" role = "button">
								Notice
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/board/qna/qnaList" role = "button">
								QnA
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/product/listView" role = "button">
								Goods List
							</a>
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

<!-- Full Page Intro -->
  <div class="view jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('/resources/images/indexPageImg/brandmall.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
    <!-- Mask & flexbox options-->
    <div class="mask rgba-white-light d-flex justify-content-center align-items-center">
      <!-- Content -->
      <div class="container">
        <!--Grid row-->
        <div class="row">
          <!--Grid column-->
          <div class="col-md-12 white-text text-center">
            <h1 class="display-3 mb-0 pt-md-5 pt-5 white-text font-weight-bold wow fadeInDown" data-wow-delay="0.3s">MSM
              <a class="indigo-text font-weight-bold">BRAND MALL</a>
            </h1>
            <h5 class="text-uppercase pt-md-5 pt-sm-2 pt-5 pb-md-5 pb-sm-3 pb-5 white-text font-weight-bold wow fadeInDown"
              data-wow-delay="0.3s">Best Brand &amp; Accessories</h5>
            <div class="wow fadeInDown" data-wow-delay="0.3s">
              <a class="btn btn-light-blue btn-lg btn-rounded" href = "/product/aasList">aas-studio</a>
              <a class="btn btn-indigo btn-lg btn-rounded" href = "/product/bbsList">bbs-studio</a>
            </div>
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </div>
      <!-- Content -->
    </div>
    <!-- Mask & flexbox options-->
  </div>
  <!-- Full Page Intro -->

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
new WOW().init();
</script>
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