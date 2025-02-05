<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrap">
    <nav class="menu">
    	<div class="logo">
			<a href="<c:url value='/'/>">
				<img src="<c:url value='/resources/images/logo/wine-w.png'/>"
					alt="와인 쇼핑몰 로고" />
			</a>
		</div>
    
        <ul class="navi">
            <li><a href="#">상품</a>
                <ul class="submenu">
                    <li><a href="<c:url value='/product/red-wine' />">레드와인</a></li> <!-- 레드 와인 페이지로 이동 -->
                    <li><a href="<c:url value='/product/white-wine' />">화이트</a></li> <!-- 화이트 와인 페이지로 이동 -->
                    <li><a href="<c:url value='/product/sparkle-wine' />">스파클링</a></li> <!-- 스파클링 와인 페이지로 이동 -->
                     <li><a href="<c:url value='/product/pairing-wine' />">페어링</a></li> <!-- 페어링 페이지로 이동 -->
                    <li><a href="<c:url value='/product/gift-wine' />">선물세트</a></li> <!-- 기프트 와인 페이지로 이동 -->
                </ul>
            </li>
            <li><a href="#">이벤트</a>
                <ul class="submenu">
                    <li><a href="#">특가</a></li>
                    <li><a href="#">세일</a></li>
                    <li><a href="#">기획전</a></li>
                </ul>
            </li>
            <li><a href="#">혜택</a>
                <ul class="submenu">
                    <li><a href="#">적립</a></li>
                    <li><a href="#">추천</a></li>
                </ul>
            </li>
            <li><a href="#">고객센터</a>
                <ul class="submenu">
                  <li><a href="<c:url value='/greet' />">회사정보</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">문의</a></li>
                    <li><a href="#">배송</a></li>
                </ul>
            </li>
            <li><a href="#">MD</a>
                <ul class="submenu">
                    <li><a href="<c:url value='/md/hello' />">wine bouti</a></li>
                    <li><a href="<c:url value='/md/cook' />">추천 레시피</a></li>
                    <li><a href="<c:url value='/md/wine' />">추천 와인</a></li>
                </ul>
            </li>
        </ul>
        
          <div class="icon-wrapper">
    <div class="iconlogin">
     <a href="<c:url value='/member/login'/>">
            <img src="<c:url value='/resources/images/icon/login.png'/>" alt="로그인 아이콘" />
        </a>
    </div>
    <div class="iconcart">
        <a href="<c:url value='/'/>">
            <img src="<c:url value='/resources/images/icon/cart.png'/>" alt="카트 아이콘" />
        </a>
    </div>
</div>
    </nav>
    


</div>
