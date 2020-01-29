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
<title>공지사항 수정 -- MSM</title>
<style>
body {
 	padding-top:70px;
 	padding-bottpm:30px;
}
h2{
	text-align:center;
}
</style>
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/css/mdb.min.css" />
<script src="../js/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<article class="mb-5">
	<div class="container">
		<h2>공지사항  수정</h2>
		<hr/>
		<form name="form" id="form"  method="post" action="/board/notice/modify" >
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<input type="hidden" id="bid" name="bid" value="${content_view.bid}">
			<div class="mb-3">
				<label for="title"><strong>제목</strong></label>
				<input type="text" class="form-control" name="btitle" id="btitle" value="${content_view.btitle}" required>
			</div>
			<div class="mb-3">
				<label for="reg_id"><strong>작성자</strong></label>
				<input type="text" class="form-control"name="mid" id="mid" value="${content_view.mid}" readonly>
			</div>	
			<div class="mb-3">
				<label for="bcontent"><strong>내용</strong></label>			
				<textarea class="form-control" cols="80" rows="10" name="bcontent" id="bcontent"  required>${content_view.bcontent}</textarea>
				<script type="text/javascript">
				editor = CKEDITOR.replace('bcontent');
				editor.on( 'required', function( evt ) {
				    alert( '내용을 입력하세요' );		
				  

				    evt.cancel();
				} );
				</script>			
				<button type="submit" class="btn btn-sm btn-primary"  id="modify">수정</button>
				<button type="button" class="btn btn-sm btn-info"  id="btnList">목록</button>
			</div>
		</form>
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
	
	
	$("#btnList").click(function(e) {
		e.preventDefault();
		location.href="list";
	});
		
	
});
</script>
</body>
</html>