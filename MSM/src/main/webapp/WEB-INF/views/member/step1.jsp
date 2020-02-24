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
<body>

<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>
<div class="container mt-3">
    <div class="row">
        <div class="col-lg-12">
            <h4 class = "text-center">이용약관</h4>
            <hr/>
            <div class = "col-lg-12" style="border: 1px solid #ccc; overflow : scroll; height : 350px;">
            	<p>
            		<br/>
            		제1조(목적) 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br/>
            		※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」 
            		<br/><br/>
            		제2조(정의) ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. <br/>
					② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br/>
					③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다. <br/>
  					④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
  					<br/><br/>
  					제3조 (약관 등의 명시와 설명 및 개정)① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. <br/>
					② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br/>
					③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/>
					④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br/> 
					⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br/>
					⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
					<br/><br/>
					제4조(서비스의 제공 및 변경) ① “몰”은 다음과 같은 업무를 수행합니다. <br/>
					1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결 <br/>
					2. 구매계약이 체결된 재화 또는 용역의 배송<br/>
    				3. 기타 “몰”이 정하는 업무<br/>
					② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다. <br/>
					③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br/>
					④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
					<br/><br/>
					제5조(서비스의 중단) ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. <br/>
					② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다. <br/>
					③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
					<br/><br/>
					제6조(회원가입) <br/>
  					① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. <br/>
					② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다. <br/>
					1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다. <br/>
    				2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 <br/>
    				3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br/>
					③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br/>
					④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
					<br/><br/>
            	</p>
        	</div>
        	<br/><br/>
        	<h4 class = "text-center">개인정보</h4>
        	<hr/>
        	 <div class = "col-lg-12" style="border: 1px solid #ccc; overflow : scroll; height : 350px;">
            	<p>
            		필요 최소한의 개인정보 수집 <br/>
            		사업자가 서비스 제공을 위해 이용자의 개인정보를 수집하는 경우, 해당 서비스*의 본질적 기능**을 수행하기 위해 반드시 필요한 개인정보만을 수집해야 함 <br/>
            		* 사업자가 이용약관, 개인정보 처리방침, 서비스 안내·설명자료 등에 따라 이용자에게 제공하는 개별 서비스를 의미하며, 이와 같은 개별 서비스는 통상적인 이용자가 합리적으로 예상할 수 있어야 함 <br/>
            		** 사업자가 해당 서비스를 제공하기 위해 반드시 필요한 기능을 의미함<br/>
            		- 사업자가 해당 서비스 제공을 위해 반드시 필요한 개인정보에 대해서는 이용자로부터 수집 동의를 받아야 하며, 이를 필수동의 항목이라 함<br/>
            		※ 생년월일은 결혼중개 서비스의 경우 필수동의 항목으로 볼 수 있으나, 상품 판매 서비스에는 필수동의 항목에 해당하기 어려움 <br/>
            		- 사업자가 해당 서비스의 추가적 기능* 또는 사업자의 필요에 의해 이용자에게 개인정보 수집 동의를 요청할 수 있으며 이를 선택동의 항목이라 함<br/>
            		* 사업자가 이용자에게 결제 알림 서비스를 제공하기 위해 휴대전화 번호나 이메일 주소를 수집하는 경우
            		<br/><br/>
            		필수, 선택 동의 항목을 엄격하게 구분
            		사업자는 이용자의 개인정보 수집 시 필수동의 항목과 선택동의 항목으로 구분하여 각각의 동의를 받아야 함<br/>
            		※ 온라인 쇼핑몰 홈페이지 회원가입 시 상품 광고를 위한 연락처(이메일 주소, 주소 등)는 필수동의 항목이 아닌 선택동의 항목으로 분류하여 개별 동의를 받아야 함<br/>
            		해당 서비스 제공에 필요한 필수동의 항목 설정 시 유의할 점<br/>
            		정보통신망법 제24조의 2에 따라 다른 사업자로부터 이용자의 동의를 받아 개인정보를 제공할 경우에도 이용자가 동의한 목적, 항목, 이용, 보관기간 등에 대한 검토를 거쳐 반드시 필요한 최소한의 개인정보만을 제공받을 필요가 있음<br/>
            		-이 경우에 이용자로부터 직접 수집하는 정보가 아니므로 정보통신망법 제22조에 따른 동의를 받을 필요는 없으나, 개인정보 처리방침에 관련 내용을 기재하여 이용자가 언제든 확인할 수 있도록 운영<br/>
            		또한 선택동의 항목은 서비스 목적별로 나누어 ‘개별적으로 동의’ 받도록 구성하여 이용자가 개인정보 제공여부를 선별적으로 결정하도록 함 <br/>
            		- 선택동의 항목은 서비스 목적을 포괄적으로 기재하지 않아야 하며, 구체적으로 기재하여 동의 받아야 함
            		<br/><br/>
            	</p>
       		</div>
        	<br/>
        	<form role="form" action="/member/step2" method = "post">
        	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
            	<div class="form-group">
            	    	<label class="checkbox-inline">
                    	<input type="checkbox" name="agree" value="true">동의합니다.
                	</label>
            	</div>
            	<button type="submit" class="btn btn-default">다음 단계</button>
        	</form>
    	</div>
	</div>
</div>



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

<%@ include file = "/WEB-INF/views/shareResource/footer.jsp" %>
</body>
</html>