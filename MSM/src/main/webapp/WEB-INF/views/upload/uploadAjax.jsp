<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta id = "_csrf" name = "_csrf" content = "${_csrf.token}" />
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
<style>
.fileDrop {
	width : 600px;
	height : 200px;
	border : 1px solid blue;
}

</style>
<body>

<%@ include file = "/WEB-INF/views/ETC/test.jsp" %>
<h2>Ajax File Upload</h2>
<hr/>
<div class = "fileDrop"></div>
<div class = "uploadedList"></div>

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
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;
		//드래그된 파일의 정보  *originalEvent : 자바스크립트 이벤트 *event : 제이쿼리의 이벤트		
		var file = files[0]; //첫번째 파일
		console.log(file); // 콘솔로 파일 확인
		
		var formData = new FormData();
		// ajax로 전달할 폼 객체
		formData.append("file", file);
		// 폼 객체에 파일 추가
		
		$.ajax({
			type : "post",
			url : "/upload/uploadAjax",
			data : formData,
			dataType : "text",
			processData : false,
			/*processData : true (Get 방식), false (Post 방식)*/
			contentType : false,
			/*contentType : true (application/x-www-form-urlencoded), false (multipart/form-data)*/
			success : function(data){
				var str = "";
				//이미지파일이면 썸네일 이미지 출력
				if(checkImageType(data)){
					str = "<div><a href = '${path}/upload/displayFile?fileName="+getImageLink(data)+"'>";
					str += "<img src = '${path}/upload/displayFile?fileName="+data+"'></a>";
				}
				//일반파일이면 다운로드링크
				else {
					str = "<div><a href='${path}/upload/displayFile?fileName="+encodeURI(data)+"'>"+getOriginalName(data)+"</a>";
				}
				//삭제버튼
				str += "<span data-src="+data+">[삭제]</span></div>";
				$(".uploadedList").append(str);
			}
		});
	});
	
	/*이미지 삭제*/
	$(".uploadedList").on("click", "span", function(event){
		alert("이미지 삭제");
		var that = $(this); // 여기서 this는 클릭한 span 태그.
		$.ajax({
			url : "/upload/deleteFile",	
			type : "POST",
			data : {fileName : $(this).attr("data-src")}, //json방식
			dataType : "text",
			success : function(result){
				if(result == "deleted"){
					//클릭한 span태그가 속한 div를 제거
					that.parent("div").remove();
				}
			}
		});
	});
});
// 파일관련스크립트

// 원본파일이름을 목록에 출력함
function getOriginalName(fileName){
	//이미지파일이면
	if(checkImageType(fileName)){
		return;
	}
	//uuid를 제외한 원래 파일 이름을 리턴
	var idx = fileName.indexOf("_")+1;
	return fileName.substr(idx);
}

// 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
function getImageLink(fileName){
	//이미지파일이 아니면
	if(!checkImageType(fileName)){
		return; // 함수 종료
	}
	// 이미지 파일이면 (썸네일이 아닌 원본이미지를 가져오기 위해)
	// 썸네일 이미지 파일명 - 파일경로 + 파일명 /2020/01/28/s_.....jpg
	var front = fileName.substr(0, 12); // 년원일 경로 추출
	var end = fileName.substr(14); // 년월일 경로와 s_를 제거한 원본 파일명을 추출
	console.log(front);
	console.log(end);
	return front+end; // 디렉토리를 포함한 원본파일명을 리턴
}

// 이미지파일 형식을 체크하기 위해
function checkImageType(fileName){
	// i : ignore case (대소문자 무관)
	var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
	return fileName.match(pattern); // 규칙이 맞으면 true
}
</script>


<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
</body>
</html>