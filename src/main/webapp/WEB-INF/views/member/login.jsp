
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>로그인</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/save.css' />" />
</head>
<body>
    <!-- 폼을 감싸는 컨테이너 추가 -->
    <div class="login-form-container">
        <h2>로그인</h2> <!-- 제목을 h2 태그로 감쌈 -->
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
    </div>
</body>
</html>
