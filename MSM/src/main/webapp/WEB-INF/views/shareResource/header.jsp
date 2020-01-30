<head>
</head>
<body>
<!-- Header Navbar -->
<div style = "height : 10%" class = "mb-5">
	<nav class = "navbar fixed-top navbar-expand-lg navbar-light white" id = "headerNav">
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
							<a type = "button" class = "btn btn-link waves-effect" href = "/member/loginForm">sign in</a>
						</sec:authorize>
						<sec:authorize access = "isAuthenticated()">
							<form action = "logout" method = "post">
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
							<h3 class = "text-center text-white mb-5">My Account</h3>
							<a href = "javascript:void(0)" class = "closebtn" onclick = "closeNav()">&times;</a>
							<a class = "btn btn-outline-white mb-5" href = "#" target = "_blank" role = "button">
								Profile
							</a>
							<a class = "btn btn-outline-white mb-5" href = "#" target = "_blank" role = "button">
								Cart
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/board/notice/noticeList" role = "button">
								Notice
							</a>
							<a class = "btn btn-outline-white mb-5" href = "/board/qna/qnaList" role = "button">
								QnA
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
</div>
</body>