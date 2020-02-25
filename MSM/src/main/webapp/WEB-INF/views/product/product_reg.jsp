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
<title>상품등록 -- MSM</title>
<style>
body {
 	padding-top:30px;
 	
}
h2{
	text-align:center;
}
.select_img img {
	margin:20px 0;
}
</style>
<link rel="shortcut icon" href="/resources/images/logo.ico">
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


<article>
	<div class="container" role="main">
		<h2>상품등록</h2>
		<hr/>
		<form name="form" id="form" role="form" method="post" action="/product/register" enctype = "multipart/form-data" autocomplete="off">
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		
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
				<input type="text" class="form-control" name="mgName" id="mgName" placeholder="상품명을 입력하세요" required>
			</div>
			<div class="mb-3">
				<label for="mgPrice"><strong>가격</strong></label>
				<input type="text" class="form-control"name="mgPrice" id="mgPrice" placeholder="가격을 입력해주세요" required>
			</div>
				<div class="mb-3">
				<label for="mgStock"><strong>수량</strong></label>
				<input type="text" class="form-control"name="mgStock" id="mgStock" placeholder="수량을 입력해주세요" required>
			</div>	
			<div class="inputArea">
 			<label for="gdsImg">이미지</label>
 			<input type="file" id="mgImg" name="file" />
 			<div class="select_img"><img src="" /></div>
 			
 			</div>
 			
			
			<div class="mb-3">
				<label for="mgContent"><strong>내용</strong></label>			
				<textarea class="form-control" cols="80" rows="10" name="mgContent" id="mgContent" placeholder="내용을 입력해주세요" required></textarea>
				<script type="text/javascript">
				
				CKEDITOR.replace('mgContent',{
					filebrowserUploadUrl:"/product/ckUpload"
							
				});			
				</script>
			</div>
			
			
				
			<div>
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">상품등록</button>
				<button type="button" class="btn btn-sm btn-info" id="btnList" onclick = "history.go(-1)">목록</button>
			</div>
		</form>
	</div>
</article><br/><br/>
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
$(document).ready(function() {
	
	$("#mgImg").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(500);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
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
	
});
</script>

<script>
function openNav() {
	  document.getElementById("mySidenav").style.width = "30vw";
	}
function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
new WOW().init();
</script>

</body>
</html>