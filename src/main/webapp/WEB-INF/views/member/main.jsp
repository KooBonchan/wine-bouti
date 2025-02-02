<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <link rel="stylesheet" href="<c:url value='/resources/style/member/save.css' />" />
</head>
<body>
    <!-- 전체 페이지를 감싸는 컨테이너 -->
    <div class="main-container_hello">
        <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>

        <!-- 내 정보 수정하기 버튼 -->
        <button class="action-btn" onclick="location.href = '<c:url value="/member/update" />'">내 정보 수정하기</button>

        <!-- 로그아웃 버튼 -->
        <button class="action-btn" onclick="location.href = '<c:url value="/member/logout" />'">로그아웃</button>
    </div>
</body>
</html>
