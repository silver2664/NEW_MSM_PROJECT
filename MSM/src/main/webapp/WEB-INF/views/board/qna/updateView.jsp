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

<article class="mb-5">
	<div class="container">
		<h2>공지사항  수정</h2>
		<hr/>
		<form name="form" id="form"  method="post" action="/board/update" >
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<input type="hidden" id="qid" name="qid" value="${update.qid}" readonly="readonly">
			<div class="mb-3">
				<label for="title"><strong>제목</strong></label>
				<input type="text" class="form-control" name="qtitle" id="qtitle" value="${update.qtitle}" required>
			</div>
			<!-- 작성자는 수정이 아니라 값을 받아 오므로 readonly속성으로 수정불가 -->
			<div class="mb-3">
				<label for="title"><strong>작성자</strong></label>
				<input type="text" class="form-control" name="qwriter" id="qwriter" value="${update.qwriter}"readonly="readonly">
			</div>
			
			<div class="mb-3">
				<label for="content"><strong>내용</strong></label>			
				<textarea class="form-control" cols="80" rows="10" name="qcontent" id="qcontent"  required>${update.qcontent}</textarea>
				<script type="text/javascript">
				editor = CKEDITOR.replace('qcontent');
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
		location.href="list";
	});
		
	
});
</script>
</body>
</html>