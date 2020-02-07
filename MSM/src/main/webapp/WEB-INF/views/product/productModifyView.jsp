<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>상품 수정 -- MSM</title>
<style>
body {
 	padding-top:70px;
 	padding-bottpm:30px;
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
<!-- Ck Editor -->
<script src="/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<article class="mb-5">
	<div class="container">
		<h2> 상품  수정</h2>
		<hr/>
		<form name="form" id="form"  method="post" action="/product/productModify" enctype="multipart/form-data" >
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<input type="hidden" id="mgNum" name="mgNum" value="${mo.mgNum}" readonly="readonly">
			<div class="mb-3">
				<label for="mgName"><strong>상품명</strong></label>
				<input type="text" class="form-control" name="mgName" id="mgName" value="${mo.mgName}" required>
			</div>
			
			<div class="mb-3">
				<label for="mgPrice"><strong>가격</strong></label>
				<input type="text" class="form-control" name="mgPrice" id="mgPrice" value="${mo.mgPrice}">
			</div>
			<div class="mb-3">
				<label for="mgStock"><strong>수량</strong></label>
				<input type="text" class="form-control" name="mgStock" id="mgStock" value="${mo.mgStock}">
			</div>
			<div class="inputArea">
 			<label for="gdsImg">이미지</label>
 			<input type="hidden" name="mgImg" value="${mo.mgImg}">
 			<input type="file" id="mgImg" name="file"  />
 			<div class="select_img"><img src="" /></div>
 			
 			</div>
			
			<div class="mb-3">
				<label for="content"><strong>내용</strong></label>			
				<textarea class="form-control" cols="80" rows="10" name="mgContent" id="mgContent"  required>${mo.mgContent}</textarea>
				<script type="text/javascript">
				editor = CKEDITOR.replace('mgContent');
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
		location.href="listView";
	});
		
	
});
</script>
</body>
</html>