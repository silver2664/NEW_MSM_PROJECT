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
<title>상품 수정 -- MSM</title>
<style>
body {
 	padding-top:70px;
 	padding-bottpm:30px;
}
h2{
	text-align:center;
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
<!-- Ck Editor -->
<script src="/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<article class="mb-5">
	<div class="container">
		<h2> 상품  수정</h2>
		<hr/>
		<form name="form" id="form"  method="post" action="/product/productModify" enctype="multipart/form-data" >
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<input type="hidden" id="mgNum" name="mgNum" value="${mo.mgNum}" readonly="readonly">
		<label>1차분류</label>
			<select class="category1">
				<option value="">브랜드</option>
			</select>
			<label>2차 분류</label>
			<select class="category2" name ="cateCode">
				<option value="">전체</option>
			</select>
			<div class="mb-3">
				<label for="mgName"><strong>상품명</strong></label>
				<input type="text" class="form-control" name="mgName" id="mgName" value="${mo.mgName}" required>
			</div>
			
			<div class="mb-3">
				<label for="mgPrice"><strong>가격</strong></label>
				<input type="text" class="form-control" name="mgPrice" id="mgPrice" value="${mo.mgPrice}">
			</div>
			<div class="mb-3">
				<label for="mgStock"><strong>수량</strong></label>
				<input type="text" class="form-control" name="mgStock" id="mgStock" value="${mo.mgStock}">
			</div>
			<div class="inputArea">
 			<label for="gdsImg">이미지</label>
 			<input type="hidden" name="mgImg" value="${mo.mgImg}">
 			<input type="file" id="mgImg" name="file"  />
 			<div class="select_img"><img src="" /></div>
 			
 			</div>
			
			<div class="mb-3">
				<label for="content"><strong>내용</strong></label>			
				<textarea class="form-control" cols="80" rows="10" name="mgContent" id="mgContent"  required>${mo.mgContent}</textarea>
				<script type="text/javascript">
				editor = CKEDITOR.replace('mgContent');
				editor.on( 'required', function( evt ) {
				    alert( '내용을 입력하세요' );		
				  

				    evt.cancel();
				} );
				</script>			
				<button type="submit" class="btn btn-sm btn-primary"  id="modify">수정</button>
				<button type="button" class="btn btn-sm btn-info"  id="btnList">목록</button>
			</div>
		</form>
	</div>
</article>
		

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


$(document).ready(function() {
	
	
	$("#btnList").click(function(e) {
		e.preventDefault();
		location.href="listView";
	});
	
	
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	 
	 if(jsonData[i].level == "1") {
	  cate1Obj = new Object();  //초기화
	  cate1Obj.cateCode = jsonData[i].cateCode;
	  cate1Obj.cateName = jsonData[i].cateName;
	  cate1Arr.push(cate1Obj);
	 }
	}

	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")

	for(var i = 0; i < cate1Arr.length; i++) {
	 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
	      + cate1Arr[i].cateName + "</option>"); 
	}

	$(document).on("change", "select.category1", function(){

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].level == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.cateCode = jsonData[i].cateCode;
		   cate2Obj.cateName = jsonData[i].cateName;
		   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
		   
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		 var cate2Select = $("select.category2");

		/* for(var i = 0; i < cate2Arr.length; i++) {
		   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		        + cate2Arr[i].cateName + "</option>");
		 } */
		 cate2Select.children().remove();
		 $("option:selected",this).each(function(){
			 var selectVal = $(this).val();  
			  cate2Select.append("<option value='"+selectVal+ "'>전체</option>");
			  
			  for(var i = 0; i < cate2Arr.length; i++) {
			   if(selectVal == cate2Arr[i].cateCodeRef) {
			    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
			         + cate2Arr[i].cateName + "</option>");
			   }
			  }
		 });
		});
	
	var select_cateCode = '${mo.cateCode}';
	var select_cateCodeRef = '${mo.cateCodeRef}';
	var select_cateName = '${mo.cateName}';
	
	console.log("select_cateCode = " + select_cateCode);
	console.log("select_cateCodeRef = " + select_cateCodeRef);


	
	if(select_cateCodeRef != null && select_cateCodeRef != '') {
	 $(".category1").val(select_cateCodeRef);
	 $(".category2").val(select_cateCode);
	 $(".category2").children().remove();
	 $(".category2").append("<option value='"
	       + select_cateCode + "'>" + select_cateName + "</option>");
	} else {
	 $(".category1").val(select_cateCode);
	 //$(".category2").val(select_cateCode);
	 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
	 $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
	}
	
});
</script>
</body>
</html>