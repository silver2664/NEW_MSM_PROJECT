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

<div class = "container">
	
	<h3>회원 상세정보</h3>
	<hr/>
	
	<form name = "memberDeailForm" role = "form" method = "post" action = "/member/updateMember">
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
					<td><fmt:formatDate value="${memberDetail.regDate}"	pattern="yyyy-MM-dd HH:mm " /></td>
				</tr>
			</tbody>		
		</table>

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
</body>
</html>