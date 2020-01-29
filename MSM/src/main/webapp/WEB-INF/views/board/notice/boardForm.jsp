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
<title>Board 글쓰기</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">
<script src="/resources/js/ckeditor/ckeditor.js"></script>
<style>
body {
 	padding-top:70px;
 	
}
h2{
	text-align:center;
}
</style>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<article>
	<div class="container" role="main">
		<h2>공지사항 작성</h2>
		<hr/>
		<form name="form" id="form" role="form" method="post" action="/board/notice/write" >
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
			<div class="mb-3">
				<label for="btitle"><strong>제목</strong></label>
				<input type="text" class="form-control" name="btitle" id="btitle" placeholder="제목을 입력해 주세요" required>
			</div>
			<div class="mb-3">
				<label for="mid"><strong>작성자</strong></label>
				<input type="text" class="form-control"name="mid" id="mid" placeholder="이름을 입력해 주세요" required>
			</div>	
			<div class="mb-3">
				<label for="bcontent"><strong>내용</strong></label>			
				<textarea class="form-control" cols="80" rows="10" name="bcontent" id="bcontent" placeholder="내용을 입력해주세요" required></textarea>
				<script type="text/javascript">
				editor = CKEDITOR.replace('bcontent');
				editor.on( 'required', function( evt ) {
				    alert( '내용을 입력하세요' );		

				    evt.cancel();
				} );
				</script>
			</div>
				
			<div>
				<button class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-info" id="btnList">목록</button>
			</div>
		</form>
	</div>
</article><br/><br/>
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
		location.href="/notice/list";
	});
});
</script>
</body>
</html>