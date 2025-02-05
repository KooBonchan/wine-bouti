<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인삿말입니다</title>
<style>
/* 기본 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: white;
    padding: 0;
}

.container {
    margin-top: 300px; /* 기존 200px에서 여백을 더 추가 */
    width: 90%;
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
}

/* 제목 스타일 */
.title-container {
    text-align: center;
    margin-top: 30px;
}

h2 {
    font-size: 20px;
    color: #2c3e50;
    font-weight: 600;
}

h3 {
    font-size: 16px;
    color: #333;
    margin-bottom: 30px;
}

/* 깃 레포 목록 스타일 */
.repo-container {
    font-size: 14px;
    color: #666;
    text-align: center;
    margin-bottom: 30px;
}

/* 깃 레포 링크 스타일 */
.repo-link {
    color: #3498db; /* 부드러운 파란색 */
    text-decoration: none;
    font-weight: 500;
    display: inline-block;
    padding: 8px 0;
    margin: 5px 0;
    font-size: 18px;
    transition: all 0.3s ease;
    position: relative;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.repo-link:hover {
    color: #2c3e50; /* 마우스를 올렸을 때 색상 변화 */
    text-decoration: none;
    transform: translateY(-2px); /* 부드럽게 위로 올라가는 효과 */
}

.repo-link::after {
    content: "";
    position: absolute;
    width: 100%;
    height: 2px;
    background-color: #3498db; /* 파란색 밑줄 */
    bottom: 0;
    left: 0;
    transform: scaleX(0);
    transform-origin: bottom right;
    transition: transform 0.25s ease-out;
}

.repo-link:hover::after {
    transform: scaleX(1);
    transform-origin: bottom left;
}

/* 프로젝트 이미지 설명 스타일 */
.description-container {
    font-size: 14px;
    color: #333;
    line-height: 1.6;
    text-align: center;
    margin-bottom: 50px;
    padding: 0 20px;
}

/* 링크 스타일 */
a {
    color: #3498db; /* 링크 기본 색상 */
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease;
}

a:hover {
    color: #333; /* 마우스를 올렸을 때 색상 변화 */
    text-decoration: underline;
}



</style>
</head>
<body>
<div class="container">
    <!-- 제목 영역 -->
    <div class="title-container">
        <h2> 안녕하세요 팀 김양구이입니다. </h2>
        <h3> 팀 멤버: 구본찬, 김보민, 이창현, 양정민 </h3>
    </div>

    <!-- 깃 레포 목록 영역 -->
    <div class="repo-container">
        <a href="#" class="repo-link">깃 레포 1</a><br>
        <a href="#" class="repo-link">깃 레포 2</a><br>
        <a href="#" class="repo-link">깃 레포 3</a><br>
        <a href="#" class="repo-link">깃 레포 4</a>
    </div>

    <!-- 프로젝트 이미지 설명 영역 -->
    <div class="description-container">
        이하는 프로젝트 와인부띠의 프로젝트 이미지가 들어갈 예정입니다.
        전문 웹 퍼블리셔가 제작 예정입니다.
    </div>
</div>
</body>
</html>
