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
													<a data-toggle = "modal" href = "#signUp" style = "display : inline; color : white; padding : 4px; font-size : 16px">REGISTER</a>
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
							<a class = "btn btn-outline-white mb-5" href = "#" target = "_blank" role = "button">
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
</div>
</body>