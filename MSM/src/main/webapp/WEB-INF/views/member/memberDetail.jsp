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
<title>Member Detail</title>
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

<div class = "container mb-4 mt-4">
	
	<h3 class = "text-center mt-4">회원 상세정보</h3>
	<hr/>
	
	<form id = "memberDetailForm" role = "form" method = "post" action = "/member/updateView">
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<input type="hidden" id="mId" name="mId" value="${memberDetail.mId}" />
		<input type="hidden" id="page" name="page" value="${scri.page}">
		<input type="hidden" id="perPageNum" name="perPageNum"	value="${scri.perPageNum}">
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
	</form>
	
	<table class="table table-hover">
			<tbody>
				<tr>
					<th><strong>ID</strong></th>
					<td>${memberDetail.mId}</td>
				</tr>
				<tr>
					<th><strong>Name</strong></th>
					<td>${memberDetail.mName}</td>
				</tr>
				<tr>
					<th><strong>E-mail</strong></th>
					<td>${memberDetail.mEmail}</td>
				</tr>
				<tr>
					<th><strong>Phone</strong></th>
					<td>${memberDetail.mPhone}</td>
				</tr>
				<tr>
					<th><strong>우편번호</strong></th>
					<td>${memberDetail.mZip_Code}</td>
				</tr>
				<tr>
					<th><strong>주소</strong></th>
					<td>${memberDetail.mFirst_Addr}&nbsp;${memberDetail.mSecond_Addr}</td>
				</tr>				 			
				<tr>
					<th><strong>회원권한</strong></th>
					<td>${memberDetail.authority}</td>					
				</tr>				 
				<tr>
					<th><strong>가입일</strong></th>
					<td><fmt:formatDate value="${memberDetail.regDate}"	pattern="yyyy-MM-dd" /></td>
				</tr>
			</tbody>		
		</table>
		<div class = "text-center">
			<button type="submit" class="update_btn btn btn-primary" id = "update_btn">수정</button>
			<a class = "btn btn-danger" data-toggle = "modal" data-target = "#deleteMember">탈퇴</a>
			<sec:authorize url = "/admin/**">
			<a type = "button" class = "btn btn-secondary" href = "/admin/admin">목록</a>	
			</sec:authorize>
		</div>
</div>

<!-- 회원탈퇴 MODAL -->
<div class="modal fade" id="deleteMember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

	<div class="modal-dialog modal-notify modal-warning" role="document">
		
		<!--Content-->		
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
    	<div class="modal-content">
    		
    		<!--Header-->
      		<div class="modal-header text-center">
    			<h4 class="modal-title white-text w-100 font-weight-bold py-2">회원탈퇴 비밀번호 확인</h4>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          		<span aria-hidden="true" class="white-text">&times;</span>
        		</button>
        	</div>
    	
	    	<!-- Body -->
	      	<div class="modal-body">
	      		<div class = "md-form mb-5">
					<input type = "text" class = "form-control" id = "mId2" name = "mId2" value = "${memberDetail.mId}" readonly = "readonly"/>
					<label for = "mId">아이디</label>
				</div>
				<div class="md-form mb-5">
					<input type = "hidden" id = "mPw" name = "mPw" class = "form-control" value = "${memberDetail.mPw}" readonly = "readonly"/>
					<input type = "password" id = "originalPw" name = "originalPw" class = "form-control" value = ""/>
					<label for="originalPw">비밀번호</label>
					<div id = "check_originalPw"></div>
	      		</div>
	      		<p style = "font-size : 12px;">올바른 비밀번호를 입력하시면, 탈퇴 버튼이 활성화 됩니다.</p>
	      	</div>
	      	
	      	<!--Footer-->
	      	<div class="modal-footer justify-content-center">
	      		<form action = "http://localhost:8181/logout" method = "post" onsubmit = "return deleteMember()">
	      			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
	        		<button type = "submit" id = "delete_btn" class="btn btn-outline-primary waves-effect" disabled>MSM 탈퇴</button>
	        	</form>
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

<script>

$(document).ready(function(){	
	var formObj = $("#memberDetailForm");
	
	//수정
	$("#update_btn").on("click", function(){
		formObj.attr("action", "/member/updateView");
		formObj.attr("method", "get");
		formObj.submit();
	});
});

</script>

<script>

// 회원탈퇴 프로세스 전 비밀번호 확인.
$(document).ready(function(){
	
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
						$('#delete_btn').removeAttr("disabled");
					} else {
						$('#check_originalPw').text('기존비밀번호와 일치하지 않습니다.');
						$('#check_originalPw').css('color', 'red');
						$('#delete_btn').attr("disabled", "true");
					}
				}
			});
		}	
	});
});

//회원 탈퇴 method
function deleteMember(){
	
	var confirm_val = confirm("MSM 회원 탈퇴 하시겠습니까?");
	
	if(confirm_val){
		
		$.ajax({
			type : "post",
			data : {
				"mId" : $("#mId2").val()
			},
			url : "/member/delete",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(){
				console.log("회원탈퇴처리 완료.");			
			},
			error : function(request, status, error){
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		
	} else {
		
		return false;
	}
	
	alert("회원탈퇴 처리되었습니다.");
	
	$('#deleteMember').modal('hide');
	
	return true;
	
}

</script>


</body>
</html>