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
<title>CONTACT --MSM</title>
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
        .map-container-section {
          overflow:hidden;
          padding-bottom:56.25%;
          position:relative;
          height:0;
        }
        .map-container-section iframe {
          left:0;
          top:0;
          height:100%;
          width:100%;
          position:absolute;
        }
 #myModal {
 z-index:1044; 
}
</style>

</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
  
  
  <div class="container mt-5">

 
    <!--Section: Content-->
    <section class="dark-grey-text mb-5">
      
      
      <!-- Section heading -->
      <h3 class="font-weight-bold text-center mb-4">Contact Us</h3>
      <!-- Section description -->
      <p class="text-center w-responsive mx-auto pb-5">MSM -- 악세사리 전문 쇼핑몰</p>

      <!-- Grid row -->
      <div class="row">

        <!-- Grid column -->
        <div class="col-lg-5 mb-lg-0 pb-lg-3 mb-4">

          <!-- Form with header -->
          <div class="card">
            <div class="card-body">
              <!-- Header -->
              <div class="form-header blue accent-1">
                <h3 class="mt-2"><i class="fas fa-envelope"></i> Write to us:</h3>
              </div>
              <p class="dark-grey-text">We'll write rarely, but only the best content.</p>
              <!-- Body -->
              <div class="md-form">
                <i class="fas fa-user prefix grey-text"></i>
                <input type="text" id="form-name" class="form-control">
                <label for="form-name">Your name</label>
              </div>
              <div class="md-form">
                <i class="fas fa-envelope prefix grey-text"></i>
                <input type="text" id="form-email" class="form-control">
                <label for="form-email">Your email</label>
              </div>
              <div class="md-form">
                <i class="fas fa-tag prefix grey-text"></i>
                <input type="text" id="form-Subject" class="form-control">
                <label for="form-Subject">Subject</label>
              </div>
              <div class="md-form">
                <i class="fas fa-pencil-alt prefix grey-text"></i>
                <textarea id="form-text" class="form-control md-textarea" rows="3"></textarea>
                <label for="form-text">Send message</label>
              </div>
              <div class="text-center">
                <button class="btn btn-light-blue">Submit</button>
              </div>
            </div>
          </div>
          <!-- Form with header -->

        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-lg-7">

          <!--Google map-->
          <div id="map-container-section" class="z-depth-1-half map-container-section mb-4" style="height: 400px">
            <iframe src="https://maps.google.com/maps?q=Seoul&t=&z=15&ie=UTF8&iwloc=&output=embed" frameborder="0"
              style="border:0" allowfullscreen></iframe>
          </div>
          <!-- Buttons-->
          <div class="row text-center">
            <div class="col-md-4">
              <a class="btn-floating blue accent-1">
                <i class="fas fa-map-marker-alt"></i>
              </a>
              <p>서울시 </p>
              <p class="mb-md-0"></p>
            </div>
            <div class="col-md-4">
              <a class="btn-floating blue accent-1">
                <i class="fas fa-phone"></i>
              </a>
              <p>+ 01 234 567 89</p>
              <p class="mb-md-0">Mon - Fri, 9:00-18:00</p>
            </div>
            <div class="col-md-4">
              <a class="btn-floating blue accent-1">
                <i class="fas fa-envelope"></i>
              </a>
              <p>msm@gmail.com</p>
              <p class="mb-0">msm@gmail.com</p>
            </div>
          </div>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row -->

    </section>
    <!--Section: Content-->
    </div>


  <div class="modal fade" id="myModal" role="dialog">
  	<div class="modal-dialog">
  		<div class="modal-content">
  			<div class="modal-header">
  				
  				<h4 class="modal-title">Modal Header</h4>  				
  			</div>
  			<div class="modal-body">
  				<p>Some text in the modal.</p>
  			</div>
  			<div class="modal-footer">
  				<button type="button" class="btn btn-default" data-dismiss="modal"> Close</button>
  			</div>
  		</div>
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

</body>
</html>