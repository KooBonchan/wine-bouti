<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.portone.io/v2/browser-sdk.js" defer async></script>
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
			배송비<br>+ 3,000원
		</div>
		<div>
			총액<br>
			<span class="total">= 53,000원</span>
		</div>
	</div>

	<div class="order-buttons">
		<button class="order-button">주문하기</button>
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
<script>

PortOne.requestPayment({
  storeId: "store-3c95c4dc-7ec4-48fa-8f7c-af83c1813c96",
  // 채널 키 설정
  channelKey: "channel-key-967853e6-c6bf-48be-8707-06177e2d5624",
  paymentId: "SuPERTESTTEST TTTT",
  orderName: "김김김김 조미조미김김",
  totalAmount: 1000,
  currency: "CURRENCY_KRW",
  payMethod: "CARD",
  customer: {
	  email: "TEST_MASTER@retsa.set",
	  phoneNumber: "12",
	  fullName: "TESTSER",
  },
})
</script>