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
<title>Admin Page</title>
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
<style>
/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 20%;
  height: 100%;
}
/* Style the buttons that are used to open the tab content */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
}
/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 80%;
  border-left: none;
  height: 100%;
}
</style>
</head>
<body>

<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<div style = "height : 1000px">

<div class = "tab">
	<button id = "defaultOpen" class = "tablinks" onclick = "openCity(event, 'member')">회원관리</button>
	<button class = "tablinks" onclick = "openCity(event, 'goods')">상품관리</button>
	<button class = "tablinks" onclick = "openCity(event, 'notice')">공지사항</button>
	<button class = "tablinks" onclick = "openCity(event, 'Seoul')">Seoul</button>
</div>

<div id = "member" class = "tabcontent">

<h1 class = "text-center mt-4">Member List</h1>
<hr/>

<!-- MemberList -->
<div class = "container mb-3">
<button class = "btn btn-primary btn-sm" id = "updateAuth">권한변경하기</button>
<button class = "btn btn-primary btn-sm" id = "updateAuth2">ROW DATA 출력</button>
	<form role = "form" method = "post">				
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
		<table class = "table table-bordered table-striped table-hover">
			<thead class = "black white-text text-center">
				<tr>
					<th>
						<div class = "custom-control custom-checkbox allcheck">
							<input type = "checkbox" class = "custom-control-input allcheck" id = "allcheck">
							<label class = "custom-control-label" for = "allcheck"></label>
						</div>
					</th>
					<th>ID</th>
					<th>NAME</th>
					<th>EMAIL</th>
					<th>PHONE</th>
					<th>권한</th>				
					<th>가입일</th>
				</tr>
			</thead>
			<tbody class = "text-center">
				<c:forEach var = "member" items = "${memberList}" varStatus = "status">
				<tr id = "memberTR">
					<td scope = "row">
						<div class = "custom-control custom-checkbox">
							<input type = "checkbox" class = "custom-control-input chk" name = "chk" id = "${member.mId}" data-memberId="${member.mId}">
							<label class = "custom-control-label" for = "${member.mId}"></label>
						</div>
					</td>
					<td>
						<a href="/member/memberDetail?mId=${member.mId}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${member.mId}"/></a>
					</td>
					<td>${member.mName}</td>
					<td>${member.mEmail}</td>
					<td>${member.mPhone}</td>
					<td>
						<select name ="authority" id = "authority${status.index}" onchange= "select(${status.index})">
							<option value = "${member.authority}">${member.authority}</option>
							<option value = "USER">USER</option>
							<option value = "MANAGER">MANAGER</option>
						</select>
					</td>			
					<td>${member.regDate}</td>			
				</tr>
				</c:forEach>
			</tbody> 
		</table>
		
		<div id = "result"></div><br/>
		<div id = "result2"></div>
		
		<!-- pagination -->
		<div style = "height : 50px;">
	  		<ul class = "pagination pg-blue justify-content-center">
	    		<c:if test="${pageMaker.prev}">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="admin${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
	    		</c:if> 
	
	    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="admin${pageMaker.makeSearch(idx)}">${idx}</a></li>
	    		</c:forEach>
	
	    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    			<li style = "list-style : none; float : left; padding : 6px;"><a href="admin${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
	    		</c:if> 
	  		</ul>
		</div>
		
		<!-- search -->
		<div class="search row justify-content-center">
			
		    <select name="searchType">
		      	<option value="tnmpar"<c:out value="${scri.searchType eq 'tnmpar' ? 'selected' : ''}"/>>통합검색</option>
		     	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>ID</option>
		      	<option value="c"<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>EMAIL</option>	     
		    </select>
			
		    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		
		    <button id="searchBtn" type="button"><i class="fas fa-search" aria-hidden="true"></i></button>
		   				
  		</div>
  
	</form>
</div>
</div>


<div id = "goods" class = "tabcontent">
<h1 class = "text-center mt-4">상품관리</h1>
<hr/>
</div>

<div id = "notice" class = "tabcontent">
<h1 class = "text-center mt-4">공지사항</h1>
<hr/>
</div>

<div id = "Seoul" class = "tabcontent">
<h1>Seoul</h1>
</div>

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
function openCity(evt, cityName) {
	  // Declare all variables
	  var i, tabcontent, tablinks;

	  // Get all elements with class="tabcontent" and hide them
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }

	  // Get all elements with class="tablinks" and remove the class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }

	  // Show the current tab, and add an "active" class to the link that opened the tab
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
}

//Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

<script>
$(function(){
	$('#searchBtn').click(function() {
		self.location = "admin" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
});   
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

var selectValue;

function select(index){
	
	selectValue = $("#authority" + index + " option:selected").val();
	console.log(selectValue);	
}

$('#updateAuth').click(function(){
	var confirm_val = confirm("회원 권한 변경하시겠습니까?");
			
	if(confirm_val){
		
		var tdArr = new Array();
		var tdArr2 = new Array();
		var checkBox = $("input[name='chk']:checked");
				
		$(checkBox).each(function(i){			
			tdArr.push($(this).attr("data-memberId"));
			var tr = checkBox.parent().parent().parent().eq(i);
			var td = tr.children();
			var authority = td.eq(5).children().val();
			tdArr2.push(authority);
		});
		
		$.ajax({
			url : "/admin/updateAuth",
			type : "post",
			data : {
				id : tdArr,
				auth : tdArr2
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(){
				console.log("success");
				location.href = "/admin/admin";
			},
			error : function(){
				alert("error");	
			}
		});
	}
});

</script>

<script>

$('#updateAuth2').click(function(){
	
	var rowData = new Array();
	var tdArr = new Array();
	var checkBox = $("input[name='chk']:checked");
	
	checkBox.each(function(i){
		var tr = checkBox.parent().parent().parent().eq(i); // checkbox의 부모 div -> td -> tr
		var td = tr.children();
		
		rowData.push(tr.text()); // 체크된 모든 ROW 데이터
		
		var id = td.eq(1).text()+", ";
		var name = td.eq(2).text()+", ";
		var email = td.eq(3).text()+", ";
		var phone = td.eq(4).text()+", ";
		var authority = td.eq(5).text()+", ";
		
		tdArr.push(id);
		tdArr.push(name);
		tdArr.push(email);
		tdArr.push(phone);
		tdArr.push(authority);
	});
	
	$("#result").html("체크된 모든 ROW 데이터 : " + rowData);
	$('#result2').html(tdArr);
});

</script>

</body>
</html>