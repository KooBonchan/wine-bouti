<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- CSS 파일 불러오기 -->
<link rel="stylesheet" href="<c:url value='/resources/style/member/mypage.css' />" />

<div class="main-container_welcome">
    <h2>
        <sec:authentication property="principal.memberVO.username"/> 님<br>
        환영합니다.
    </h2>
    <div class="button-container">
        <button class="action-btn" onclick="location.href='<c:url value="/member/update" />'">
            내 정보 수정하기
        </button>
        <form method="post" action="<c:url value='/logout' />">
            <button class="action-btn">로그아웃</button>
        </form>
    </div>
</div>
