<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="<c:url value='/resources/js/product/details.js' />"></script>
<div class="container">
	<div class="top">
		<div class="top-left">
			<div class="top-left-top" id="wine-image">
				<img id="main-wine-image"
					src="<c:url value='/resources/images/wine1.jpg' />" alt="와인 이미지"
					style="width: 100%; height: auto;">
			</div>
			<div class="top-left-bottom">
				<div onclick="changeWineImage(1)">
					<h3>와인 이미지 1</h3>
				</div>
				<div onclick="changeWineImage(2)">
					<h3>와인 이미지 2</h3>
				</div>
				<div onclick="changeWineImage(3)">
					<h3>와인 이미지 3</h3>
				</div>
			</div>
		</div>
		<div class="top-right-container">
			<div class="top-right">
				<h2>와인이름</h2>
				<div class="popup-content">
					<div class="wine-info">
						<!-- 바디 상세 설명 -->
						<div class="wine-body">
							<label for="body">바디:</label>
							<div class="body-option">가벼운</div>
							<div class="body-option">중간</div>
							<div class="body-option">무거운</div>
						</div>
						<!-- 산도 상세 설명 -->
						<div class="wine-acidity">
							<label for="acidity">산도:</label>
							<div class="acidity-option">낮은</div>
							<div class="acidity-option">중간</div>
							<div class="acidity-option">높은</div>
						</div>
						<!-- 타닌 상세 설명 -->
						<div class="wine-tannins">
							<label for="tannins">타닌:</label>
							<div class="tannin-option">부드러운</div>
							<div class="tannin-option">중간</div>
							<div class="tannin-option">강한</div>
						</div>
					</div>
				</div>
				<ul>
					<li>가격: 50,000원</li>
					<li>할인: 10% (5,000원 할인)</li>
					<li>배송비: 무료</li>
				</ul>
				<!-- 수량, 바로구매, 장바구니 입력 폼 추가 -->
				<div class="price-info">
					<label for="quantity">수량:</label> <input type="number"
						id="quantity" name="quantity" value="1" min="1">
					<button type="button">바로 구매</button>
					<button type="button">장바구니</button>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		<!-- 상세 페이지 및 리뷰 리스트 -->
		<div class="details-reviews">
			<!-- 상세 페이지 -->
			<div class="details" onclick="showContent('details')">
				<h3>상세 페이지</h3>
			</div>
			<!-- 리뷰 리스트 -->
			<div class="reviews-list" onclick="showContent('reviews')">
				<h3>리뷰 리스트</h3>

			</div>
		</div>
		<div class="detailsview">
			<div id="details-content" class="details-content">
				<h3>상세 페이지</h3>
				<p>여기에는 와인에 대한 소개나 추가적인 설명을 추가할 수 있습니다.</p>
			</div>
			<div id="reviews-content" class="review-content"
				style="display: none;">
				<div class="rating-summary">
					<div class="rating">
						<h3>상품 만족도: 4.5/5</h3>
						<h3>☆☆☆☆☆</h3>
					</div>
					<div class="reviews">
						<h3>총 리뷰 120개</h3>
						<!-- 리뷰 남기기 -->
						<div class="review-form">
							<button onclick="window.location.href='<c:url value="/review/write?productId=${product.productId}"/>'">리뷰 남기기</button>

						</div>
					</div>
				</div>
				<h3>리뷰 내용</h3>
				<p>여기에는 리뷰 리스트</p>
				<section>
					<!-- 리뷰 목록 -->
					<div class="review-section">
						<h2>리뷰</h2>

						<%@ include file="../review/list.jsp" %>

					</div>
				</section>
				<!-- 페이지 넘기기 -->
				<div class="review-pagination">
					<button onclick="prevPage()">이전</button>
					<button onclick="nextPage()">다음</button>
				</div>
			</div>
		</div>
	</div>
</div>