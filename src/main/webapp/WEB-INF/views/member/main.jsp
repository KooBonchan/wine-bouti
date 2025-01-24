<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <style>
        /* 페이지 전체 배경과 글꼴 설정 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 메인 컨테이너 스타일 */
        .main-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        /* 제목 스타일 */
        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        /* 버튼 공통 스타일 */
        .action-btn {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* 버튼 hover 상태 */
        .action-btn:hover {
            background-color: #0056b3;
        }

        /* 버튼 비활성화 상태 */
        .action-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <!-- 전체 페이지를 감싸는 컨테이너 -->
    <div class="main-container">
        <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>

        <!-- 내 정보 수정하기 버튼 -->
        <button class="action-btn" onclick="location.href = '<c:url value="/member/update" />'">내 정보 수정하기</button>

        <!-- 로그아웃 버튼 -->
        <button class="action-btn" onclick="location.href = '<c:url value="/member/logout" />'">로그아웃</button>
    </div>
</body>
</html>
