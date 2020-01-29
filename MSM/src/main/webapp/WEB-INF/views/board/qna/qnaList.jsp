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
<title>Q&A - MSM</title>
<style>
body {
	padding-top:70px;
	
}
h2 {
	text-align:center;
}
#page li {
list-style : none; float : left; padding:6px;
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
<form role = "form" method="get">
<article>
	<div class="container">
		<div class="table-responsive">
			<h2>Q&A</h2>
			<hr/>
			<table class="table table-striped table-sm table-hover">
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
					<c:forEach var="list" items="${list}">
							<tr>
								<td>${list.qid}</td>
								<td><a href="/board/qna/content_view?qid=${list.qid}&
																		page=${scri.page}&
																		perPageNum=${scri.perPageNum}&
																		searchType=${scri.searchType}&
																		keyword=${scri.keyword}"><c:out value="${list.qtitle}" /></a>								
								</td>
								<td>${list.qwriter}</td>
								<td>${list.qview}</td>
								<td> <fmt:formatDate value="${list.qdate}" pattern="yyyy-MM-dd  HH:mm"/></td>
								
							</tr>
						</c:forEach>					
				</tbody>
			</table>
			<!-- 검색기능 -->
			<div class="seaech">
				<select>
					<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      				<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      				<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      				<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      				<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				</select>
				<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    				<button id="searchBtn" type="button">검색</button>
    		
			</div>
			
			<!-- 페이징 -->
			<div id="page">
				<ul>
					<c:if test="${pageMaker.prev}" >
						<li><a href="list${pagrMarker.makeSearch(pageMaker.startPage-1 )}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage  }" var ="idx">
						<li><a href="list${pageMaker.makeSearch(idx) }">${idx }</a></li>					
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>					
					</c:if>
				</ul>
			</div>
		</div>
		<div>
			<button type="button" class="btn bnt-sm btn-primary" id="btnWriteForm" style = "color : black">글쓰기</button><br><br>
		</div>
		
	</div>
</article>
</form>

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
		location.href="/board/qna/writeView";
	});
	$('#searchBtn').click(function() {
			self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
});

</script>
</body>
</html>