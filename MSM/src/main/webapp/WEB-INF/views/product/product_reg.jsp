<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>상품등록</title>
<style>
body {
 	padding-top:70px;
 	
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
<script src="/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
<article>
	<div class="container" role="main">
		<h2>상품등록</h2>
		<hr/>
		<form name="form" id="form" role="form" method="post" action="/product/register" >
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
			<div class="mb-3">
				<label for="mgName"><strong>상품명</strong></label>
				<input type="text" class="form-control" name="mgName" id="mgName" placeholder="상품명을 입력하세요" required>
			</div>
			<div class="mb-3">
				<label for="mgPrice"><strong>가격</strong></label>
				<input type="text" class="form-control"name="mgPrice" id="mgPrice" placeholder="가격을 입력해주세요" required>
			</div>
				<div class="mb-3">
				<label for="mgStock"><strong>수량</strong></label>
				<input type="text" class="form-control"name="mgStock" id="mgStock" placeholder="수량을 입력해주세요" required>
			</div>	
			<div class="mb-3">
				<label for="mgContent"><strong>내용</strong></label>			
				<textarea class="form-control" cols="80" rows="10" name="mgContent" id="mgContent" placeholder="내용을 입력해주세요" required></textarea>
				<script type="text/javascript">
				
				CKEDITOR.replace('mgContent',{
					filebrowserUploadUrl:"product/ckUpload" 

									
				});			
				</script>
			</div>
				
			<div>
				<button class="btn btn-sm btn-primary" id="btnSave">상품등록</button>
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