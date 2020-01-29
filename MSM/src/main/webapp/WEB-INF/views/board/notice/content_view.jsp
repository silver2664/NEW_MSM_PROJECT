<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session = "true"%>
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
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/css/mdb.min.css" />
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">
<script src="/resources/js/ckeditor/ckeditor.js"></script>
<style>
h2{
	padding-top:70px;
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
	
	
	<table  class="table table-hover">
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
	<button type="button" class="btn btn-sm btn-danger" id="delete">삭제</button>
	<button type="button" class="btn btn-sm btn-info" id="btnList">목록</button>
	<button class="btn btn-sm btn-success" id="modify">수정</button>








</div>
<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/js/mdb.min.js"></script>
<script>


$(document).ready(function() {
	
	
	$("#btnList").click(function(e) {
		e.preventDefault();
		location.href="/board/notice/list";
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