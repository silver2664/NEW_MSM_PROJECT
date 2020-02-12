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
<title>Member Update View</title>
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

</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<div id="root" class = "container">	
	<h1>회원정보 수정</h1>	
	<hr />	
	<div class = "col-md-12">
		<form action = "/member/update" method = "post" role = "form" id = "usercheck" name ="member">
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
			<!-- 
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum"	value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			 -->
			<div class = "form-group">
				<label for = "mId">아이디</label>
				<input type = "text" class = "form-control" id = "mId" name = "mId" value = "${update.mId}" readonly = "readonly"/>
			</div>
			<div class = "form-group">
				<input type = "hidden" class = "form-control" id = "mPw" name = "mPw" value = "${update.mPw}" readonly = "readonly"/>
			</div>
			
			<!-- Modal 실행 버튼 -->
			<div>
  				<a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#changePw">비밀번호 변경하기</a>
			</div>
						  
			<div class = "form-group">
				<label for = "mName">이름</label>
				<input type = "text" class = "form-control" id = "mName" name = "mName" value = "${update.mName}" readonly = "readonly"/>
			</div>
			
			<div class = "form-group">
				<label for = "mEmail">이메일</label><br/>
				<input type = "email" style = "width : 40%; display : inline;" class = "form-control" id = "mEmail" name = "mEmail" value = "${update.mEmail}"/>
				<button type = "button" class ="btn btn-primary" id = "emailBtn" style = "width : 170px; height : 38px;">인증메일 발송</button>
				<div class = "eheck_font" id = "email_check"><span style = "color : blue">변경하실 EMAIL 주소 입력 후 인증 절차 진행해주세요.</span></div>				
				<input type = "hidden" path = "random" id = "random" value = "${random}"/>
				<input type = "text" style = "width : 40%; display : inline;" class = "form-control" id = "emailAuth" name = "emailAuth" placeholder = "인증번호 입력해주세요."/>
				<button type = "button" class = "btn btn-primary" id = "emailAuthBtn" style = "width : 170px; height : 38px;">Email 인증하기</button>
			</div>
			
			<div class = "form-group">
				<label for = "mPhone">휴대전화</label>
				<input type = "tel" class = "form-control" id = "mPhone" name = "mPhone" value = "${update.mPhone}"/>
				<div class = "eheck_font" id = "phone_check"><span style = "color : blue">[" - "] 없이 번호로만 작성해주세요.</span></div>
			</div>
			
			<div class = "form-group">
				<input class = "form-control" style = "width : 40%; display : inline;" id = "mZip_Code" name = "mZip_Code"
					type = "text" readonly="readonly" value = "${update.mZip_Code}"/>
				<button type = "button" class = "btn btn-default" onclick = "execPostCode();"><i class = "fa fa-search"></i>우편번호 찾기</button>
			</div>
			
			<div class = "form-group">
				<input class = "form-control" style = "top : 5px;" name = "mFirst_Addr" id = "mFirst_Addr"
					type = "text" readonly = "readonly" value = "${update.mFirst_Addr}"/>
			</div>
			
			<div class = "form-group">
				<input class = "form-control" style = "top : 5px;" name = "mSecond_Addr" id = "mSecond_Addr"
					type = "text" value = "${update.mSecond_Addr}"/>
			</div>
			<div class = "form-group">
				<label for = "authority">회원권한</label>
				<input type = "text" class = "form-control" id = "authority2" name = "authority2" value = "${update.authority}" readonly = "readonly"/>
			</div>
			<div class = "form-group text-center">
				<button type = "submit" class = "btn btn-primary">수정</button>
				<button type = "reset" id = "cancel" class = "btn btn-warning">취소</button>
			</div>
		</form>
	</div>
</div>



<!-- 비밀번호 변경 MODAL 창 처리 -->
<div class="modal fade" id="changePw" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-notify modal-warning" role="document">
		<!--Content-->
		
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
    	<div class="modal-content">
      		<!--Header-->
      		<div class="modal-header text-center">
        		<h4 class="modal-title white-text w-100 font-weight-bold py-2">Change Password</h4>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          		<span aria-hidden="true" class="white-text">&times;</span>
        		</button>
      		</div>
      		<!-- Body -->
      		<div class="modal-body">
      			<div class = "md-form mb-5">
					<input type = "text" class = "form-control" id = "mId2" name = "mId2" value = "${update.mId}" readonly = "readonly"/>
					<label for = "mId">아이디</label>
				</div>
      			<div class="md-form mb-5">
					<input type = "password" id = "originalPw" name = "originalPw" class = "form-control" value = ""/>
					<label for="originalPw">기존 비밀번호</label>
					<div id = "check_originalPw"></div>
      			</div>
      			<div class="md-form mb-5">
          			<input type="password" id="mPw3" name = "mPw3" class="form-control" value = ""/>
          			<label for="mPw">변경 할 비밀번호</label>
          			<div class = "eheck_font" id = "pw_check"><span style = "color : blue"> * 비밀번호를 8-15 자의 [문자/숫자/특수문자]를 조합하세요. </span></div>
        		</div>
        		<div class="md-form mb-5">
          			<input type="password" id="mPw2" name = "mPw2" class="form-control" value = ""/>
          			<label for="mPw2">비밀번호 확인</label>
          			<div class = "eheck_font" id = "pw2_check"></div>
        		</div>
      		</div>
      		<!--Footer-->
      		<div class="modal-footer justify-content-center">
        		<button type = "submit" id = "changePw_btn" class="btn btn-outline-primary waves-effect">비밀번호 변경</button>
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
<!-- DAUM 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

<script>
//이메일 검사 정규식
var mailJ = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
//휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
//주소입력 시 사용
var address = $('#mSecond_Addr');

$(document).ready(function(){
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
		
		var inval_Arr = new Array(3).fill(false);
		
		// E-mail 정규식
		if(mailJ.test($('#mEmail').val())) {
			console.log(mailJ.test($('#mEmail').val()));
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
			alert('이메일을 확인하세요.');
			return false;
		}
		
		//휴대전화 정규식
		if(phoneJ.test($('#mPhone').val())){
			console.log(phone.test($('#mPhone').val()));
			inval_Arr[1] = true;
		} else {
			inval_Arr[1] = false;
			alert('휴대전화번호 확인하세요.');
			return false;
		}
		
		//주소 확인
		if(adress.val() == ''){
			inval_Arr[2] = false;
			alert('주소를 확인하세요.');
			return false;
		} else {
			inval_Arr[2] = true;
		}
	
		//전체 유효성 검사
		var validAll = true;
		for (var i = 0; i < inval_Arr.length; i++){
			if (inval_Arr[i] == false){
				validAll = false;
			}
		}
		if(validAll == true){ //유효성 통과
			alert("회원정보 수정을 완료하였습니다.");	
		} else {
			alert("정보를 다시 확인해주세요.");
		}
	});
	
	
	//취소
	$('#cancel').on("click", function(){
		event.preventDefault();
		location.href = "/home";
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
// 기존 비밀번호 매칭 AJAX
$(document).ready(function(){
	

	//비밀번호 정규식
	var pwJ = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	$('#originalPw').blur(function(){
		
		var mPw = $('#mPw').val();
		var originalPw = $('#originalPw').val();
		
		if(originalPw.length > 0) {
			$.ajax({
				data : {
					"originalPw" : originalPw,
					"mPw" : mPw
					},
				url : "/member/pwCheck",
				success : function(data){
					console.log("data : " + data)
					if(data == 1) {
						$('#check_originalPw').text('기존비밀번호와 일치합니다.');
						$('#check_originalPw').css('color', 'blue');
					} else {
						$('#check_originalPw').text('기존비밀번호와 일치하지 않습니다.');
						$('#check_originalPw').css('color', 'red');
					}
				}
			});
		}	
	});
	
	// Password 유효성 검사
	$('#mPw3').blur(function(){
		
		if ($('#mPw3').val() == $('#originalPw').val()){
			$('#pw_check').text('기존의 비밀번호입니다.');
			$('#pw_check').css('color', 'red');
		} else if(pwJ.test($('#mPw3').val())){
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
		if($('#mPw3').val() != $('#mPw2').val()){
			$('#pw2_check').text('비밀번호가 일치 하지 않습니다.');
			$('#pw2_check').css('color', 'red');
		} else {
			$('#pw2_check').text('비밀번호 일치하였습니다.');
			$('#pw2_check').css('color', 'blue');
		}
	});
	
	$('#changePw_btn').on("click", function(){
		var mPw3 = $('#mPw3').val()
		$.ajax({
			type : "post",
			data : {
				"mPw3" : mPw3,
				"mId" : $('#mId2').val()
			},
			url : "/member/updatePw",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(){
				console.log("비밀번호변경 성공!");
				alert("비밀번호변경 성공!");
				$('#changePw').modal('hide');
			},
			error : function(request, status, error){
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});
	
});
</script>

</body>
</html>