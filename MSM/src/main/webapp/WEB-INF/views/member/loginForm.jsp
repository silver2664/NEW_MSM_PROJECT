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
<title>MemberList</title>
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
<!-- 네이버로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<div class = "container">
	<!-- Material form login -->
	<div class = "row">
	<div class="card col-md-6 offset-md-3" style = "width : 50%;">
	
	  <h5 class="card-header secondary-color white-text text-center py-4">
	    <strong>Sign In</strong>
	  </h5>
	
	  <!--Card content-->
	  <div class="card-body px-lg-5 pt-0">
	
	    <!-- Form -->
	    <form class="text-center" style="color: #757575;" action="/login" method = "POST">
	    <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
	
	      <!-- ID -->
	      <div class="md-form">
	        <input type="text" id="materialLoginFormEmail" class="form-control" name = "mId" required>
	        <label for="materialLoginFormEmail">ID</label>
	      </div>
	
	      <!-- Password -->
	      <div class="md-form">
	        <input type="password" id="materialLoginFormPassword" class="form-control" name = "mPw" required>
	        <label for="materialLoginFormPassword">Password</label>
	      </div>
	
	      <div class="d-flex justify-content-around">
	        <div>
	          <!-- Remember me -->
	          <div class="form-check">
	            <input type="checkbox" class="form-check-input" id="remember-me" name ="remember-me">
	            <label class="form-check-label" for="materialLoginFormRemember">Remember me</label>
	          </div>
	        </div>
	        <div>
	          <!-- Forgot password -->
	          <a style = "color : blue" data-toggle = "modal" data-target = "#findPw">Forgot password?</a>
	        </div>
	      </div>
	
	      <!-- Sign in button -->
	      <button class="btn btn-outline-info btn-block my-4 waves-effect z-depth-0" type="submit" style = "border-radius : 20px;">Sign In</button>
	      
	      <c:if test ="${not empty param.fail}">
		  	<div class = col-md-12>
				<div>Your SIGN IN attempt was not successful, try again.</div>
				<div>Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>													
				<c:remove scope = "session" var = "SPRING_SECURITY_LAST_EXCEPTION"/>
			</div>
		 </c:if>	
		 <!-- 네이버 로그인 화면 -->
		 <div id="naver_id_login" style="text-align:center" class = "mb-2"><a href="${url}">
			<img width="200" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
		 </div>
		 
	      <!-- Register -->
	      <p>Not a member?
	        <a href="/member/step1">Register</a>
	      </p>
	
	      <!-- Social login -->
	      <p>or sign in with:</p>
	      <a type="button" class="btn-floating btn-fb btn-sm">
	        <i class="fab fa-facebook-f"></i>
	      </a>
	      <a type="button" class="btn-floating btn-tw btn-sm">
	        <i class="fab fa-twitter"></i>
	      </a>
	      <a type="button" class="btn-floating btn-li btn-sm">
	        <i class="fab fa-linkedin-in"></i>
	      </a>
	      <a type="button" class="btn-floating btn-git btn-sm">
	        <i class="fab fa-github"></i>
	      </a>
	
	    </form>
	    <!-- Form -->
	    
	
	  </div>
	
	</div>
	</div>
</div>
<!-- Material form login -->

<!-- 비밀번호 찾기 Modal 창. -->
<!-- 비밀번호 변경 MODAL 창 처리 -->
<div class="modal fade" id="findPw" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-notify modal-warning" role="document">
	
		<!--Content-->		
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
    	<div class="modal-content">
      		<!--Header-->
      		<div class="modal-header text-center">
        		<h4 class="modal-title white-text w-100 font-weight-bold py-2">비밀번호 찾기</h4>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          		<span aria-hidden="true" class="white-text">&times;</span>
        		</button>
      		</div>
      		<!-- Body -->
      		<div class="modal-body">      			
      			<div class="md-form mb-5">
					<input type = "text" id = "mId2" name = "mId2" class = "form-control" value = ""/>
					<label for="originalPw">ID</label>
					<div id = "id_check" style = "color : blue; font-size : 12px;">회원가입 시 등록한 ID를 입력해주세요.</div>
      			</div>
      			<div class="md-form mb-5">
					<input type = "text" id = "mEmail" name = "mEmail" class = "form-control" value = ""/>
					<label for="originalPw">EMAIL</label>
					<div id = "checkEmail" style = "color : blue; font-size : 12px;">회원가입 시 인증한 EMAIL을 입력해주세요.</div>
      			</div>
      			<p style = "font-size : 12px">회원가입 시 등록하셨던 ID와 EMAIL을 입력해주세요.<br/>ID와 EMAIL 확인 후 임시비밀번호를 해당 EMAIL로 보내드립니다.</p>      			
      		</div>
      		<!--Footer-->
      		<div class="modal-footer justify-content-center">
        		<button type = "submit" id = "sendEmail" class="btn btn-outline-primary waves-effect">임시비밀번호 발송</button>
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

<!-- 비밀번호 찾기 AJAX -->
<script>
$(document).ready(function(){
	
	// ID 등록 확인
	$('#mId2').blur(function(){
		
		if (($('#mId2').val()).length > 0){
			var mId = $('#mId2').val();
			$.ajax({
				data : {"mId" : mId},								
				url : "/member/idCheck",
				/*
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				*/
				success : function(data){
					console.log("data : " + data);
					if(data > 0 ){
						$("#id_check").text('ID 확인되었습니다.');
						$("#id_check").css('color', 'blue');
					} else {
						$('#id_check').text('등록되지 않은 ID입니다.');
						$('#id_check').css('color', 'red');						
					}
				},
				error : function(request, status, error){
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		}
	});
	
	// Email 등록 확인
	$('#mEmail').blur(function(){
		
		if (($('#mEmail').val()).length > 0){
			var mId = $('#mId2').val();
			var mEmail = $('#mEmail').val();
			$.ajax({
				data : {
					"mId" : mId,
					"mEmail" : mEmail
				},								
				url : "/member/emailCheck",
				/*
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				*/
				success : function(data){
					console.log("data : " + data);
					if(data > 0 ){
						$("#checkEmail").text('Email 확인되었습니다.');
						$("#checkEmail").css('color', 'blue');
					} else {
						$('#checkEmail').text('해당 ID에 등록되지 않은 Email입니다.');
						$('#checkEmail').css('color', 'red');						
					}
				},
				error : function(request, status, error){
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		}
	});
	
	
		
	$('#sendEmail').on("click", function(){
			
		$.ajax({
			url : "/member/sendEmail",
			data : {
				"mEmail" : $('#mEmail').val(),
				"mId" : $('#mId2').val()	
			},
			success : function(data){
				alert ("메일발송완료하였습니다.<br/>전송된 임시비밀번호를 이용하여 로그인 해주세요.")
			},
			error : function(data){
				alert("서버 에러가 발생하였습니다.")
			}
		});
			
	});
	
});
</script>

</body>
</html>