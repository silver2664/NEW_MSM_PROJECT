<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>상품 페이지 --MSM</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
<!-- resource CSS -->
<link href="<c:url value = "/resources/css/home.css"/>" rel="stylesheet" type="text/css">
<!-- CK EDITOR -->
<script src="/resources/js/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/tabs.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/tabstyles.css"/>" type="text/css">
<script src="/resources/js/modernizr.custom.js"></script>
<style>
h2 {
	text-align: center;
	margin-bottom: 20px;
}

table {
	margin: auto;
}

#section-linetriangle-1 {
	text-align: center;
	font: 11px;
}

#section-linetriangle-2 {
	text-align: left;
	font-size: 14px;
}

#section-linetriangle-3 {
	text-align: left;
	font-size: 14px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/shareResource/header.jsp"%>



	<table>
		<tr>
			<td><img src="/resources/${vo.mgImg}" width="540" height="300">
			</td>
			<td>
				<table style="height: 516px; width: 456px;">
					<tr align="center">
						<td><span>${vo.mgName}</span></td>
					</tr>
					<tr align="center">
						<td><fmt:setLocale value="ko_KR" />
							<fmt:formatNumber type="currency" value="${vo.mgPrice}" /></td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<form name="form1" role="form" method="post" action="/cart/insert">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<input type="hidden" id="mgNum"	name="mgNum" value="${vo.mgNum}" /> 
								<select id = "amount" name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp; 개 <input type="submit" value="장바구니에 담기"><a type = "button" class = "btn btn-success btn-sm" id = "cartBtn">Cart</a>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div class = "text-center">		
		<a class = "btn btn-secondary btn-sm" href="/product/listView">상품목록</a>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button class="btn btn-primary btn-sm" id="update">상품 수정</button>
		<button class="btn btn-danger btn-sm" id="delete">상품 삭제</button>
		<a class="btn btn-warning btn-sm" href = "/admin/goodsList">관리자 상품리스트</a>
		</sec:authorize>
	</div>
	<br>
	<hr class="container">
	<br>

	<!--  tab -->
	<section>
		<div class="tabs tabs-style-linetriangle">
			<nav>
				<ul>
					<li><a href="#section-linetriangle-1"><span>상세정보</span></a></li>
					<li><a href="#section-linetriangle-2"><span>배송정보</span></a></li>
					<li><a href="#section-linetriangle-3"><span>교환및 환불정책</span></a></li>
				</ul>
			</nav>
			<div class="content-wrap">
				<c:forEach var="tablist" items="${tablist}">
					<section id="section-linetriangle-1">${vo.mgContent}</section>
					<section id="section-linetriangle-2">${tablist.delivery}</section>
					<section id="section-linetriangle-3">${tablist.refund }</section>
				</c:forEach>
			</div>
			<!-- /content -->
		</div>
	</section>

	<script src="/resources/js/cbpFWTabs.js"></script>
	<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
			</script>

	<%@ include file="/WEB-INF/views/shareResource/footer.jsp"%>
	<!-- SCRIPTS -->
	<!-- JQuery -->
	<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>
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
	
var formObj = $("form[role='form']");
$("#update").click(function() {
	formObj.attr("action","/product/productModifyView");
	formObj.attr("method","get");
	formObj.submit();
});
$("#delete").click(function() {
	var con = confirm("정말로 삭제 하시겠습니까?");
	if(con) {
		formObj.attr("action","/product/productDelete");
		formObj.submit();
	}
});
</script>
<script>
$(document).ready(function() {
	$("#cartBtn").click(function() {
		var cartKey;
		var value = {};
		var obj=[];
		
		value = {
				mgNum : '${vo.mgNum}',
				mgPrice : '${vo.mgPrice}',
				mgStock : $("#amount option:selected").val(),
				mgName : '${vo.mgName}',
				mgImg : '${vo.mgImg}'
		}
		
		if(localStorage.getItem("cartKey") == null) {
			obj[0] =value;
			var y = JSON.stringify(obj);
			localStorage.setItem("cartKey",y);
		}else{
			var z = localStorage.getItem("cartKey");
			
			obj=JSON.parse(z);
			leng = obj.length;
			obj[leng] =value;
			var a = JSON.stringify(obj);
			localStorage.setItem("cartKey",a);
		}
		location.href="/resources/html/cart1.html"
	});
});
</script>
</body>
</html>