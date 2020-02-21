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
<title>Basic Form</title>
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
 #de {
    display:inline-block;
 }
 #amount {
    width:40px;
 }
 #totalMoney{
 display:inline-block;
 }
</style>
</head>
<body>
<%@ include file = "/WEB-INF/views/shareResource/header.jsp" %>

<div class="container">
    
    
    <form name = "form1" id = "form1" method = "post" action = "/order/insert">
    <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
    <c:choose>
    <c:when test = "${map.count == 0}">
        장바구니가 비어있습니다.
    </c:when>
    <c:otherwise>
        
            <table border = "1" class="table table-hover">
                <tr>
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>취소</th>
                </tr>
                
                <c:forEach var = "row" items = "${map.list}" varStatus = "i">
                
                <input type = "hidden" name = "userId" value="${row.userId }"/>
                    <tr>
                        <td >
                           <input type="text" readonly name="orderProductName" id="orderProductName" class="form-control-plaintext" value="${row.productName}"><br/> 
                           <input type = "hidden" class ="form-control-plaintext" name = "cartId" value = "${row.cartId}"/>
                           <input type = "hidden" class="form-control-plaintext" name = "mgNum" value = "${row.mgNum}"/>
                        </td>
                        <td style = "width : 200px; align : left">
                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatNumber type="currency" value ="${row.productPrice}"/>">
                        </td>
                        <td>
                            <input type = "number" id="orderAmount" name = "orderAmount" value = "${row.amount}" min = "1" />
                        </td>
                        <td style = "width : 150px; align : left">
                           <input type="text" readonly class="form-control-plaintext" id="orderPrice" name="orderPrice" value= "<fmt:formatNumber type="currency" value = "${row.money}"/>">
                        </td>
                        <td style = "width : 100px;" align = "right">
                            <a href = "${path}/cart/delete2?cartId=${row.cartId}">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan = "5" align = "right">
                        장바구니 금액 합계 : <fmt:formatNumber type="currency" value ="${map.sumMoney}"/><br/>
                        배송료 : ${map.fee}<br/>
                        전체 주문 금액 :<fmt:formatNumber type="currency" value = "${map.allsum}"/>
                        <input type="hidden" id="totalMoney" name="totalMoney" value="${map.allsum}">
                    </td>
                </tr>
            </table>
            <input type = "hidden" name = "count" value ="${map.count}">   
            <button  class="btn btn-sm btn-primary" type = "submit" id = "btnUpdate" formaction="/cart/update2">수정</button>               
            
    </c:otherwise>
</c:choose>
<hr>
    <input type="hidden" id="mId" name="mId" value="${member.mId}">
    
    주문자  <input type="text" readonly class="form-control form-control-sm" id="mName" name="mName" value="${member.mName}"> 
    전화번호  <input type="text" readonly class="form-control form-control-sm" name="mPhone" id="mPhone" value="${member.mPhone}">
    우편번호 <input type="text" readonly class="form-control form-control-sm" value="${member.mZip_Code}"id="mZip_Code" name="mZip_Code">
    주소<input type="text" readonly class="form-control form-control-sm" id="mFirst_Addr" value="${member.mFirst_Addr}" name="mFirst_Addr">
    상세주소<input type="text" readonly class="form-control form-control-sm" id="mSecond_Addr"value="${member.mSecond_Addr}" name="mSecond_Addr">
  
    <hr>
    <h3 id="de">배송지 정보</h3>   <input type="checkbox" name="copy" id="copy" onclick="if(this.checked) { myFunction() }">주문자와 동일 <br>
    받는 분 <input type="text"class="form-control form-control-sm" id="orderName" name="orderName"> 
    받는 분 전화번호  <input type="text"class="form-control form-control-sm" name="orderPhone" id="orderPhone">
    
    받는분주소
    <div class = "form-group">
                <input class = "form-control" style = "width : 40%; display : inline;" id = "orderAddr1" name = "orderAddr1"
                    type = "text" readonly="readonly"/>
                <button type = "button" class = "btn btn-default" onclick = "execPostCode();"><i class = "fa fa-search"></i>우편번호 찾기</button>
            </div>            
            <div class = "form-group">
                <input class = "form-control" style = "top : 5px;" placeholder = "도로명 주소" name = "orderAddr2" id = "orderAddr2"
                    type = "text" readonly = "readonly"/>
            </div>            
            <div class = "form-group">
                <input class = "form-control" style = "top : 5px;" placeholder = "상세 주소" name = "orderAddr3" id = "orderAddr3"
                    type = "text"/>
            </div>
    배송 시 요청사항 <input type="text" name="orderReq" id="orderReq"class="form-control form-control-sm">
    
    <button type="submit"class="btn btn-danger btn-sm" formaction="/order/insert">주문</button>
    </form>  
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
function myFunction() {
	
    document.getElementById("orderName").value = document.getElementById("mName").value;    
    document.getElementById("orderAddr1").value = document.getElementById("mZip_Code").value;
    document.getElementById("orderAddr2").value = document.getElementById("mFirst_Addr").value;
    document.getElementById("orderAddr3").value = document.getElementById("mSecond_Addr").value;
    document.getElementById("orderPhone").value = document.getElementById("mPhone").value;
}



function execPostCode(){
    new daum.Postcode({
        oncomplete : function(data){
            //팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.
            
            //도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            //내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수 (참고항목변수)
            
            //법정동이 있을 경우 추가한다. (법정리는 제외)
            //법정동의 경우 마지막 문자가 "동/로/가" 로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
    
            //건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            
            //도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = '(' + extraRoadAddr + ')'; 
            }
            
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
            
            $("[name=mZip_Code]").val(data.zonecode);
            $("[name=mFirst_Addr]").val(fullRoadAddr);          
        }
    }).open();
}   

/*$(document).ready(function() {
	var amount = new Array();
	var mgNum = new Array();
	
	$.each(function(){
		var amountval = $('#amount').val();
		var mgnum = $('#mgNum').val();
		amount.push(amountval);
		mgNum.push(mgnum);
	});
	
	$("btnUpdate").click(function() {
		$.ajax({
	        type : "post",
	        url : "cart/update",
	        data: {
	        	amount : amount,
	        	mgNum : mgNum
	        	},	        
	        error : function() {
	            alert("통신에러");
	        },
	        success : function(data) {
	            
	        }
	 
	    });

	});
});*/




		

    
</script>

</body>
</html>