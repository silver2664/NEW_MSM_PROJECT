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
<title>Basic Form</title>
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

<h3>MemberList</h3>
<hr/>

<div class = "container mb-3">
	<form role = "form" method = "get">
	<table>
		<tr>
			<th>ID</th>
			<!-- <th>PASSWORD</th>  -->
			<th>NAME</th>
			<th>EMAIL</th>
			<th>PHONE</th>
			<th>권한</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>가입일</th>
		</tr>
		<c:forEach var = "member" items = "${memberList}">
		<tr>
			<td>
				<a href="/member/memberDetail?mId=${member.mId}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${member.mId}" /></a>
			</td>
			<!-- <td>${member.mPw}</td>  -->
			<td>${member.mName}</td>
			<td>${member.mEmail}</td>
			<td>${member.mPhone}</td>
			<td>${member.authority}</td>
			<td>${member.mZip_Code}</td>
			<td>${member.mFirst_Addr}&nbsp;${member.mSecond_Addr}</td>
			<td>${member.regDate}</td>			
		</tr>
		</c:forEach>  		
	</table>
	<div class="search">
	    <select name="searchType">
	      	<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
	     	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>ID</option>
	      	<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>EMAIL</option>	     
	    </select>
	
	    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
	
	    <button id="searchBtn" type="button">검색</button>
	    				
  	</div>
  	<div style = "height : 50px;">
  		<ul>
    		<c:if test="${pageMaker.prev}">
    			<li style = "list-style : none; float : left; padding : 6px;"><a href="memberList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    		</c:if> 

    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    			<li style = "list-style : none; float : left; padding : 6px;"><a href="memberList${pageMaker.makeSearch(idx)}">${idx}</a></li>
    		</c:forEach>

    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    			<li style = "list-style : none; float : left; padding : 6px;"><a href="memberList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    		</c:if> 
  		</ul>
	</div>
	</form>
</div>










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
$(function(){
	$('#searchBtn').click(function() {
		self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
});   
</script>
</body>
</html>