<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value='/resources/style/member/save.css' />" />
    <script>
        function validateForm() {
            var email = document.forms["loginForm"]["email"].value;
            var password = document.forms["loginForm"]["password"].value;
            
            // 이메일 유효성 검사
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                alert("유효한 이메일 주소를 입력해주세요.");
                return false;
            }

            // 비밀번호 유효성 검사
            if (password.length < 6) {
                alert("비밀번호는 최소 6자 이상이어야 합니다.");
                return false;
            }

            return true; // 유효성 검사 통과
        }
    </script>
</head>
<body>
<div class="login-form-container" style="margin-top: 50px;">
    <h2>login</h2>
    <img src="<c:url value='/resources/images/icon/login2.png'/>" alt="login" width="70" height="70">
    
    <!-- 회원가입 성공 메시지 -->
    <c:if test="${param.success == 'true'}">
        <div class="success-message">
            <p class="message-title">회원가입 완료!</p>
            <p class="message-subtitle">로그인 해주세요.</p>
        </div>
    </c:if>

    <!-- 폼 제출 시 validateForm() 함수 호출 -->
    <form name="loginForm" action="<c:url value='/member/login'/>" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <p>
            <input type="text" name="email" placeholder="이메일" required>
        </p>
        <p>
            <input type="password" name="password" placeholder="비밀번호" required>
        </p>
        <p>
            <input type="submit" value="로그인">
        </p>
    </form>
    <p>
        아직 회원이 아니신가요? <a href="<c:url value='/member/save' />">[ 회원 가입 ]</a>
    </p>
</div>
</body>
</html>
