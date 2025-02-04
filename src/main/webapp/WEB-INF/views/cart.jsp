<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="cart-container">
	<div class="title">SHOPPING</div>

	<div class="cart-header">
		<div>상품사진</div>
		<div>상품정보</div>
		<div>수량</div>
		<div>가격</div>
		<div>기타</div>
	</div>

  <div class="cart-items">
    <c:forEach items="${sessionScope.cartDTO.cartItems }" var="node" >
      <c:set value="${node.key}" var="product" />
      <c:set value="${node.value}" var="quantity" />
			<div class="cart-item">
				<div>
					<img src="<c:url value='/api/image/thumbnail/test/${product.realProductImageName}' />" alt="Product" class="product-image" />
				</div>
				<div><c:out value="${product.koreanName }" /></div>
				<div class="quantity-control">
					<input type="number" value="${quantity }" min="1" class="quantity-input">
					<button class="button">수정</button>
				</div>
				<div><fmt:formatNumber type="currency" maxFractionDigits="0" currencySymbol="￦"
       value="${product.originalPrice}" /></div>
				<div>
					<button class="button">삭제</button>
					<button class="button">주문하기</button>
				</div>
			</div>
		</c:forEach>
  </div>
	<div class="summary">
		<div>
			총 상품가격<br>50,000원
		</div>
		<div>
			구매 예정가<br>+ 3,000원
		</div>
		<div>
			총액<br>
			<span class="total">= 53,000원</span>
		</div>
	</div>

	<div class="action-buttons">
		<button class="action-button">선택상품 주문</button>
		<button class="action-button">전체상품 주문</button>
	</div>

	<div class="notes">
		<ol>
			<li>고객님의 선택한 수량을 초과하실 경우 재고가 있는 수량 내에서 부분적으로 배송될 수 있습니다.</li>
			<li>상품의 가격, 옵션은 예고없이 변경될 수 있으며, 주문 전 꼭 확인해 주시기 바랍니다.</li>
		</ol>
	</div>

	<div class="shopping-continue">
		<button class="action-button" onclick="history.back()">쇼핑계속하기</button>                                                
	</div>
</div>
<%-- 
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>1달러샵</title>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
        var IMP = window.IMP;
        IMP.init("가맹점식별코드를 입력합니다.");

        function requestPay() {

            var orderUid = '[[${requestDto.orderUid}]]';
            var itemName = '[[${requestDto.itemName}]]';
            var paymentPrice = [[${requestDto.paymentPrice}]];
            var buyerName = '[[${requestDto.buyerName}]]';
            var buyerEmail = '[[${requestDto.buyerEmail}]]';
            var buyerAddress = '[[${requestDto.buyerAddress}]]';

            IMP.request_pay({
                    pg : 'html5_inicis.INIpayTest',
                    pay_method : 'card',
                    merchant_uid: orderUid, // 주문 번호
                    name : itemName, // 상품 이름
                    amount : paymentPrice, // 상품 가격
                    buyer_email : buyerEmail, // 구매자 이메일
                    buyer_name : buyerName, // 구매자 이름
                    buyer_tel : '010-1234-5678', // 임의의 값
                    buyer_addr : buyerAddress, // 구매자 주소
                    buyer_postcode : '123-456', // 임의의 값
                },
                function(rsp) {
                    if (rsp.success) {
                        alert('call back!!: ' + JSON.stringify(rsp));
                        // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                        // jQuery로 HTTP 요청
                        jQuery.ajax({
                            url: "/payment",
                            method: "POST",
                            headers: {"Content-Type": "application/json"},
                            data: JSON.stringify({
                                "payment_uid": rsp.imp_uid,      // 결제 고유번호
                                "order_uid": rsp.merchant_uid   // 주문번호
                            })
                        }).done(function (response) {
                            console.log(response);
                            // 가맹점 서버 결제 API 성공시 로직
                            //alert('Please, Check your payment result page!!' + rsp);
                            alert('결제 완료!' + rsp);
                            window.location.href = "/success-payment";
                        })
                    } else {
                        // alert("success? "+ rsp.success+ ", 결제에 실패하였습니다. 에러 내용: " + JSON.stringify(rsp));
                        alert('결제 실패!' + rsp);
                        window.location.href = "/fail-payment";
                    }
                });
        }
    </script>
</head>
<body>
    <h1>결제 페이지</h1>
    <button th:with="requestDto = ${requestDto}" onclick="requestPay()">
        결제하기
    </button>
</body>
</html>
 --%>