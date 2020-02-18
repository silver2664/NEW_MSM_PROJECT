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
<title>CART</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- resource CSS -->
<link href = "<c:url value = "/resources/css/home.css"/>" rel = "stylesheet" type = "text/css">

</head>
<body>
<div class="container">
<h2>CART</h2>
<c:choose>
	<c:when test = "${map.count == 0}">
		장바구니가 비어있습니다.
	</c:when>
	<c:otherwise>
		<form name = "form1" id = "form1" method = "post" action = "${path}/cart/update">
			<table border = "1" class="table table-hover">
				<tr>
					<th>상품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>금액</th>
					<th>취소</th>
				</tr>
				
				<c:forEach var = "row" items = "${map.list}" varStatus = "i">
					<tr>
						<td >
							${row.productName}
						</td>
						<td style = "width : 80px; align : right">
							<fmt:formatNumber type="currency" value ="${row.productPrice}"/>
						</td>
						<td>
							<input type = "number" style = "width : 40px;" name = "amount" value = "${row.amount}" min = "1" />
							<input type = "hidden" name = "mgNum" value = "${row.mgNum}"/>
							<input type = "hidden" name="userId" value="${row.userId }"/>
						</td>
						<td>
							<fmt:formatNumber type="currency" value = "${row.money}"/>
						</td>
						<td style = "width : 100px;" align = "right">
							<a href = "${path}/cart/delete?cartId=${row.cartId}">삭제</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan = "5" align = "right">
						장바구니 금액 합계 : <fmt:formatNumber type="currency" value ="${map.sumMoney}"/><br/>
						배송료 : ${map.fee}<br/>
						전체 주문 금액 : <fmt:formatNumber type="currency" value = "${map.allsum}"/>
					</td>
				</tr>
			</table>
			<input type = "hidden" name = "count" value ="${map.count}">
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
			<button class="btn btn-success btn-sm"  type="button" id="order">주문 정보 입력</button>
			<button class="btn btn-sm btn-primary" type = "submit" id = "btnUpdate">수정</button>
			<button class="btn btn-info btn-sm"type = "button" id = "btnList">상품목록</button>
		</form>
	</c:otherwise>
</c:choose>
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
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href = "${path}/product/listView";
	});
	$("#order").click(function(){
        location.href = "${path}/cart/order";
    });
});
</script>

<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
</body>
</html>