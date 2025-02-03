<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrap">
    <div class="logo">
        <img src="" alt="와인 쇼핑몰 로고">
    </div>
    <nav class="menu">
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
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">문의</a></li>
                    <li><a href="#">배송</a></li>
                </ul>
            </li>
            <li><a href="#">MD</a>
                <ul class="submenu">
                    <li><a href="<c:url value='/resources/static-pages/md_hello.html' />">wine bouti</a></li>
                    <li><a href="<c:url value='/resources/static-pages/md_cook.html' />">추천 레시피</a></li>
                    <li><a href="<c:url value='/resources/static-pages/md_wine.html' />">추천 와인</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
