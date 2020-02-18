<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session = "true"%>
<html lang="ko">
<head>
<meta charset="utf-8">
</head>
<body>
<!-- Header Navbar -->
<div style = "height : 120px;" class = "mb-1">
	<nav class = "navbar fixed-top navbar-expand-lg navbar-light white" id = "headerNav">
		<div class = "container-fluid">
			<!-- BRAND -->
			<a class = "navbar-brand wave-effect" href = "/home">
				<img src = "/resources/images/logo/logo2.jpg" style = "width : 200px; height : 80px;">
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
						<a type = "button" class = "btn btn-link waves-effect" href = "/member/loginForm" id = "login">sign in</a>
					</sec:authorize>
					<sec:authorize access = "isAuthenticated()">
						<form action = "/logout" method = "post">
							<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
							<button type = "submit" class = "btn btn-link waves-effect" style = "color : black">sign out</button>
						</form>
					</sec:authorize>								
				</li>
				<!-- //LOGIN -->
				<li class = "nav-item">				
					<!-- My Account Sidebar Btn -->
					<a type = "button" class = "btn btn-link waves-effect" href = "#" onclick = "openNav()">My Account</a>
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
						<a id ="mId" class = "btn btn-outline-white mb-5" href = "/member/memberDetail?mId=${mId}&page=1&perPageNum=10&searchType=&keyword=" role = "button">
							Profile
						</a>					
						<a class = "btn btn-outline-white mb-5" href = "/board/notice/noticeList" role = "button">
							Notice
						</a>
						<a class = "btn btn-outline-white mb-5" href = "/board/qna/qnaList" role = "button">
							QnA
						</a>
						<a class = "btn btn-outline-white mb-5" href = "/cart/cartView" role = "button">
							Cart
						</a>						
						<form action = "/logout" method = "post">
							<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
							<button type = "submit" class = "btn btn-outline-white mb-5" style = "color : black" id = "signOut1">Sign Out</button>
						</form>
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
						<form action = "/logout" method = "post">
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
</div>
</body>