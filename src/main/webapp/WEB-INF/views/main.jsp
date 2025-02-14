<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!-- 이미지 슬라이더 -->
<div class="imgslide">
	<button class="prev">◀</button>
	<ul class="slidelist">
		<li class="slide-item"><a href="/winebouti/product/red-wine">
		  <img src="<c:url value='/resources/images/slider/main1.jpg' />" alt="이미지1" />
		</a></li>
		<li class="slide-item"><a href="/winebouti/product/white-wine">
		  <img src="<c:url value='/resources/images/slider/main2.jpg' />" alt="이미지2" />
		</a></li>
		<li class="slide-item"><a href="/winebouti/product/pairing-wine">
		  <img src="<c:url value='/resources/images/slider/main3.jpg' />" alt="이미지3" />
		</a></li>
	</ul>
	<button class="next">▶</button>
	<ul class="dot-nav"></ul>
</div>

<!-- 갤러리 -->
<div class="parent">
	<div class="gallery">
		<ul>
			<li><a href="/winebouti/product/red-wine">
        <img src="<c:url value='/resources/images/shop/gallery1.png' />" alt="이미지1" />
        <span>레드와인</span>
			</a></li>
			<li><a href="/winebouti/product/white-wine">
        <img src="<c:url value='/resources/images/shop/gallery2.png' />" alt="이미지2" />
        <span>화이트와인</span>
			</a></li>
			<li><a href="/winebouti/product/sparkle-wine">
        <img src="<c:url value='/resources/images/shop/gallery3.png' />" alt="이미지3" />
        <span>스파클링와인</span>
			</a></li>
			<li><a href="/winebouti/product/pairing-wine">
        <img src="<c:url value='/resources/images/shop/gallery4.png' />" alt="이미지4" />
        <span>페어링</span>
			</a></li>
			<li><a href="/winebouti/product/gift-set">
        <img src="<c:url value='/resources/images/shop/gallery5.png' />" alt="이미지5" />
        <span>선물세트</span>
			</a></li>
		</ul>
	</div>
</div>

<!-- 상품 추천 -->
<div class="container">
    <div class="main-title">상품추천
        <div class="menu_Shop">
            <div class="menu-item" onclick="changeCategory('all')">전체</div>
            <div class="menu-item" onclick="changeCategory('red')">레드와인</div>
            <div class="menu-item" onclick="changeCategory('white')">화이트와인</div>
            <div class="menu-item" onclick="changeCategory('sparkle')">스파클링</div>
        </div>
    </div>

    <div id="product-list" class="container">
        <!-- 상품 목록이 동적으로 여기 삽입됩니다 -->
    </div>
</div>

<c:url value="/product/ajax/category" var="categoryUrl" />
<c:url value="/api/image/thumbnail/wine/" var="imagePath" />

<script>
function changeCategory(category) {
    const url = "${categoryUrl}?category=" + category;
    const productList = document.getElementById('product-list');
    productList.innerHTML = '<div class="loading">Loading...</div>';

    fetch(url)
        .then(response => response.json())
        .then(data => {
            productList.innerHTML = '';
            displayProducts(data);
        });
}

function displayProducts(products) {
    const productList = document.getElementById('product-list');

    products.forEach(product => {
        const productDiv = document.createElement('div');
        productDiv.classList.add('product');

        let flagUrl = 'https://flagcdn.com/w40/default.png';
        let flagName = '';

        if (product.wineDetails && product.wineDetails.origin) {
            switch (product.wineDetails.origin) {
                case 'France': flagUrl = 'https://flagcdn.com/w40/fr.png'; flagName = 'France'; break;
                case 'Italy': flagUrl = 'https://flagcdn.com/w40/it.png'; flagName = 'Italy'; break;
                case 'Spain': flagUrl = 'https://flagcdn.com/w40/es.png'; flagName = 'Spain'; break;
                case 'USA': flagUrl = 'https://flagcdn.com/w40/us.png'; flagName = 'USA'; break;
                case 'Chile': flagUrl = 'https://flagcdn.com/w40/cl.png'; flagName = 'Chile'; break;
                case 'Argentina': flagUrl = 'https://flagcdn.com/w40/ar.png'; flagName = 'Argentina'; break;
                case 'Australia': flagUrl = 'https://flagcdn.com/w40/au.png'; flagName = 'Australia'; break;
                default: flagUrl = 'https://flagcdn.com/w40/default.png'; flagName = 'Unknown'; break;
            }
        }

        const imageUrl = "${imagePath}" + product.realProductImageName;
        productDiv.innerHTML = `
            <div class="shop">
                <a href="<c:url value='/product/details/\${product.productId}' />">
                    <div class="img">
                        <img src=\${imageUrl} alt="\${product.koreanName}">
                    </div>
                    <h3>\${product.koreanName}</h3>
                    <div class="title shop-content">
                        <img src="\${flagUrl}" alt="\${flagName} Flag" width="20" height="15" class="flag">
                        \${flagName}
                    </div>
                    <div class="title shop-price">
                        <p>가격: \${product.originalPrice.toLocaleString()}원</p>
                    </div>
                </a>
            </div>`;

        productList.appendChild(productDiv);
    });
}

// 페이지 로드 시 "전체" 카테고리 내용을 보여주도록 수정
window.addEventListener('DOMContentLoaded', () => {
    changeCategory('all'); // 'all'은 전체 카테고리를 나타내는 값이라고 가정
});
</script>

<!-- MD 추천 -->
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
<div id="warning-modal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close-btn" onclick="closeModal()">&times;</span>
    <img src="<c:url value='/resources/images/shop/warning.png' />" alt="경고 이미지" />
    <p>warning</p>
    <label>
      <input type="checkbox" id="dont-show-again" /> 오늘 하루만 보지 않기
    </label>
    <button onclick="closeModal()">닫기</button>
  </div>
</div>

<c:if test="${not empty message}">
    <script>
       alert("<c:out value='${message}' />");
    </script>
</c:if>

<script>
  // 모달 창을 열기 전에 "오늘 하루만 보기" 체크 여부 확인
  window.addEventListener('DOMContentLoaded', function () {
    if (!localStorage.getItem('dontShowWarning')) {
      showModal();
    }
  });

  // 모달 창 보이기
  function showModal() {
    document.getElementById('warning-modal').style.display = 'block';
  }

  // 모달 창 닫기
  function closeModal() {
    // "오늘 하루만 보기" 체크된 경우 LocalStorage에 기록
    if (document.getElementById('dont-show-again').checked) {
      localStorage.setItem('dontShowWarning', 'true');
    }
    document.getElementById('warning-modal').style.display = 'none';
  }
</script>

<style>
  /* 모달 스타일 */
  .modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .modal-content {
    background: none;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    position: relative;
  }
  .close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    cursor: pointer;
  }
</style>

<script src="<c:url value='/resources/js/component/image-slider.js' />"></script>
