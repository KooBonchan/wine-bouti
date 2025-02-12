<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<div class="imgslide">
	<button class="prev">◀</button>
	<ul class="slidelist">
		<li class="slide-item"><a href="#">
		  <img src="<c:url value="/resources/images/slider/main1.jpg" />" alt="이미지1" />
		</a></li>
		<li class="slide-item"><a href="#">
		  <img src="<c:url value="/resources/images/slider/main2.jpg" />" alt="이미지2" />
		</a></li>
		<li class="slide-item"><a href="#">
		  <img src="<c:url value="/resources/images/slider/main3.jpg" />" alt="이미지3" />
		</a></li>
	</ul>
	<button class="next">▶</button>
	<ul class="dot-nav"></ul>
</div>

<!--  -->

<div class="parent">
	<div class="gallery">
		<ul>
			<li><a href="/winebouti/product/red-wine">
        <img src="<c:url value="/resources/images/shop/gallery1.png" />" alt="이미지1" />
        <span>레드와인</span>
			</a></li>
			<li><a href="/winebouti/product/white-wine">
        <img src="<c:url value="/resources/images/shop/gallery2.png" />" alt="이미지2" />
        <span>화이트와인</span>
			</a></li>
			<li><a href="/winebouti/product/sparkle-wine">
        <img src="<c:url value="/resources/images/shop/gallery3.png" />" alt="이미지3" />
        <span>스파클링와인</span>
			</a></li>
			<li><a href="/winebouti/product/pairing-wine">
        <img src="<c:url value="/resources/images/shop/gallery4.png" />" alt="이미지4" />
        <span>페어링</span>
			</a></li>
			<li><a href="/winebouti/product/gift-set">
        <img src="<c:url value="/resources/images/shop/gallery5.png" />" alt="이미지5" />
        <span>선물세트</span>
			</a></li>
		</ul>
	</div>
</div>

<!--  -->

<div class="container">
    <div class="main-title">상품추천
        <div class="menu_Shop">
            <div class="menu-item">전체</div>
            <div class="menu-item">레드와인</div>
            <div class="menu-item">화이트와인</div>
            <div class="menu-item">스파클링</div>
        </div>
    </div> <!-- 제목 추가 -->

   <c:forEach items="${products}" var="product">
    <div class="shop">
        <!-- 전체 제품을 하나의 <a> 태그로 감싸기 -->
        <a href="<c:url value='/product/details/${product.productId}' />">
            <div class="img">
                <!-- productImageName을 사용하여 이미지 경로를 동적으로 생성 -->
                <img src="<c:url value='/api/image/thumbnail/wine/${product.realProductImageName}' />" alt="Shop Image">
            </div>
            <div class="title shop-title">
                ${product.koreanName}
            </div>
            <div class="title shop-content">
                <img src="https://flagcdn.com/w40/fr.png" alt="France Flag" width="20" height="15" class="flag">
                [프랑스] <!-- 국가를 WineVO에서 동적으로 처리할 수 있다면, 해당 필드를 사용 -->
            </div>
            <div class="title shop-price">
                <fmt:formatNumber value="${product.originalPrice}" pattern="#,###" />원
            </div>
        </a>
    </div>
</c:forEach>





    

<div class="cs">
	<div class="cs-title">MD 추천</div>
	<div class="cs-title2">매달 새로운 추천 상품을 만나보세요</div>
	<div class="bolssler2">
		<div class="box box1">
		  <a href="<c:url value='/md/hello' />">
		    <img src="<c:url value='/resources/images/hellomd/bi1.jpg' />" alt="MD image 3" />
		  </a>
		</div>
		<div class="box box2">
		  <a href="<c:url value='/md/cook' />">
		    <img src="<c:url value='/resources/images/hellomd/cook1.jpg' />" alt="MD image 2" />
		  </a>
		</div>
		<div class="box box3">
		  <a href="<c:url value='/md/wine' />">
		    <img src="<c:url value='/resources/images/hellomd/wine1.jpg' />" alt="MD image 1" />
		  </a>
		</div>
	</div>
</div>


<!-- 모달 메시지 -->
<c:if test="${not empty message}">
    <script>
       alert("<c:out value='${message}' />");
    </script>
</c:if>


<script src="<c:url value='/resources/js/component/image-slider.js' />"></script>

