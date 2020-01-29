<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Q&A -- MSM</title>
<style>
h2 {
	padding-top: 30px;
	padding-bottom: 30px;
}
h4 {
	padding-top:10px;
}

h2 {
	text-align: center;
}
</style>
<!--font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/css/mdb.min.css" />
</head>
<body>
	<div class="container mb-5">
		<h2>게시판 글 보기</h2>

		<form name="readForm" role="form" method="post">
			<input type="hidden" id="qid" name="qid" value="${content_view.qid }" />
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum"	value="${scri.perPageNum}">
			 <input type="hidden"	id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword"	value="${scri.keyword}">
		</form>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th><strong>글번호</strong></th>
					<td>${content_view.qid}</td>
				</tr>
				<tr>
					<th><strong>제목</strong></th>
					<td>${content_view.qtitle}</td>
				</tr>
				<tr>
					<th><strong>작성자</strong></th>
					<td>${content_view.qwriter}</td>
				</tr>
				<tr>
					<th><strong>작성 날짜</strong></th>
					<td><fmt:formatDate value="${content_view.qdate}"	pattern="yyyy-MM-dd HH:mm " /></td>
				</tr>
				<tr>
					<th><strong>글 내용</strong></th>
					<td>${content_view.qcontent}</td>
				</tr>
			</tbody>		
		</table>
		<button type="button" class="btn btn-sm btn-danger" id="delete">삭제</button>
		<button type="button" class="btn btn-sm btn-info" id="btnList">목록</button>
		<button class="btn btn-sm btn-success" id="modify">수정</button>
		<h4 style="text-align:left;">Comments</h4>
		<hr/>
		<!-- 댓글 -->
		<div id="reply">
			<ol class="replyList">
				<c:forEach items="${replyList}" var="replyList">
					
						<p>
							작성자 : ${replyList.writer }
							<fmt:formatDate value= "${replyList.rdate}"
								pattern="(yyyy-MM-dd HH:mm)" />
						</p>
						<p>${replyList.content}</p>
			<hr/>
					
				</c:forEach>
			</ol>
		</div>
		<form name="replyForm" method="post">
			<input type="hidden" id="qid" name="qid" value="${content_view.qid}" />
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum"	value="${scri.perPageNum}">
			 <input type="hidden"	id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword"	value="${scri.keyword}">
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="writer" name="writer"  required >
				</div>
			</div>
			<div class="form-group">
				<label for="content">댓글 내용</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="content" name="content"	 required>
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-sm btn-warning replyWriteBtn">작성</button>
			</div>
			<br>
			<br>

		</form>


		











	</div>
	<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>


	<!--jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!--popper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<!--javascript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/js/mdb.min.js"></script>
	<script>
		$(document)	.ready(	function() {
							var formObj = $("form[name='readForm']");

							//리스트
							$("#btnList")	.on("click",function() {
												location.href = "/board/list?page=${scri.page}"
														+ "&perPageNum=${scri.perPageNum}"
														+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
											});

							//삭제
							$("#delete").on("click", function() {
								var deleteYN = confirm(" 정말로 삭제하시겠습니까? ")

								if (deleteYN == true) {
									formObj.attr("action", "/board/delete");
									formObj.attr("method", "post");
									formObj.submit();
								}
							});

							//수정
							$("#modify").on("click", function() {
								formObj.attr("action", "/board/updateView");
								formObj.attr("method", "get");
								formObj.submit();
							});

							//댓글 달기
							$(".replyWriteBtn").on("click", function() {
								var formObj = $("form[name='replyForm']");
								formObj.attr("action", "/board/replyWrite");
								formObj.submit();
							});

						});
	</script>
</body>
</html>