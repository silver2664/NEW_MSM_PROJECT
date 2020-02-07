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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>상품 목록 -- MSM</title>
<style>
.row {
	margin:auto;
	
}
.card {
	margin-bottom:20px;
	
}
.card-columns {
	@include media-breakpoint-only(lg) {
    column-count: 4;
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
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<div class = "container">
<h2>상품목록</h2>
<!--  

<table border = "1">
	<tr>
		<th>상품ID번호</th>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>가격</th>
	</tr>
	<c:forEach var = "row" items = "${list}">
		<tr>
			<td>
				${row.mgNum}
			</td>
			<td>
				<a href = "${path}/product/productView/${row.mgNum}">
					<img src = "/resources/${row.mgImg}" width = "120px" height = "110px">
				</a>
			</td>
			<td>
				<!--  <a href = "${path}/product/detailView/${row.mgNum}">
					${row.mgName}
				</a>-->
			 <!-- </td>
			<td>
				<fmt:formatNumber value = "${row.mgPrice}" pattern = "###,###,###"/>
			</td>
		</tr>
	</c:forEach>
</table><br/> 

</div>-->

<div class="row">
	
	<c:forEach var = "row" items = "${list}">
		<div class="col-xl-3 col-md-3 col-sm-3 card card-cascade narrow card-ecommerce d-flex">
			<!-- Card Image -->
			
			<div class="view view-cascade overlay">
				<a href = "${path}/product/productView/${row.mgNum}">
						<img src = "/resources/${row.mgImg}" style="width:100%">
					</a>			
			</div>
			<!-- Card Content -->
			<div class="card-body card-body-cascade text-center pb-3">
				<!-- Title -->
				<h5 class="card-title mb-1">
					<strong> <a href="${path}/product/productView/${row.mgNum}">${row.mgName}</a>
					</strong>
				</h5>
				<!-- Rating 
				<div class="container">
					<i class="fas fa-star amber-text"></i> <i
						class="fas fa-star amber-text"></i> <i
						class="fas fa-star amber-text"></i> <i
						class="fas fa-star amber-text"></i> <i
						class="fas fa-star amber-text"></i>
				</div>-->
				<!-- Description 
				<p class="card-text">MSM Goods No.1 Example</p>-->
				<!-- Card Footer -->
				
				<div class="card-footer px-1">
					<span class="float-left font-weight-bold">
					 <strong><fmt:setLocale value="ko_KR"/>
					 <fmt:formatNumber type="currency" value="${row.mgPrice}"/></strong>
					</span> <span class="float-right"> <a
						class="material-tooltip-main" data-toggle="tooltip"
						data-place="top" title="Add to Cart"> <i
							class="fas fa-shopping-cart grey-text ml-3"></i>
					</a> <a class="material-tooltip-main" data-toggle="tooltip"
						data-place="top" title="Add to WishList"> <i
							class="fas fa-heart grey-text ml-3"></i>
					</a>
					</span>
				</div>
			</div>
		</div>
		</c:forEach>
		
	
	
	
</div>
<button class="btn btn-info btn-sm" id="register">상품등록</button>
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
$(document).ready(function() {	
	$("#register").click(function(e) {
		
		location.href="/product/product_reg";
	});
});
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