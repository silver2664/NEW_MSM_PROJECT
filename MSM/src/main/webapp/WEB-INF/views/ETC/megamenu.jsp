<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Material Design Bootstrap</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
<style type="text/css">
html, body, header, .carousel {
	height: 60vh;
}

@media ( max-width : 740px) {
	html, body, header, .carousel {
		height: 100vh;
	}
}

@media ( min-width : 800px) and (max-width: 850px) {
	html, body, header, .carousel {
		height: 100vh;
	}
}

.view, body, html {
	height: 100%
}

.carousel {
	height: 50%
}

.carousel .carousel-inner, .carousel .carousel-inner .active, .carousel .carousel-inner .carousel-item
	{
	height: 100%
}

@media ( max-width :776px) {
	.carousel {
		height: 100%
	}
}

.page-footer {
	background-color: #5e35b1
}

.mega-dropdown {
	position : static;
}
.mega-menu {
	position : absolute;
	width : 100%;
	left : 0;
	right : 0;
	padding : 5px;
}
.menu-item {
	padding : 5px 0;
}
.sub-title {
	font-family : BigNoodle;
}
</style>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark special-color-dark">

  <!-- Navbar brand -->
  <a class="navbar-brand text-uppercase" href="#">Navbar</a>

  <!-- Collapse button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent2"
    aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Collapsible content -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent2">

    <!-- Links -->
    <ul class="navbar-nav mr-auto">

      <!-- Features -->
      <li class="nav-item dropdown mega-dropdown active">
        <a class="nav-link dropdown-toggle text-uppercase" id="navbarDropdownMenuLink2" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">Features
          <span class="sr-only">(current)</span>
        </a>
        <div class="dropdown-menu mega-menu v-2 z-depth-1 special-color py-5 px-3"
          aria-labelledby="navbarDropdownMenuLink2">
          <div class="row">
            <div class="col-md-6 col-xl-3 sub-menu mb-xl-0 mb-4">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Featured</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Lorem ipsum dolor sit amet
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Consectetur adipiscing elit
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Sed do eiusmod tempor incididunt
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Ut labore et dolore magna
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Ut enim ad minim veniam
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-md-6 col-xl-3 sub-menu mb-xl-0 mb-4">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Related</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Quis nostrud exercitation
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Duis aute irure dolor in
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Laboris nisi ut aliquip ex ea commodo consequat
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Reprehenderit in voluptate
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Esse cillum dolore eu fugiat nulla pariatur
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-md-6 col-xl-3 sub-menu mb-md-0 mb-xl-0 mb-4">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Design</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Excepteur sint occaecat
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Sunt in culpa qui officia
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Sed ut perspiciatis unde omnis iste natus error
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Mollit anim id est laborum
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Accusantium doloremque laudantium
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-md-6 col-xl-3 sub-menu mb-0">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Programming</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Totam rem aperiam eaque
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Beatae vitae dicta sun
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Quae ab illo inventore veritatis et quasi
                    architecto
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Nemo enim ipsam voluptatem
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Neque porro quisquam est
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </li>
      <!-- Technology -->
      <li class="nav-item dropdown mega-dropdown">
        <a class="nav-link dropdown-toggle text-uppercase" id="navbarDropdownMenuLink3" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">Technology</a>
        <div class="dropdown-menu mega-menu v-2 z-depth-1 special-color py-5 px-3"
          aria-labelledby="navbarDropdownMenuLink3">
          <div class="row">
            <div class="col-md-12 col-xl-4 sub-menu mb-xl-0 mb-4">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Featured</h6>
              <!--Featured image-->
              <a href="#!" class="view overlay z-depth-1 p-0 mb-2">
                <img src="https://mdbootstrap.com/img/Photos/Horizontal/Work/8-col/img%20(37).jpg"
                  class="img-fluid" alt="First sample image">                
              </a>
              
              
            </div>
            <div class="col-md-6 col-xl-4 sub-menu mb-md-0 mb-4">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Related</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Quis nostrud exercitation
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Duis aute irure dolor in
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Laboris nisi ut aliquip ex ea commodo consequat
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Reprehenderit in voluptate
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Esse cillum dolore eu fugiat nulla pariatur
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-md-6 col-xl-4 sub-menu mb-0">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Design</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Excepteur sint occaecat
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Sunt in culpa qui officia
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Sed ut perspiciatis unde omnis iste natus error
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Mollit anim id est laborum
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Accusantium doloremque laudantium
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </li>
      <!-- Lifestyle -->
      <li class="nav-item dropdown mega-dropdown">
        <a class="nav-link dropdown-toggle text-uppercase" id="navbarDropdownMenuLink4" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">Lifestyle</a>
        <div class="dropdown-menu mega-menu v-2 z-depth-1 special-color py-5 px-3"
          aria-labelledby="navbarDropdownMenuLink4">
          <div class="row">
            <div class="col-md-6 col-xl-3 sub-menu mb-4">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Featured</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Lorem ipsum dolor sit amet
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Consectetur adipiscing elit
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Sed do eiusmod tempor incididunt
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Ut labore et dolore magna
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Ut enim ad minim veniam
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-md-6 col-xl-3 sub-menu mb-4 mb-xl-0">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Related</h6>
              <!--Featured image-->
              <a href="#!" class="view overlay z-depth-1 p-0 mb-2">
                <img src="https://mdbootstrap.com/img/Photos/Horizontal/Work/6-col/img%20(43).jpg"
                  class="img-fluid" alt="First sample image">
                <div class="mask rgba-white-slight"></div>
              </a>
              <a class="news-title font-weight-bold pl-0" href="#!">Lorem ipsum dolor sit</a>
              <p class="font-small text-uppercase white-text">
                <i class="fas fa-clock-o pr-2" aria-hidden="true"></i>July 17, 2017 / <i
                  class="far fa-comments px-1" aria-hidden="true"></i> 20
              </p>
            </div>
            <div class="col-md-6 col-xl-3 sub-menu mb-md-0 mb-xl-0 mb-4">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Design</h6>
              <!--Featured image-->
              <a href="#!" class="view overlay z-depth-1 p-0 mb-2">
                <img src="https://mdbootstrap.com/img/Photos/Horizontal/Work/6-col/img%20(44).jpg"
                  class="img-fluid" alt="First sample image">
                <div class="mask rgba-white-slight"></div>
              </a>
              <a class="news-title font-weight-bold pl-0" href="#!">Ut labore et dolore magna</a>
              <p class="font-small text-uppercase white-text">
                <i class="fas fa-clock-o pr-2" aria-hidden="true"></i>July 16, 2017 / <i
                  class="far fa-comments px-1" aria-hidden="true"></i> 25
              </p>
            </div>
            <div class="col-md-6 col-xl-3 sub-menu mb-0">
              <h6 class="sub-title text-uppercase font-weight-bold white-text">Programming</h6>
              <ul class="list-unstyled">
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Totam rem aperiam eaque
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Beatae vitae dicta sun
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Quae ab illo inventore veritatis et quasi
                    architecto
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Nemo enim ipsam voluptatem
                  </a>
                </li>
                <li>
                  <a class="menu-item pl-0" href="#!">
                    <i class="fas fa-caret-right pl-1 pr-3"></i>Neque porro quisquam est
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </li>

    </ul>
    <!-- Links -->

    <!-- Search form -->
    <form class="form-inline">
      <div class="md-form my-0">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      </div>
    </form>

  </div>
  <!-- Collapsible content -->

</nav>
<!-- Navbar -->
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