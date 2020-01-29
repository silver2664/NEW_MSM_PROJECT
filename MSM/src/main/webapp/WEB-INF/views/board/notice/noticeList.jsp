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
<title>공지사항 목록</title>
<style>
body {
	padding-top:70px;
	
}
h2 {
	text-align:center;
}
</style>
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/css/mdb.min.css" />
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<article>
	<div class="container">
		<div class="table-responsive">
			<h2>공지사항</h2>
			<hr/>
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width:5%;" />
					<col style="width:40%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.bid}</td>
								<td><a href="content_view?bid=${dto.bid}">${dto.btitle}</a>								
								</td>
								<td>${dto.mid}</td>
								<td>${dto.bview}</td>
								<td>${dto.bdate}</td>
							</tr>
						</c:forEach>					
				</tbody>
			</table>
		</div>
		<div>
			<button type="button" class="btn bnt-sm btn-primary" id="btnWriteForm">글쓰기</button><br><br>
		</div>
		
	</div>
</article>

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
	$("#btnWriteForm").click(function() {
		location.href="/board/notice/boardForm";
	});
});

</script>
</body>
</html>