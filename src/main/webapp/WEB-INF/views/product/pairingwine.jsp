<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>페어링 와인 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        .wine-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .wine-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 30%;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.2s;
        }

        .wine-item:hover {
            transform: translateY(-10px);
        }

        .wine-item img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .wine-item h3 {
            margin-top: 10px;
            font-size: 18px;
            color: #e74c3c;
        }

        .wine-item p {
            font-size: 14px;
            color: #7f8c8d;
        }

        .wine-item a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #e74c3c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .wine-item a:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>페어링 와인 목록</h1>
        <div class="wine-list">
            <!-- 레드 와인 목록 반복 시작 -->
            <c:forEach var="wine" items="${redWines}">
                <div class="wine-item">
                    <!-- 와인 이미지 -->
                    <img src="${wine.imageUrl}" alt="${wine.name}">
                    <!-- 와인 이름 -->
                    <h3>${wine.name}</h3>
                    <!-- 와인 가격 -->
                    <p>가격: ${wine.price}원</p>
                    <!-- 와인 상세 페이지로 링크 -->
                    <a href="/product/details/${wine.id}">상세보기</a>
                </div>
            </c:forEach>
            <!-- 레드 와인 목록 반복 끝 -->
        </div>
    </div>

</body>
</html>
