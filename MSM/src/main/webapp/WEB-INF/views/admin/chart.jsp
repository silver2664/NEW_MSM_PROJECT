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
<title>Sales Page</title>
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


<!--  -->

<div class = "container-fluid mt-5">
	<div class = "card mb-4 wow fadeIn">
		<div class = "card-body d-sm-flex justify-content-between">
			<h4 class = "mb-2 mb-sm-0 pt-1">
				<a href = "/admin/admin">ADMIN HOME</a>
				<span>/</span>
				<span>DashBoard</span>
			</h4>
			<form class="d-flex justify-content-center">
            	<!-- Default input -->
            	<input type="search" placeholder="Type your query" aria-label="Search" class="form-control">
            	<button class="btn btn-primary btn-sm my-0 p" type="submit">
              	<i class="fa fa-search"></i>
              	</button>
          </form>
		</div>
	</div>
	
	<br/><br/>
	
	<div class ="row">
		<div class = "col-md-6 col-lg-3 mb-4">
			<div class = "card primary-color white-text">
				<div class = "card-body d-flex justify-content-between align-items-center">
					<div>
						<p class = "h2-responsive font-weight-bold mt-n2 mb-0">New <br/>Order</p>
					</div>
					<div>
						<i class="fas fa-shopping-bag fa-4x text-black-40"></i>
					</div>
				</div>
				<a class = "card-footer footer-hover small text-center white-text border-0 p-2" href = "/admin/delivery">
					More Info<i class="fas fa-arrow-circle-right pl-2"></i></a>
			</div>
		</div>
		
		<div class = "col-md-6 col-lg-3 mb-4">
			<div class = "card warning-color white-text">
				<div class = "card-body d-flex justify-content-between align-items-center">
					<div>
						<p class = "h2-responsive font-weight-bold mt-n2 mb-0">Chart <br/>Infomation</p>
					</div>
					<div>
						<i class="fas fa-chart-bar fa-4x text-black-40"></i>
					</div>
				</div>
				<a class = "card-footer footer-hover small text-center white-text border-0 p-2" href = "#">
					More Info<i class="fas fa-arrow-circle-right pl-2"></i></a>
			</div>
		</div>
		
		<div class = "col-md-6 col-lg-3 mb-4">
			<div class = "card light-blue lighten-1 white-text">
				<div class = "card-body d-flex justify-content-between align-items-center">
					<div>
						<p class = "h2-responsive font-weight-bold mt-n2 mb-0">User <br/>Registrations</p>
					</div>
					<div>
						 <i class="fas fa-user-plus fa-4x text-black-40"></i>
					</div>
				</div>
				<a class = "card-footer footer-hover small text-center white-text border-0 p-2" href = "/admin/memberList">
					More Info<i class="fas fa-arrow-circle-right pl-2"></i></a>
			</div>
		</div>
		
		<div class = "col-md-6 col-lg-3 mb-4">
			<div class = "card red accent-2 white-text">
				<div class = "card-body d-flex justify-content-between align-items-center">
					<div>
						<p class = "h2-responsive font-weight-bold mt-n2 mb-0">Unique <br/>Visitors</p>
					</div>
					<div>
						 <i class="fas fa-chart-pie fa-4x text-black-40"></i>
					</div>
				</div>
				<a class = "card-footer footer-hover small text-center white-text border-0 p-2" href = "#">
					More Info<i class="fas fa-arrow-circle-right pl-2"></i></a>
			</div>
		</div>		
	</div>
	
	<br/><br/>	
	
	<div class = "row wow fadeIn">
	
		<div class = "col-md-6 mb-4">
			<div class = "row">
				<div class = "col-lg-4 col-md-12 mb-4 mt-5">				
					<div class = "card mt-3">
						<div class = "">
							<i class="far fa-money-bill-alt fa-lg primary-color z-depth-2 p-4 ml-3 mt-n3 rounded text-white"></i>
							<div class = "float-right text-right p-3">
								<p class = "text-uppercase text-muted mb-1"><small>sales</small></p>
								<h6 class="font-weight-bold mb-0">
									<fmt:setLocale value="ko_KR" /><fmt:formatNumber type="currency" value="${map.price}"/>
								</h6>
							</div>							
						</div>
						
						<div class = "card-body pt-0" style = "margin-top : 12px;">
							<div class = "progress md-progress">
								<div class = "progress-bar bg-success" role = "progressbar" style = "width : 75%"></div>
							</div>
						</div>	
					</div>
				</div>
				
				<div class = "col-lg-4 col-md-12 mb-4 mt-5">
					<div class = "card mt-3">
						<div class = "">
							<i class="fas fa-chart-line fa-lg teal z-depth-2 p-4 ml-3 mt-n3 rounded text-white"></i>
							<div class = "float-right text-right p-3">
								<p class = "text-uppercase text-muted mb-1"><small>order</small></p>
								<h4 class="font-weight-bold mb-0">${map.order}</h4>
							</div>
						</div>
						<div class = "card-body pt-0">
							<div class = "progress md-progress">
								<div class = "progress-bar bg-danger" role = "progressbar" style = "width : 50%"></div>
							</div>
						</div>						
					</div>
				</div>
				
				<div class = "col-lg-4 col-md-12 mb-4 mt-5">
					<div class = "card mt-3">
						<div class = "">
							<i class="fas fa-chart-pie fa-lg purple z-depth-2 p-4 ml-3 mt-n3 rounded text-white"></i>
							<div class = "float-right text-right p-3">
								<p class = "text-uppercase text-muted mb-1"><small>Visitor</small></p>
								<h4 class="font-weight-bold mb-0">226</h4>
							</div>							
						</div>
						<div class = "card-body pt-0">
							<div class = "progress md-progress">
								<div class = "progress-bar bg-warning" role = "progressbar" style = "width : 60%"></div>
							</div>
						</div>	
					</div>
				</div>				
			</div>
		</div>
		
		<div class = "col-md-6 mb-4">
			<div class = "card">
				<div class = "card-body">
					<canvas id = "barChart" style = "max-width : 500px;"></canvas>
				</div>
			</div>
		</div>
		<div class = "col-md-6 mb-4">
			<div class = "card">
				<div class = "card-body">
					<canvas id = "pieChart" style = "max-width : 500px;"></canvas>
				</div>
			</div>
		</div>
		<div class = "col-md-6 mb-4">
			<div class = "card">
				<div class = "card-body">
					<canvas id = "lineChart" style = "max-width : 500px;"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>



<input type = "hidden" id = "ring" value = "${map.ring}"/>
<input type = "hidden" id = "earring" value = "${map.earring}"/>
<input type = "hidden" id = "bracelet" value = "${map.bracelet}"/>
<input type = "hidden" id = "necklace" value = "${map.necklace}"/>

<br/>












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
var ring = $('#ring').val();
var earring = $('#earring').val();
var bracelet = $('#bracelet').val();
var necklace = $('#necklace').val();
var ctxP = document.getElementById("pieChart").getContext('2d');
var myPieChart = new Chart(ctxP, {
	type : 'pie',
	data : {
		labels : ["RING", "EARRING", "BRACELET", "NECKLACE"],
		datasets : [{
			data : [ring, earring, bracelet, necklace],
			backgroundColor : ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1"],
			hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5"]
		}]
	},
	options : {
		responsive : true,
		legend : {
			position : 'right',
			labels : {
				padding : 20,
				boxWidth : 10
			}
		}
	}
});

var ctx = document.getElementById('barChart').getContext('2d');
var barChart = new Chart(ctx, {
	type : 'bar',
	data : {
		labels : ["RING", "EARRING", "BRACELET", "NECKLACE"],
		datasets : [{
			label : '판매량',
			data : [ring, earring, bracelet, necklace],
			backgroundColor : [
				'rgba(255, 99, 132, 0.2)',
				'rgba(54, 162, 235, 0.2)',
				'rgba(255, 206, 86, 0.2)',
				'rgba(75, 192, 192, 0.2)'
			],
			borderColor : [
				'rgba(255,99,132,1)',
				'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)',
				'rgba(75, 192, 192, 1)'
			],
			borderWidth : 1
		}]
	},
	options : {
		scales : {
			yAxes : [{
				ticks : {
					beginAtZero : true
				}
			}]
		}
	}
});

var ctxL = document.getElementById('lineChart').getContext('2d');
var myLineChart = new Chart(ctxL, {
	type : 'line',
	data : {
		labels : ["RING", "EARRING", "BRACELET", "NECKLACE"],
		datasets : [{
			label : "현재 판매량",
			data : [ring, earring, bracelet, necklace],
			backgroundColor : [
				'rgba(105, 0, 132, .2)',
				],
			borderColor : [
				'rgba(200, 99, 132, .7)',
			],
			borderWidth : 2
		},
		{
			label : "목표량",
			data : [100, 60, 80, 95],
			backgroundColor : [
				'rgba(0, 137, 132, .2)',
			],
			borderColor : [
				'rgba(0, 10, 130, .7)',
			],
			borderWidth : 2
		}
		]},
		
	options : {
		responsive : true
	}
});

</script>
</body>
</html>