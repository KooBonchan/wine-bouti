<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<li><a href="#">
        <img src="<c:url value="/resources/images/shop/gallery1.png" />" alt="이미지1" />
        <span>이미지1</span>
			</a></li>
			<li><a href="#">
        <img src="<c:url value="/resources/images/shop/gallery2.png" />" alt="이미지2" />
        <span>이미지2</span>
			</a></li>
			<li><a href="#">
        <img src="<c:url value="/resources/images/shop/gallery3.png" />" alt="이미지3" />
        <span>이미지3</span>
			</a></li>
			<li><a href="#">
        <img src="<c:url value="/resources/images/shop/gallery4.png" />" alt="이미지4" />
        <span>이미지4</span>
			</a></li>
			<li><a href="#">
        <img src="<c:url value="/resources/images/shop/gallery5.png" />" alt="이미지5" />
        <span>이미지5</span>
			</a></li>
		</ul>
	</div>
</div>

<!--  -->

<div class="container">
    <div class="main-title">Shop Showcase
        <div class="menu_Shop">
            <div class="menu-item">Menu 1</div>
            <div class="menu-item">Menu 2</div>
            <div class="menu-item">Menu 3</div>
            <div class="menu-item">Menu 4</div>
        </div>
    </div> <!-- 제목 추가 -->
    <div class="shop">
    <div class="img">
        <img src="<c:url value='/resources/images/winelist/redwine1.jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">루이라뚜르 피노누아 </div>
    
    <div class="title shop-content">
    <img src="https://flagcdn.com/w40/fr.png" alt="France Flag" width="20" height="20" class="flag">
    [프랑스]
</div>
    
    <div class="title shop-price">45,000원</div>

</div>

    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
    <div class="shop">
      <div class="img"></div>
      <div class="title shop-title">Shop Title</div>
      <div class="title shop-content">Shop content</div>
      <div class="title shop-price">Shop price</div>
    </div>
</div>

<!--  -->

<div class="cs">
	<div class="cs-title">Shop Showcase</div>
	<div class="cs-title2">Shop Showcase</div>
	<div class="bolssler2">
		<div class="box box1">
		  <img src="<c:url value="/resources/images/hellomd/bi1.jpg" />" alt="MD image 3" />
		</div>
		<div class="box box2">
		  <img src="<c:url value="/resources/images/hellomd/cook1.jpg" />" alt="MD image 2" />
		</div>
		<div class="box box3">
		  <img src="<c:url value="/resources/images/hellomd/wine1.jpg" />" alt="MD image 1" />
		</div>
	</div>
</div>


<script src="<c:url value='/resources/js/component/image-slider.js' />"></script>

