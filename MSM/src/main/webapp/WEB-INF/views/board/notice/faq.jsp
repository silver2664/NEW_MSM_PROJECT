<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session = "true"%>
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
<title>FAQ</title>
<!--font-awesome -->
<link href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
	<div class="container my-5">


		<!--Section: Content-->
		<section>

			<h6
				class="font-weight-normal text-uppercase font-small grey-text mb-4 text-center">FAQ</h6>
			<!-- Section heading -->
			<h3 class="font-weight-bold black-text mb-4 pb-2 text-center">Frequently
				Asked Questions</h3>
			<hr class="w-header">
			<!-- Section description -->
			<p class="lead text-muted mx-auto mt-4 pt-2 mb-5 text-center">자주 묻는 질문.</p>

			<div class="row">
				<div class="col-md-12 col-lg-10 mx-auto mb-5">

					<!--Accordion wrapper-->
					<div class="accordion md-accordion" id="accordionEx" role="tablist"
						aria-multiselectable="true">

						<!-- Accordion card -->
						<div
							class="card border-top border-bottom-0 border-left border-right border-light">

							<!-- Card header -->
							<div class="card-header border-bottom border-light" role="tab"
								id="headingOne1">
								<a data-toggle="collapse" data-parent="#accordionEx"
									href="#collapseOne1" aria-expanded="true"
									aria-controls="collapseOne1">
									<h5 class="black-text font-weight-normal mb-0">
										회원 가입 없이도 주문 할수 있나요? <i class="fas fa-angle-down rotate-icon"></i>
									</h5>
								</a>
							</div>

							<!-- Card body -->
							<div id="collapseOne1" class="collapse show" role="tabpanel"
								aria-labelledby="headingOne1" data-parent="#accordionEx">
								<div class="card-body">
									저희 쇼핑몰은 현재 회원제로 운영되고 있습니다.<br> 불편하시더라고도, 먼저 가입해주시고 이용해주시면
									감사하겠습니다.
								</div>
							</div>

						</div>
						<!-- Accordion card -->

						<!-- Accordion card -->
						<div
							class="card border-bottom-0 border-left border-right border-light">

							<!-- Card header -->
							<div class="card-header border-bottom border-light" role="tab"
								id="headingTwo2">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordionEx" href="#collapseTwo2"
									aria-expanded="false" aria-controls="collapseTwo2">
									<h5 class="black-text font-weight-normal mb-0">
										취소는 언제 되나요? <i class="fas fa-angle-down rotate-icon"></i>
									</h5>
								</a>
							</div>

							<!-- Card body -->
							<div id="collapseTwo2" class="collapse" role="tabpanel"
								aria-labelledby="headingTwo2" data-parent="#accordionEx">
								<div class="card-body">
									결제 완료 상태의 경우에는 바로 주문 취소가 됩니다.<br> 주문 취소가 되지 않거나 특이사항이 있을
									경우 고객센터에 문의를 주시면 보다 정확히 확인 가능합니다.
								</div>
							</div>

						</div>
						

						<!-- Accordion card -->
						<div
							class="card border-bottom-0 border-left border-right border-light">

							<!-- Card header -->
							<div class="card-header border-bottom border-light" role="tab"
								id="headingThree3">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordionEx" href="#collapseThree3"
									aria-expanded="false" aria-controls="collapseThree3">
									<h5 class="black-text font-weight-normal mb-0">
										반품/교환 비용이 고객 부담인 경우는 어떤 경우 인가요? <i
											class="fas fa-angle-down rotate-icon"></i>
									</h5>
								</a>
							</div>

							<!-- Card body -->
							<div id="collapseThree3" class="collapse" role="tabpanel"
								aria-labelledby="headingThree3" data-parent="#accordionEx">
								<div class="card-body">
									제품의 하자가 아닌 고객님의 단순변심으로 인한 반품/교환의 택배 비는 고객님께서 부담해주셔야합니다.<br>
									단순변심에 의한 반품/교환은 고객님의 개인취향이나 주관적인 사항(디자인,사이즈,컬러 불만,소재)등에 의한 경우를
									말합니다.
								</div>
							</div>

						</div>
						<!-- Accordion card -->

						<!-- Accordion card -->
						<div class="card border-left border-right border-light">

							<!-- Card header -->
							<div class="card-header border-bottom border-light" role="tab"
								id="headingThree4">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordionEx" href="#collapseThree4"
									aria-expanded="false" aria-controls="collapseThree4">
									<h5 class="black-text font-weight-normal mb-0">
										교환 및 반품안내 <i class="fas fa-angle-down rotate-icon"></i>
									</h5>
								</a>
							</div>

							<!-- Card body -->
							<div id="collapseThree4" class="collapse" role="tabpanel"
								aria-labelledby="headingThree4" data-parent="#accordionEx">
								<div class="card-body">
									소비자 보호법에 의거,주문 제작 상품은 교환 및 반품이 되지 않습니다.<br>
									주문 제작 상품은 주문 제작이므로<strong>
									<ins>
									 사이즈 미스,단순변심 등에 의한 교환이나 반품,환불은 불가능합니다.</ins></strong><br>
									
								</div>
							</div>

						</div>
						<!-- Accordion card -->

					</div>
					<!-- Accordion wrapper -->

				</div>
			</div>

		</section>


	</div>
<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
	<!--jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!--popper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<!--javascript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
</body>
</html>