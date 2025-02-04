<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value='/resources/style/member/save.css' />" />
</head>
<body>

    <!-- 로그인한 상태일 때만 main-container 표시 -->
    <c:if test="${not empty sessionScope.loginEmail}">
        <div class="main-container">
            <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>
            <button class="action-btn" onclick="location.href = '<c:url value="/member/update" />'">내 정보 수정하기</button>
            <button class="action-btn" onclick="location.href = '<c:url value="/member/logout" />'">로그아웃</button>
        </div>
    </c:if>

    <!-- 로그인 폼 -->
    <c:if test="${empty sessionScope.loginEmail}">
        <div class="login-form-container">
            <h2>로그인</h2>
            <form action="<c:url value='/member/login'/>" method="post">
                <p>
                    <input type="text" name="memberEmail" placeholder="이메일" required>
                </p>
                <p>
                    <input type="password" name="memberPassword" placeholder="비밀번호" required>
                </p>
                <p>
                    <input type="submit" value="로그인">
                </p>
            </form>
            <!-- 회원 가입 링크 추가 -->
            <p>
                아직 회원이 아니신가요? <a href="<c:url value='/member/save' />">[ 회원 가입 ]</a>
            </p>
        </div>
    </c:if>

</body>
</html>
