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
<title>공지사항 -- MSM</title>
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
<style>
h2{
	padding-top:30px;
	padding-bottom:30px;
}
h2 {
		text-align:center;
}
</style>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<div class="container mb-5">
	<h2>게시판 글 보기</h2>
		
	<table class="table table-hover">
		<tbody>
			<tr>
				<th><strong>글번호</strong></th>
				<td>${content_view.bid}</td>
			</tr>
			<tr>
				<th><strong>제목</strong></th>
				<td>${content_view.btitle}</td>
			</tr>
			<tr>
				<th><strong>작성자</strong></th>
				<td>${content_view.mid}</td>
			</tr>
			<tr>
				<th><strong>작성 날짜</strong></th>
				<td>${content_view.bdate}</td>
			</tr>
			<tr>
				<th><strong>글 내용</strong></th>
				<td>${content_view.bcontent}</td>
			</tr>
	
		</tbody>
		
	</table>
	
	<button type="button" class="btn btn-sm btn-info" id="btnList">목록</button>
	<sec:authorize access = "hasRole('ROLE_ADMIN')">
	<button class="btn btn-sm btn-success" id="modify">수정</button>
	<button type="button" class="btn btn-sm btn-danger" id="delete">삭제</button>		
	</sec:authorize>








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


$(document).ready(function() {
	
	
	$("#btnList").click(function(e) {
		e.preventDefault();
		location.href="/board/notice/noticeList";
	});
	$("#delete").click(function(e) {
		e.preventDefault();
		location.href="/board/notice/delete?bid=${content_view.bid}";
	});
	$("#modify").click(function(e) {
		e.preventDefault();
		location.href="/board/notice/modify_view?bid=${content_view.bid}";
	});
	
	
	
	
	
});
</script>
</body>
</html>