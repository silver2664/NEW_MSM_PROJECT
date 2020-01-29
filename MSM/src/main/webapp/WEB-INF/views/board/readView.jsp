<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta id = "_csrf" name = "_csrf" content = "${_csrf.token}"/>
<title>Material Design Bootstrap</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
</head>
<body>

	<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<%@include file = "nav.jsp" %>
			
			<hr />
			
			<section id="container">
				<form id = "readForm" role="form" method="post">
					<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
					<input type = "hidden" id = "bno" name = "bno" value = "${read.bno}"/>
					<input type = "hidden" id = "page" name = "page" value = "${scri.page}">
					<input type = "hidden" id = "perPageNum" name = "perPageNum" value = "${scri.perPageNum}">
					<input type = "hidden" id = "serachType" name = "searchType" value = "${scri.searchType}">
					<input type = "hidden" id = "keyword" name = "keyword" value = "${scri.keyword}">
				</form>
					<table>				
						<tbody>
							<tr>
								<td>
									<label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn" id = "update_btn">수정</button>
						<button type="submit" class="delete_btn" id = "delete_btn">삭제</button>
						<button type="submit" class="list_btn" id = "list_btn">목록</button>	
					</div>
					
					<!-- 댓글 -->
					<div id="reply">
  						<ol class="replyList">
    						<c:forEach items="${replyList}" var="replyList">
      							<li>
        							<p>
       									작성자 : ${replyList.writer}<br />
       									작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
        							</p>
        							<p>${replyList.content}</p>
      							</li>
    						</c:forEach>   
  						</ol>
					</div>
					
					<!-- 댓글 작성 -->
					<form name="replyForm" method="post">
						<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
 						<input type="hidden" id="bno" name="bno" value="${read.bno}" />
  						<input type="hidden" id="page" name="page" value="${scri.page}"> 
  						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

  						<div>
    						<label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
    						<br/>
    						<label for="content">댓글 내용</label><input type="text" id="content" name="content" />
  						</div>
  						<div>
 	 						<button type="button" class="replyWriteBtn">작성</button>
 	 						<!-- 댓글 수정, 삭제 버튼 구현 X data-rno = "읍읍" 가 500 오류 java.lang.NumberFormatException 으로 인하여 구동 X -->
 	 						<button type = "button" class = "replyUpdateBtn" data-rno = "${reply.rno}">수정</button>
 	 						<button type = "button" class = "replyDeleteBtn" data-rno = "${reply.rno}">삭제</button>
  						</div>
					</form>
					
			</section>
			<hr />
		</div>

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>
<script type = "text/javascript">
$(document).ready(function(){
	
	var formObj = $("#readForm");
	
	// 수정
	$("#update_btn").on("click", function(){
		formObj.attr("action", "/board/updateView");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	//취소
	$("#list_btn").on("click", function(){
		event.preventDefault(); 
		location.href = "/board/list?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
	});
	
	//삭제
	$("#delete_btn").on("click", function(){
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true) {			
			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post");
			formObj.submit();
		}
		else {
			event.preventDefault();
			location.href = "/board/list";
		}
	});
	
	//댓글쓰기
	$(".replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/board/replyWrite");
		  formObj.submit();
		});
	
	//댓글 수정 View
	$(".replyUpdateBtn").on("click", function(){
		location.href = "/board/replyUpdateView?bno=${read.bno}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&rno="+$(this).attr("data-rno");
	});
			
	//댓글 삭제 View
	$(".replyDeleteBtn").on("click", function(){
		location.href = "/board/replyDeleteView?bno=${read.bno}"
			+ "&page=${scri.page}"
			+ "&perPageNum=${scri.perPageNum}"
			+ "&searchType=${scri.searchType}"
			+ "&keyword=${scri.keyword}"
			+ "&rno="+$(this).attr("data-rno");
	});
});
</script>
</body>
</html>