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

<h1>Chart</h1>
<hr/>
<input type = "hidden" id = "ring" value = "${map.ring}"/>
<input type = "hidden" id = "earring" value = "${map.earring}"/>
<input type = "hidden" id = "bracelet" value = "${map.bracelet}"/>
<input type = "hidden" id = "necklace" value = "${map.necklace}"/>
<canvas id = "pieChart" style = "max-width : 500px;"></canvas>
<br/><br/><br/><br/>
<canvas id = "barChart" style = "max-width : 500px;"></canvas>
<br/><br/><br/><br/>
<canvas id = "lineChart" style = "max-width : 500px;"></canvas>










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