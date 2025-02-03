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
			<li><a href="#">
        <img src="<c:url value="/resources/images/shop/gallery4.png" />" alt="이미지4" />
        <span>세트1</span>
			</a></li>
			<li><a href="#">
        <img src="<c:url value="/resources/images/shop/gallery5.png" />" alt="이미지5" />
        <span>세트2</span>
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
        <img src="<c:url value='api/image/thumbnail/test/redwine1_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">루이라뚜르 피노누아 </div>
    
    <div class="title shop-content">
    <img src="https://flagcdn.com/w40/fr.png" alt="France Flag" width="20" height="15" class="flag">
    [프랑스]
</div>
    <div class="title shop-price">45,000원</div>
</div>

    <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/spaklewine1_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">고네 메디빌 그랑크뤼..</div>
    
    <div class="title shop-content">
    <img src="https://flagcdn.com/w40/fr.png" alt="France Flag" width="20" height="15" class="flag">
    [프랑스]
</div>
    
    <div class="title shop-price">390,000원</div>

</div>
    
  <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/redwine2_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">피리아토 하모니엄 네로 다..</div>
    
   <div class="title shop-content">
    <img src="https://flagcdn.com/w40/it.png" alt="Italy Flag" width="20" height="15" class="flag">
    [이탈리아]
</div>
    <div class="title shop-price">90,000원</div>
</div>


    
    
  <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/redwine3_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">이즈웨이 롭 앤 레스</div>
    
  <div class="title shop-content">
    <img src="https://flagcdn.com/w40/au.png" alt="Australia Flag" width="20" height="15" class="flag">
    [호주]
</div>

    <div class="title shop-price">45,000원</div>
</div>
    
    
    
       
<div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/redwine4_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">마틴 레이 오크빌 카베르..</div>
    
    <div class="title shop-content">
        <img src="https://flagcdn.com/w40/us.png" alt="USA Flag" width="20" height="15" class="flag">
        [미국]
    </div>

    <div class="title shop-price">200,000원</div>
</div>

    
    
    
   <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/redwine5_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">하디스 틴타라 카베르네 소..</div>
     <div class="title shop-content">
    <img src="https://flagcdn.com/w40/au.png" alt="Australia Flag" width="20" height="15" class="flag">
    [호주]
</div>
    <div class="title shop-price">25,900원</div>
</div>
    
    
    
      <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/spaklewine2_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">고네 메디빌 프리미에크뤼..</div>
     <div class="title shop-content">
    <img src="https://flagcdn.com/w40/fr.png" alt="France Flag" width="20" height="15" class="flag">
    [프랑스]
</div>
    
    <div class="title shop-price">120,000원</div>
</div>


           
<div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/whitewine1_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">본테라 더 루스트</div>
    
    <div class="title shop-content">
        <img src="https://flagcdn.com/w40/us.png" alt="USA Flag" width="20" height="15" class="flag">
        [미국]
    </div>

    <div class="title shop-price">100,000원</div>
</div>

    
    
    
             
<div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/whitewine2_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">노떼 로사 베르멘티노</div>
   <div class="title shop-content">
    <img src="https://flagcdn.com/w40/it.png" alt="Italy Flag" width="20" height="15" class="flag">
    [이탈리아]
</div>
    <div class="title shop-price">31,000원</div>
</div>
    
    
  <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/spaklewine3_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">슐럼베르거 로제 스페셜 브..</div>
   <div class="title shop-content">
    <img src="https://flagcdn.com/w40/at.png" alt="Austria Flag" width="20" height="15" class="flag">
    [오스트리아]
</div>
    <div class="title shop-price">32,000원</div>
</div>
    
    
   <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/whitewine3_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">에리미나 화이트 </div>
    
    <div class="title shop-content">
    <img src="https://flagcdn.com/w40/fr.png" alt="France Flag" width="20" height="15" class="flag">
    [프랑스]
</div>
    <div class="title shop-price">65,000원</div>
</div>
    
    
    <div class="shop">
    <div class="img">
        <img src="<c:url value='api/image/thumbnail/test/redwine6_DOT_jpg' />" alt="Shop Image">
    </div>
    <div class="title shop-title">토르치코다</div>
   <div class="title shop-content">
    <img src="https://flagcdn.com/w40/it.png" alt="Italy Flag" width="20" height="15" class="flag">
    [이탈리아]
</div>
    <div class="title shop-price">50,000원</div>
</div>

<!--  -->

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


<script src="<c:url value='/resources/js/component/image-slider.js' />"></script>

