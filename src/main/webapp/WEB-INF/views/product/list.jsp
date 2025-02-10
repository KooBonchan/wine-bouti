<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="container">
  <div class="left">
      <div class="title-container">
          <h2>Find your wine</h2>
      </div>
      <!-- 나라 선택 필터 (아코디언 방식) -->
      <button class="accordion">나라</button>
      <div class="panel">
          <div class="filter">
              <input type="checkbox" id="korea" name="country" value="korea">
              <label for="korea">한국</label><br>
              <input type="checkbox" id="france" name="country" value="france">
              <label for="france">프랑스</label><br>
              <input type="checkbox" id="italy" name="country" value="italy">
              <label for="italy">이탈리아</label><br>
              <input type="checkbox" id="spain" name="country" value="spain">
              <label for="spain">스페인</label>
          </div>
      </div>

      <!-- 가격 선택 필터 (아코디언 방식) -->
      <button class="accordion">가격</button>
      <div class="panel">
          <div class="filter">
              <input type="checkbox" id="lowPrice" name="price" value="low">
              <label for="lowPrice">저렴한 가격</label><br>
              <input type="checkbox" id="mediumPrice" name="price" value="medium">
              <label for="mediumPrice">중간 가격</label><br>
              <input type="checkbox" id="highPrice" name="price" value="high">
              <label for="highPrice">고급 가격</label>
          </div>
      </div>

      <!-- 추천 필터 (아코디언 방식) -->
      <button class="accordion">추천</button>
      <div class="panel">
          <div class="filter">
              <input type="checkbox" id="topRecommendation" name="recommendation" value="top">
              <label for="topRecommendation">추천 1</label><br>
              <input type="checkbox" id="bestSeller" name="recommendation" value="bestSeller">
              <label for="bestSeller">베스트 셀러</label><br>
              <input type="checkbox" id="newArrival" name="recommendation" value="newArrival">
              <label for="newArrival">신상품</label>
          </div>
      </div>

      <!-- 와인 종류 필터 (아코디언 방식) -->
      <button class="accordion">와인 종류</button>
      <div class="panel">
          <div class="filter">
              <input type="checkbox" id="redWine" name="wine" value="red">
              <label for="redWine">레드 와인</label><br>
              <input type="checkbox" id="whiteWine" name="wine" value="white">
              <label for="whiteWine">화이트 와인</label><br>
              <input type="checkbox" id="sparklingWine" name="wine" value="sparkling">
              <label for="sparklingWine">스파클링 와인</label>
          </div>
      </div>

      <!-- 세트 필터 (아코디언 방식) -->
      <button class="accordion">세트</button>
      <div class="panel">
          <div class="filter">
              <input type="checkbox" id="set1" name="set" value="set1">
              <label for="set1">세트 1</label><br>
              <input type="checkbox" id="set2" name="set" value="set2">
              <label for="set2">세트 2</label><br>
              <input type="checkbox" id="set3" name="set" value="set3">
              <label for="set3">세트 3</label>
          </div>
      </div>
  </div>

  <div class="right">
  
      <!-- 상품 이미지 그리드 -->
      <div class="product-grid-container">
          <div class="product-grid">
          	<c:forEach items="${products}" var="product">
			<div class="product-item">
			    <!-- 이미지 삽입 부분 -->
			   <div class="image-placeholder" onclick="openPopup(this)">
			       <img src="<c:url value='/api/image/thumbnail/wine/${product.realProductImageName }' />" alt="레드와인">
			   </div>
			   <div class="product-info">
			       <p class="wine-name">${product.koreanName}</p>
			       <c:if test="${not empty product.wineDetails}">
			       	<p class="origin">원산지: ${product.wineDetails.origin}</p>
			       </c:if>
			       <p class="price">가격: ${product.originalPrice}원</p>
			
			       <div class="wine-details">
			           <p class="body">바디: ${product.wineDetails.sweetness}</p> <!-- 바디 추가 -->
			           <p class="acidity">산도: ${product.wineDetails.acidity}</p> <!-- 산도 추가 -->
			           <p class="tannins">탄닌: ${product.wineDetails.tannins}</p> <!-- 탄닌 추가 -->
			        </div>
			    </div>
			</div>                	
           	</c:forEach>
          </div>
      </div>
  </div>
</div>


<script src="<c:url value='/resources/js/product/winescript.js' />"></script>
        
