<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://cdn.portone.io/v2/browser-sdk.js" defer async></script>
<div class="cart-container">
	<div class="title">SHOPPING</div>

	<div class="cart-header">
		<div>상품사진</div>
		<div>상품정보</div>
		<div>수량</div>
		<div class="price">개당가격</div>
		<div class="price">총가격</div>
		<div class="etc">기타</div>
	</div>

  <div class="cart-items">
    <c:forEach items="${cartDTO.cartItems }" var="node" >
      <c:set value="${node.key}" var="product" />
      <c:set value="${node.value}" var="quantity" />
      <form class="form-cart-item" onSubmit="return false;">
			<div class="cart-item">
				<div>
					<img src="<c:url value='/api/image/thumbnail/wine/${product.realProductImageName}' />"
					alt="<c:out value='${product.koreanName}' />" class="product-image" />
				</div>
				<div><c:out value="${product.koreanName }" /></div>
				<div class="quantity-control">
					  <input type="hidden" class="productId" name="productId" value="${product.productId}" readonly>
            <input type="number" class="quantity input-update-item" name="quantity" value="${quantity }" min="1">
				</div>
				<div class="price">
					<fmt:formatNumber type="currency"
					  maxFractionDigits="0" currencySymbol="￦"
					  value="${product.originalPrice}" />
	       </div>
	       <div class="price">
          <fmt:formatNumber type="currency"
            maxFractionDigits="0" currencySymbol="￦"
            value="${product.originalPrice * quantity}" />
         </div>
				<div class="etc">
					<button type="button" class="button button-delete-item">삭제</button>
				</div>
			</div>
			</form>
		</c:forEach>
  </div>
  <script>
  
  </script>
	<div class="summary">
		<div>
			총 상품가격<br>
			<c:if var="existsBaesongB" test="${cartDTO.totalPrice lt 53000 }" />
			<c:set var="baesongB" value="${existsBaesongB ? 3000 : 0 }" />
			<fmt:formatNumber value="${cartDTO.totalPrice - baesongB}" pattern="#,###" />원
		</div>
		<div>
			배송비<br>
			<c:if test="${existsBaesongB}">+ 3,000원</c:if>
			<c:if test="${not existsBaesongB}">      0원</c:if>
		</div>
		<div>
			총액<br>
			<span class="total">= <fmt:formatNumber value="${cartDTO.totalPrice}" pattern="#,###" />원</span>
		</div>
	</div>
	<div class="order-buttons">
		<button id="order-button" class="order-button">주문하기</button>
	</div>

	<div class="notes">
		<ol>
			<li>고객님의 선택한 수량을 초과하실 경우 재고가 있는 수량 내에서 부분적으로 배송될 수 있습니다.</li>
			<li>상품의 가격, 옵션은 예고없이 변경될 수 있으며, 주문 전 꼭 확인해 주시기 바랍니다.</li>
		</ol>
	</div>
	<div class="shopping-continue">
		<button class="action-button" onclick='location.href=&#39;<c:url value="/product/red-wine" />&#39;'>쇼핑계속하기</button>                                                
	</div>
</div>
<sec:authentication property='principal.memberVO.email' var="email"/>
<c:set var="csrfToken" value="${_csrf.token}"/>
<script>
const setup = () => new Promise((resolve) => {
	const polling = setInterval(() => {
    if (window.PortOne != null) {
      clearInterval(polling)
      resolve()
    }
  }, 50)
})
window.onload = () => {
	setup()
	loadCartItems();
	document.getElementById("order-button")
    .addEventListener("click", purchase);
  document.querySelectorAll('.input-update-item').forEach(elem => {
	  elem.addEventListener('change', event => {
		  updateCart(extractFormData(event))
	  });
	});
	document.querySelectorAll('.button-delete-item').forEach(button => {
    button.addEventListener('click', event => {
    	deleteCartItem(extractFormData(event))
    });
  });
}

function renderItems(jsonData){
	
}

function loadCartItems() {
	return fetch("<c:url value='/api/cart/' />")
	 .then(response=>response.json())
	 .then(console.log)
	 .catch(console.log);
}

function extractFormData(event){
  const form = event.target.closest('.form-cart-item');
  const productId = form['productId'].value;
  const quantity = form['quantity'].value;
  return {
    productId: productId,
    quantity: quantity
  };
}

function updateCart (data) {
	// data: {productId, quantity}
  $.ajax({
    url: '<c:url value="/api/cart" />',
    type: 'PUT',
    contentType: 'application/json',
    data: JSON.stringify(data),
    success: function() {
    	console.log("update cart test")
    	//location.reload();
    },
    error: function(xhr, status, error) {
      console.error('Error:', error);
      alert('An error occurred while updating the cart.');
    }
  });
};

function deleteCartItem(data){
	// data: {productId, quantity}
	console.log(data);
	$.ajax({
	  url: "<c:url value='/api/cart/' />" + data.productId,
	  type: 'DELETE',
	  contentType: 'application/json',
	  data: JSON.stringify(data),
	  success: function(response) {
		  console.log("delete cart test")
		  console.log(response)
	    //location.reload();
	  },
	  error: function(xhr, status, error) {
	    console.error('Error:', error);
	    alert('An error occurred while updating the cart.');
	  }
	});
}




function purchase(){
	// order (backend)
	// payment(frontend)
	// payment verification (backend)
	return fetch("<c:url value='/api/order/' />",{
		method:'POST',
		headers:{
			"X-CSRF-TOKEN": "${csrfToken}",
		},
	})
	.then(response => {
	  if( ! response.ok) throw new Error(response.status); return response.json();})
	.then(data => {
	  const customer = {
	          email: "${fn:replace(fn:replace(email, '&#64;', '@'), '&#46;', '.')}",
	          phoneNumber: '<sec:authentication property="principal.memberVO.phoneNumber"/>',
	          fullName: '<sec:authentication property="principal.memberVO.username"/>',
	        };
	  const inicisData = {
	        storeId: "store-3c95c4dc-7ec4-48fa-8f7c-af83c1813c96",
	        // 채널 키 설정
	        channelKey: "channel-key-967853e6-c6bf-48be-8707-06177e2d5624",
	        paymentId: data.purchaseId ?? "주문번호",
	        orderName: data.orderName ?? "주문명",
	        totalAmount: data.totalPrice,
	        currency: "CURRENCY_KRW",
	        payMethod: "CARD",
	        customer: customer,
	      };
	  return PortOne.requestPayment(inicisData); 
	})
	.then(payment => {
		if(payment.code !== undefined){
			console.log(payment)
			throw new Error("payment failure")
		}
		return fetch("<c:url value='/api/purchase/complete' />")
	})
	.then(response => {
	    if( ! response.ok) throw new Error(response.status); return response.json();})
	.catch(e => {
		console.log(e);
		alert("결제에 실패했습니다. 나중에 다시 시도해주세요.")
	}) 
}
</script>