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


<h1 class = "text-center mt-4">Delivery Info</h1>
<hr/>
<hr/>

<!-- Delivery Info -->
<div class = "container-fluid mb-3">
<div class = "text-right">
	<a type = "button" class = "btn btn-success" href = "/admin/admin">
	<i class="fas fa-home"></i>&nbsp;&nbsp;ADMIN HOME</a>
	
	<a type = "button" class = "btn btn-primary" id = "updateAuth">
	<i class="fas fa-exchange-alt"></i>&nbsp;&nbsp;배송상태변경</a>
</div>
	<form role = "form" method = "post">				
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<table class = "table table-bordered table-striped table-hover" id = "deliveryInfo">
			<thead class = "black white-text text-center">
				<tr>
					<th>
						<div class = "custom-control custom-checkbox allcheck">
							<input type = "checkbox" class = "custom-control-input allcheck" id = "allcheck">
							<label class = "custom-control-label" for = "allcheck"></label>
						</div>
					</th>
					<th>회원 ID</th>
					<th>주문상품명</th>
					<th>우편번호</th>
					<th>도로명주소</th>
					<th>상세주소</th>				
					<th>결제날짜</th>
					<th>배송상태</th>
				</tr>
			</thead>
			<tbody class = "text-center">
				<c:forEach var = "order" items = "${orderInfo}" varStatus = "status">
				<tr id = "memberTR">
					<td scope = "row">
						<div class = "custom-control custom-checkbox">
							<input type = "checkbox" class = "custom-control-input chk" name = "chk" id = "${order.orderNum}" data-orderId="${order.orderNum}">
							<label class = "custom-control-label" for = "${order.orderNum}"></label>
						</div>
					</td>
					<td style = "font-size : 12px;">${order.mId}</td>
					<td style = "font-size : 12px;">${order.orderProductName}</td>
					<td style = "font-size : 12px;">${order.orderAddr1}</td>
					<td style = "font-size : 12px;">${order.orderAddr2}</td>
					<td style = "font-size : 12px;">${order.orderAddr3}</td>
					<td style = "font-size : 12px;"><fmt:formatDate value="${order.orderDate}" pattern="yyyy.MM.dd HH:MM"/></td>
					<td style = "font-size : 12px;">
						<select name ="orderState" id = "orderState${status.index}">
							<option value = "${order.orderState}">${order.orderState}</option>
							<option value = "배송준비">배송준비</option>
							<option value = "배송완료">배송완료</option>
						</select>
					</td>						
				</tr>
				</c:forEach>
			</tbody> 
		</table>
		
		<!-- pagination -->
		<div style = "height : 50px;">
	  		<ul class = "pagination pg-blue justify-content-center">
	    		<c:if test="${pageMaker.prev}">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="delivery${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
	    		</c:if> 
	
	    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="delivery${pageMaker.makeSearch(idx)}">${idx}</a></li>
	    		</c:forEach>
	
	    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="delivery${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
	    		</c:if> 
	  		</ul>
		</div>
		
		<!-- search -->
		<div class="search row justify-content-center">
			
		    <select name="searchType">
		      	<option value="tnm"<c:out value="${scri.searchType eq 'tnmpar' ? 'selected' : ''}"/>>통합검색</option>
		     	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>ID</option>
		      	<option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>상품명</option>	     
		      	<option value="m"<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>배송상태</option>
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
$(function(){
	$('#searchBtn').click(function() {
		self.location = "admin" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
});

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

$('#updateAuth').click(function(){
	var confirm_val = confirm("배송 처리 변경하시겠습니까?");
			
	if(confirm_val){
		
		var tdArr = new Array();
		var tdArr2 = new Array();
		var checkBox = $("input[name='chk']:checked");
				
		$(checkBox).each(function(i){			
			tdArr.push($(this).attr("data-orderId"));
			var tr = checkBox.parent().parent().parent().eq(i);
			var td = tr.children();
			var authority = td.eq(7).children().val();
			tdArr2.push(authority);
		});
		
		$.ajax({
			url : "/admin/updateDeliveryInfo",
			type : "post",
			data : {
				orderNum : tdArr,
				orderState : tdArr2
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(){
				alert("배송 처리 완료");
				location.href = "/admin/delivery";
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