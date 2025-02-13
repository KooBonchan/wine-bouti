<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="<c:url value='/resources/js/product/details.js' />"></script>
<c:if test="${empty product }">
  <% response.sendRedirect("/"); %>
</c:if>
<div class="container">
    <div class="top">
        <!-- 왼쪽 (와인 이미지) -->
        <div class="top-left">
            <div class="top-left-top" id="wine-image">
                <img id="main-wine-image"
                    src="<c:url value='/api/image/wine/${product.realProductImageName }' />" 
                    alt="<c:out value="${product.koreanName}" />"
                    onclick="openModal(this)"
       				 style="width: 100%; height: auto; cursor: pointer;">
                    
            </div>
			            <!-- 확대된 이미지 모달 -->
			<div id="imageModal" class="modal">
			    <span class="close" onclick="closeModal()">&times;</span>
			    <img class="modal-content" id="modalImage">
			</div>
        </div>

        <!-- 오른쪽 (와인 정보) -->
        <div class="top-right-container">
            <div class="top-right">
                <h2><c:out value="${product.koreanName}" /></h2>
                <div class="popup-content">
                  <c:if test="${not empty product.wineDetails}">
                    <c:set var="wine" value="${product.wineDetails }" />
                    <div class="wine-info">
                        <div class="wine-body">
                            <label for="body">바디:</label>
                            <div class="body-option <c:if test='${wine.sweetness lt 3 }'>selected</c:if>">가벼운</div>
                            <div class="body-option <c:if test='${wine.sweetness lt 5 and wine.sweetness ge 3 }'>selected</c:if>">중간</div>
                            <div class="body-option <c:if test='${wine.sweetness ge 5 }'>selected</c:if>">무거운</div>
                        </div>
                        <div class="wine-acidity">
                            <label for="acidity">산도:</label>
                            <div class="acidity-option <c:if test='${wine.acidity lt 3 }'>selected</c:if>">낮은</div>
                            <div class="acidity-option <c:if test='${wine.acidity lt 5 and wine.acidity ge 3 }'>selected</c:if>">중간</div>
                            <div class="acidity-option <c:if test='${wine.acidity ge 5 }'>selected</c:if>">높은</div>
                        </div>
                        <div class="wine-tannins">
                            <label for="tannins">타닌:</label>
                            <div class="tannin-option <c:if test='${wine.tannins lt 3 }'>selected</c:if>">부드러운</div>
                            <div class="tannin-option <c:if test='${wine.tannins lt 5 and wine.tannins ge 3 }'>selected</c:if>">중간</div>
                            <div class="tannin-option <c:if test='${wine.tannins ge 5 }'>selected</c:if>">강한</div>
                        </div>
                    </div>
                  </c:if>
                </div>
                <ul>
                    <li>개당가격: <fmt:formatNumber value="${product.originalPrice}" pattern="#,###" />원</li>
                    <li>배송비: 3,000원 (50,000원 이상 구매 시 무료)</li>
                </ul>
				<!-- 수량, 바로구매, 장바구니 입력 폼 추가 -->
				<div class="price-info">
					<label for="quantity">수량:</label>
					<form id="form-quantity" onSubmit="return false;">
						<input type="number" id="quantity" name="quantity" value="1" min="1">
	          <!-- <button type="button">바로 구매</button> -->
	          <button type="button" id="add-to-cart">장바구니에 담기</button>
					</form>
					<script>
            document.getElementById("add-to-cart").addEventListener("click", e => {
              e.preventDefault();
              const quantity = document.forms['form-quantity'].quantity.value; 
              if(quantity < 1) {
                alert("장바구니에 담을 수 없습니다.");
                return;
              }
              fetch("<c:url value='/api/cart' />?" +
                  "productId=" + <c:out value="${product.productId}" /> + "&" +
                  "quantity=" + quantity,
                  {method:"PUT"})
              .then(response => {
            	  if(!response.ok) throw new Error();
            	  return response.json()
            	 })
              .then(json => alert("장바구니에 성공적으로 담았습니다."))
              .catch(e => {location.href = "<c:url value='/member/login' />"})
            })
          </script>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		<!-- 상세 페이지 및 리뷰 리스트 -->
		<div class="details-reviews">
			<!-- 상세 페이지 -->
			<div class="details" onclick="showContent('details')">
				<h3>상세설명</h3>
			</div>
			<!-- 리뷰 리스트 -->
			<div class="reviews-list" onclick="showContent('reviews')">
				<h3>리뷰 리스트</h3>

			</div>
		</div>
		<div class="detailsview">
			<div id="details-content" class="details-content">
			 <div id="details-image-wrapper">
			   <c:choose>
           <c:when test="${not empty product.wineDetails and product.wineDetails.type == 'White' }">
           <img id="details-image" alt="상세 이미지" src="<c:url value='/api/image/wine/whitewine_details_DOT_jpg' />" />
           </c:when>
           <c:otherwise>
           <img id="details-image" alt="상세 이미지" src="<c:url value='/api/image/wine/redwine_details_DOT_jpg' />" />
           </c:otherwise>
         </c:choose>
			 </div>
			</div>
			<div id="reviews-content" class="review-content"
				style="display: none;">
				<div class="rating-summary">
					<div class="rating">
						<h3>상품 만족도: 4.5/5</h3>
						<h3>☆☆☆☆☆</h3>
					</div>
					<div class="reviews">
						<h3 id="reviewCount">총 리뷰 ${reviews.size()} 개</h3>
						<!-- 리뷰 남기기 -->
						<div class="review-form">
							<button onclick="window.location.href='<c:url value="/review/write?productId=${product.productId}"/>'">리뷰 남기기</button>

						</div>
					</div>
				</div>
				<section>
					<!-- 리뷰 목록 -->
					<div class="review-section">
						<h2>Reivew</h2>

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
