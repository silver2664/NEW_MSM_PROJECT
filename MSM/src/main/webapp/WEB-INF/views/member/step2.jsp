<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta id = "_csrf" name = "_csrf" content = "${_csrf.token}" />
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

<div class = "container">
	<div class = "page-header">
		<div class = "col-md-12">
			<h3>회원가입</h3>
		</div>
	</div>
	
	<div class = "col-md-12">
		<form action = "/member/step3" method = "post" role = "form" id = "usercheck" name ="member">
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
			<div class = "form-group">
				<label for = "mId">아이디</label>
				<input type = "text" class = "form-control" id = "mId" name = "mId" placeholder = "ID"/>
				<div class = "eheck_font" id = "id_check"></div>				
			</div>
			
			<div class = "form-group">
				<label for = "mPw">비밀번호</label>
				<input type = "password" class = "form-control" id = "mPw" name = "mPw" placeholder = "PassWord"/>
				<div class = "eheck_font" id = "pw_check"><span style = "color : blue"> * 8-15 자의 [문자/숫자/특수문자]를 조합하세요. </span></div>
			</div>
			
			<div class = "form-group">
				<label for = "mPw2">비밀번호 확인</label>
				<input type = "password" class = "form-control" id = "mPw2" name = "mPw2" placeholder = "Confirm PassWord"/>
				<div class = "eheck_font" id = "pw2_check"></div>
			</div>
			
			<div class = "form-group">
				<label for = "mName">이름</label>
				<input type = "text" class = "form-control" id = "mName" name = "mName" placeholder = "Name"/>
				<div class = "eheck_font" id = "name_check"></div>
			</div>
			
			<div class = "form-group">
				<label for = "mEmail">E-mail</label>
				<input type = "email" class = "form-control" id = "mEmail" name = "mEmail" placeholder = "EMAIL"/>
				<div class = "eheck_font" id = "email_check"></div>
				<button type = "button" class ="btn btn-primary" id = "emailBtn">인증메일 발송</button>
				<input type = "hidden" path = "random" id = "random" value = "${random}"/>
				<input type = "text" class = "form-control" id = "emailAuth" name = "emailAuth" placeholder = "인증번호 입력해주세요."/>
				<button type = "button" class = "btn btn-primary" id = "emailAuthBtn">Email 인증하기</button>
			</div>
			
			<div class = "form-group">
				<label for = "mPhone">휴대전화</label>
				<input type = "tel" class = "form-control" id = "mPhone" name = "mPhone" placeholder = "Phone Number"/>
				<div class = "eheck_font" id = "phone_check"><span style = "color : blue">[" - "] 없이 번호로만 작성해주세요.</span></div>
			</div>
			
			<div class = "form-group">
				<input class = "form-control" style = "width : 40%; display : inline;" id = "mZip_Code" name = "mZip_Code"
					type = "text" readonly="readonly"/>
				<button type = "button" class = "btn btn-default" onclick = "execPostCode();"><i class = "fa fa-search"></i>우편번호 찾기</button>
			</div>
			
			<div class = "form-group">
				<input class = "form-control" style = "top : 5px;" placeholder = "도로명 주소" name = "mFirst_Addr" id = "mFirst_Addr"
					type = "text" readonly = "readonly"/>
			</div>
			
			<div class = "form-group">
				<input class = "form-control" style = "top : 5px;" placeholder = "상세 주소" name = "mSecond_Addr" id = "mSecond_Addr"
					type = "text"/>
			</div>
			
			<div class = "form-group text-center">
				<button type = "submit" class = "btn btn-primary">회원가입</button>
				<button type = "reset" class = "btn btn-warning">취소</button>
			</div>
		</form>
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
<!-- DAUM 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//모든 공백 체크 정규식
var empJ = /\s/g;
//ID 정규식
var idJ = /^[a-z0-9]{3,12}$/;
//비밀번호 정규식
var pwJ = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
//이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
//이메일 검사 정규식
var mailJ = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
//휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
// 주소입력 시 사용
var address = $('#mSecond_Addr');
//================= ID 중복체크 AJAX ================= //
$(document).ready(function(){			
	
	// ID 중복 확인
	$('#mId').blur(function(){
		if(($('mId').val()) == ''){
			$("#id_check").text('아이디를 입력하세요.');			
			$("#id_check").css("color", "red");
		} else if(idJ.test(($('#mId').val())) != true){
			$("#id_check").text('공백없이 4-12자의 영문 소문자와 숫자만 사용 가능합니다.');
			$("#id_check").css("color", "red");			
		} else if (($('#mId').val()).length > 3){
			var mId = $('#mId').val();
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
						$("#id_check").text('중복된 아이디입니다.');
						$("#id_check").css('color', 'red');
						$("#usercheck").attr('disabled', true);
					} else {
						$('#id_check').text('사용 가능한 ID입니다.');
						$('#id_check').css('color', 'blue');
						$('#usercheck').attr('disabled', false);						
					}
				},
				error : function(request, status, error){
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		}
	});
	
	
	// Password 유효성 검사
	$('#mPw').blur(function(){
		if(pwJ.test($('#mPw').val())){
			console.log('true');
			$('#pw_check').text('유효한 비밀번호입니다.');
			$('#pw_check').css('color', 'blue');
		} else {
			console.log('false');
			$('#pw_check').text(' *8-15 자의 [문자/숫자/특수문자]를 조합하세요. ');
			$('#pw_check').css('color', 'red');
		}
	});
	
	// 패스워드 일치 확인
	$('#mPw2').blur(function(){
		if($('#mPw').val() != $('#mPw2').val()){
			$('#pw2_check').text('비밀번호가 일치 하지 않습니다.');
			$('#pw2_check').css('color', 'red');
		} else {
			$('#pw2_check').text('비밀번호 일치하였습니다.');
			$('#pw2_check').css('color', 'blue');
		}
	});
	
	// 이름에 특수문자 들어가지 않도록 설정
	$('#mName').blur(function(){
		if(nameJ.test($('#mName').val())){
			console.log(nameJ.test($('#mName').val()));
			$('#name_check').text('');
		} else {
			$("#name_check").text('한글 2-6자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
			$("#name_check").css('color', 'red');
		}
	});
	
	// 이메일 양식 검사
	$("#mEmail").blur(function(){
		if(mailJ.test($('#mEmail').val())){
			$('#email_check').text('');
		} else {
			$('#email_check').text('이메일을 확인해주세요.');
			$('#email_check').css('color', 'red');
		}
	});
	
	/*=== Form 제출 클릭 후 최종 유효성 체크 ===*/
	
	$('form').on('submit', function(){
		
		var inval_Arr = new Array(6).fill(false);
		
		if(idJ.test($("#mId").val())){
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
		}
		
		// 비밀번호가 같을 경우 && 비밀번호 정규식		
		if(($('#mPw').val() == ($('#mPw2').val())) && pwJ.test($('#mPw').val()))
			inval_Arr[1] = true;		
		else {
			inval_Arr[1] = false;
			alert('비밀번호를 확인하세요.');
			return false;
		}
		
		// 이름 정규식
		if(nameJ.test($('#mName').val())) 
			inval_Arr[2] = true;
		else {
			inval_Arr[2] = false;
			alert('이름을 확인하세요.');
			return false;
		}
		
		// E-mail 정규식
		if(mailJ.test($('#mEmail').val())) {
			console.log(mailJ.test($('#mEmail').val()));
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
			alert('이메일을 확인하세요.');
			return false;
		}
		
		//휴대전화 정규식
		if(phoneJ.test($('#mPhone').val())){
			console.log(phone.test($('#mPhone').val()));
			inval_Arr[4] = true;
		} else {
			inval_Arr[4] = false;
			alert('휴대전화번호 확인하세요.');
			return false;
		}
		
		//주소 확인
		if(adress.val() == ''){
			inval_Arr[5] = false;
			alert('주소를 확인하세요.');
			return false;
		} else {
			inval_Arr[5] = true;
		}
	
		//전체 유효성 검사
		var validAll = true;
		for (var i = 0; i < inval_Arr.length; i++){
			if (inval_Arr[i] == false){
				validAll = false;
			}
		}
		if(validAll == true){ //유효성 통과
			alert("MSM 회원가입을 환영합니다.");	
		} else {
			alert("정보를 다시 확인해주세요.");
		}
	});
});

</script>

<!-- ========= 다음 주소 API ========= -->
<script>
function execPostCode(){
	new daum.Postcode({
		oncomplete : function(data){
			//팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.
			
			//도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			//내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수 (참고항목변수)
			
			//법정동이 있을 경우 추가한다. (법정리는 제외)
			//법정동의 경우 마지막 문자가 "동/로/가" 로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
	
			//건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			
			//도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = '(' + extraRoadAddr + ')'; 
			}
			
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
			
			
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			console.log(data.zonecode);
			console.log(fullRoadAddr);
			
			$("[name=mZip_Code]").val(data.zonecode);
			$("[name=mFirst_Addr]").val(fullRoadAddr);			
		}
	}).open();
}	
</script>

<!-- ===== Email 인증 Ajax =====-->
<script>
$(document).ready(function(){
	$("#emailBtn").on("click", function(){
		$.ajax({
			type : "GET",
			url : "/member/email/",
			data : {
				"Email" : $("#mEmail").val(),  
				"random" : $("#random").val()
			},
			success : function(data){
				alert("메일발송완료하였습니다." + "\n" + "인증번호를 입력해주세요.")
			},
			error : function(data){
				alert("서버 에러가 발생하였습니다.")
			}
		});
	});
});
</script>

<script>
$(document).ready(function(){
	$("#emailAuthBtn").on("click", function(){
		$.ajax({
			url : "/member/emailAuth/",
			data : {
				"authCode" : $('#emailAuth').val(),
				"random" : $('#random').val()
			},
			success : function(data){
				console.log("data : " + data)
				if(data == "complete"){
					alert("인증이 완료되었습니다.")
				}
				else if(data == "false"){
					alert("인증번호를 잘못입력하셨습니다.")
				}
			},
			error : function(request, status, error){
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
			}
		});
	});
});
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
<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
</body>
</html>