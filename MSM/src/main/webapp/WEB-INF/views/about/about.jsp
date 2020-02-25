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
<title>ABOUT --MSM</title>
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
<div class="container pt-5 my-5 z-depth-1">
  <section class="p-md-3 mx-md-5 text-center text-lg-left">
    <h2 class="text-center mx-auto font-weight-bold mb-4 pb-2">팀소개</h2>
    <div class="row d-flex justify-content-center">
    <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
        <div class="p-4">          
          <div class="text-center mt-3">
            <h6 class="font-weight-bold pt-2">FRONT-END</h6>
            <p class="text-muted">
              <small>
                <i><Strong>HTML5,CSS3,JSVASCRIPT</Strong><br>
                   <strong>Framework</strong> <br> Bootstrap4,Jquery,AngularJS<br>
                   <strong>HTML5 API</strong> <br> geoloaction,webStorage,webWorker,SSE<br>
                   <Strong>Utill API </Strong><br> chartJS,ckedior</i>
               </small>
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
        <div class="p-4">          
          <div class="text-center mt-3">
            <h6 class="font-weight-bold pt-2">BACK-END</h6>
            <p class="text-muted">
              <small>
                <i><strong>JAVA,Servlet,JSP</strong><br>
                <strong>Framework</strong><br>
                SpringFramework4</i>
               </small>
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
        <div class="p-4">          
          <div class="text-center mt-3">
            <h6 class="font-weight-bold pt-2">DATABASE</h6>
            <p class="text-muted">
              <small>
                <i><strong>Oracle 11g</strong><br>
                <strong>API</strong><br>
                JDBC/DBCP/JDBCTemplate Transaction/<br>
                <strong>Framework</strong><br>
                myBatis </i>
               </small>
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
        <div class="p-4">
          <div class="avatar w-100 white d-flex justify-content-center align-items-center">
            <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg"  class="img-fluid rounded-circle z-depth-1"/>
          </div>
          <div class="text-center mt-3">
            <h6 class="font-weight-bold pt-2">이용제</h6>
            <p class="text-muted">
              <small>
              	<i>회원가입,이메일인증,로그인,스프링 시큐리티,CSS,관리자 페이지</i>
              </small>
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
        <div class="p-4">
          <div class="avatar w-100 white d-flex justify-content-center align-items-center">
            <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(32).jpg"class="img-fluid rounded-circle z-depth-1"/>
          </div>
          <div class="text-center mt-3">
            <h6 class="font-weight-bold pt-2">민지홍</h6>
            <p class="text-muted">
              <small>
              	<i>공지사항,Q&A,상품,ORDER</i>
              </small>
            </p>
          </div>
        </div>
      </div>
     
      
      
     
      
    </div>
  </section>
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
</body>
</html>