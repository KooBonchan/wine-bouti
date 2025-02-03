<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="title">SHOPPING</div>

	<div class="cart-header">
		<div>상품사진</div>
		<div>상품정보</div>
		<div>수량</div>
		<div>가격</div>
		<div>기타</div>
	</div>

	<div class="cart-item">
		<div>
			<img src="/api/placeholder/80/80" alt="Product" class="product-image">
		</div>
		<div>원터 미들컷 부츠</div>
		<div class="quantity-control">
			<input type="number" value="1" min="1" class="quantity-input">
			<button class="button">수정</button>
		</div>
		<div>30,000원</div>
		<div>
			<button class="button">삭제</button>
			<button class="button">주문하기</button>
		</div>
	</div>

	<div class="cart-item">
		<div>
			<img src="/api/placeholder/80/80" alt="Product" class="product-image">
		</div>
		<div>원터 미들컷 부츠</div>
		<div class="quantity-control">
			<input type="number" value="1" min="1" class="quantity-input">
			<button class="button">수정</button>
		</div>
		<div>30,000원</div>
		<div>
			<button class="button">삭제</button>
			<button class="button">주문하기</button>
		</div>
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
			<li>상품의 가격, 옵션은 예고없이 변경될 수 있으며, 수량 선택 후 꼭 확인해 주시기 바랍니다.</li>
			<li>장바구니에 담긴상품은 30일간만 보관되며 30일이 경과하면 상품정보는 삭제됨을 알려 드립니다.</li>
		</ol>
	</div>

	<div class="shopping-continue">
		<button class="action-button">쇼핑계속하기</button>
	</div>
</div>