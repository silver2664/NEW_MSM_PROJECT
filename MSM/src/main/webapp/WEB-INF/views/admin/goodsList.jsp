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
<title>Goods List(admin)</title>
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

<h1 class = "text-center mt-4">상품관리</h1>
<hr/>
<hr/>
<div class = "container mb-3">
	<div class = "text-center mb-2">
		<a type = "button" class = "btn btn-success" href = "/admin/admin">
		<i class="fas fa-home"></i>&nbsp;&nbsp;ADMIN HOME</a>
		
		<a type = "button" class = "btn btn-primary" href = "/product/product_reg">		
		<i class="fas fa-plus-circle"></i>&nbsp;&nbsp;상품등록</a>
		
		<a type = "button" class = "btn btn-info" id = "updateAmount">
		<i class="fas fa-warehouse"></i>&nbsp;&nbsp;재고수정</a>
		
		<a type = "button" class = "btn btn-secondary" id = "updatePrice">
		<i class="fas fa-dollar-sign"></i>&nbsp;&nbsp;가격수정</a>
		
		<a type = "button" class = "btn btn-danger" id = "deleteGoods">
		<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;상품삭제</a>
		
	</div>
	<form role = "form" method = "post">
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<table class = "table table-bordered table-striped table-hover">
			<thead class = "black white-text text-center">
				<tr>
					<th style = "width : 5%">
						<div class = "custom-control custom-checkbox allcheck">
							<input type = "checkbox" class = "custom-control-input allcheck" id = "allcheck">
							<label class = "custom-control-label" for = "allcheck"></label>
						</div>
					</th>
					<th style = "width : 10%">상품번호</th>
					<th style = "width : 50%">상품명</th>
					<th style = "width : 15%">재고</th>
					<th style = "width : 20%">가격</th>
				</tr>
			</thead>
			<tbody class = "text-center">
				<c:forEach var = "goods" items = "${goodsList}" varStatus = "status">
				<tr id = "memberTR">
					<td scope = "row">
						<div class = "custom-control custom-checkbox">
							<input type = "checkbox" class = "custom-control-input chk" name = "chk" id = "${goods.mgNum}" data-goodsId="${goods.mgNum}">
							<label class = "custom-control-label" for = "${goods.mgNum}"></label>
						</div>
					</td>
					<td><a href = "${path}/product/productView/${goods.mgNum}">${goods.mgNum}</a></td>
					<td><a href = "${path}/product/productView/${goods.mgNum}">${goods.mgName}</a></td>
					<td>
						<input class = "text-center" type = "text" name = "mgStock" id = "mgStock" value = "${goods.mgStock}"/>
					</td>
					<td>
						<input class = "text-center" type = "text" name = "mgPrice" id = "mgPrice" value = "${goods.mgPrice}"/>
					</td>		
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- pagination -->
		<div style = "height : 50px;">
	  		<ul class = "pagination pg-blue justify-content-center">
	    		<c:if test="${pageMaker.prev}">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="goodsList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
	    		</c:if> 
	
	    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="goodsList${pageMaker.makeSearch(idx)}">${idx}</a></li>
	    		</c:forEach>
	
	    		<c:if test="${pageMaker.next && pageMaker2.endPage > 0}">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="goodsList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
	    		</c:if>
	  		</ul>
		</div>
		
		<!-- search -->
		<div class="search row justify-content-center">
			
		    <select name="searchType">		      	
		     	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>상품명</option>     
		    </select>
			
		    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		
		    <button id="searchBtn" type="button"><i class="fas fa-search" aria-hidden="true"></i></button>
		   				
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
$('#allcheck').click(function(){
	var chk = $('#allcheck').prop("checked");
	if(chk){
		$(".chk").prop("checked", true);
	} else {
		$(".chk").prop("checked", false);
	}
});


$(".chk").click(function(){
	$('#allcheck').prop("checked", false);
});
</script>
<script>
$('#deleteGoods').on("click", function(){
	var confirm_val = confirm("해당 상품들을 삭제하시겠습니까?");
	
	if(confirm_val){
		var mgNum = new Array();
		var checkBox = $("input[name='chk']:checked");
		
		$(checkBox).each(function(){
			mgNum.push($(this).attr("data-goodsId"));
		});
		
		$.ajax({
			url : "/admin/productDelete",
			type : "post",
			data : {mgNum : mgNum},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(){
				alert("삭제성공");
				location.href = "/admin/goodsList";
			},
			error : function(request, status, error){
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
			}		
		});
	}
});

$('#updateAmount').on("click", function(){
	var confirm_val = confirm("해당 상품들의 수량을 변경하시겠습니까?");
	
	if(confirm_val){
		
		var mgNum = new Array();
		var mgAmount = new Array();
		var checkBox = $("input[name='chk']:checked");
		
		$(checkBox).each(function(i){
			mgNum.push($(this).attr("data-goodsId"));
			var tr = checkBox.parent().parent().parent().eq(i);
			var td = tr.children();
			var amount = td.eq(3).children().val();
			mgAmount.push(amount);
		});
		
		$.ajax({
			url : "/admin/updateAmount",
			type : "post",
			data : {
				mgNum : mgNum,
				mgAmount : mgAmount
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(){
				alert("재고변경됨.");
				location.href = "/admin/goodsList";
			},
			error : function(){
				alert("error");	
			}
		});
		
	}
});

$('#updatePrice').on("click", function(){
	var confirm_val = confirm("해당 상품들의 가격을 변경하시겠습니까?");
	
	if(confirm_val){
		
		var mgNum = new Array();
		var mgPrice = new Array();
		var checkBox = $("input[name='chk']:checked");
		
		$(checkBox).each(function(i){
			mgNum.push($(this).attr("data-goodsId"));
			var tr = checkBox.parent().parent().parent().eq(i);
			var td = tr.children();
			var price = td.eq(4).children().val();
			mgPrice.push(price);
		});
		
		$.ajax({
			url : "/admin/updatePrice",
			type : "post",
			data : {
				mgNum : mgNum,
				mgPrice : mgPrice
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(){
				alert("가격변경됨.");
				location.href = "/admin/goodsList";
			},
			error : function(){
				alert("error");	
			}
		});
		
	}
});
</script>
</body>
</html>