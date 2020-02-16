<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
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
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">
</head>
<body>

<h2>상품 상세정보</h2>
<table border = "1">
	<tr>
		<td>
			<img src = "/resources/images/${vo.mgImg}" width = "340" height = "300">
		</td>
		<td>
			<table border = "1" style = "height : 300px; width : 400px;">
				<tr align = "center">
					<td>상품명</td>
					<td>${vo.mgName}</td>
				</tr>
				<tr align = "center">
					<td>가격</td>
					<td>${vo.mgPrice}</td>
				</tr>
				<tr align = "center">
					<td>상품소개</td>
					<td>${vo.mgContent}</td>
				</tr>
				<tr align = "center">
					<td colspan = "2">
						<form name = "form1" method = "post" action = "/cart/insert">
							<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
							<input type = "hidden" name = "productId" value = "${vo.mgNum}"/>
							<select name = "amount">
								<c:forEach begin = "1" end = "10" var = "i">
									<option value = "${i}">${i}</option>
								</c:forEach>
							</select>&nbsp; 개
							<input type = "submit" value = "장바구니에 담기">
						</form>
							<a href = "/product/listView">상품목록</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

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

<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
</body>
</html>