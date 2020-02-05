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
<title>상품등록 -- MSM</title>
<style>
body {
 	padding-top:70px;
 	
}
h2{
	text-align:center;
}
</style>
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
					filebrowserUploadUrl:"/product/ckUpload"
							
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
$(document).ready(function() {	
	$("#btnList").click(function(e) {
		
		location.href="/product/listView";
	});
});
</script>
</body>
</html>