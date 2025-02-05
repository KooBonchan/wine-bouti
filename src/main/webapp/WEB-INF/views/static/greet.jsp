<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='/resources/style/greet.css?ver=1.0' />" />

<html>
<head>
    <!-- jQuery의 https://를 http://로 변경 -->
    <script src="http://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<!DOCTYPE html>
<meta charset="UTF-8">
<title>인삿말입니다</title>
    

</head>
<body>
  <div class="title">
<img src="<c:url value='/resources/images/logo/wine.png' />" alt="Company Logo" width="200" height="169">

        
    <div class="subtitle">
        안녕하세요 팀 [김양구이]입니다 :)
    </div>
</div>

  <div class="container">
      <div class="card">
        <strong>구본찬</strong>
        <div class="work">
		<p>
          <ul>
            <li>버전 충돌 해결</li>
            <li>주문/결제 창 제작</li>
          	<li>OpenAPI 연결</li>
          	  		<li></li>
          </ul>
          <div class="qr_code">깃코드</div>
        </div>
      </div>
      <div class="card">
        <strong>김보민</strong>  
          <div class="work">
		<p>
          <ul>
            <li>기획/디자인 작업</li>
            <li>웹디자인</li>
            <li>회원 가입 제작</li>
          	<li>Spring Security</li>
            <li></li>
          </ul>
          <div class="qr_code">깃코드</div>
        </div>
      </div>
      <div class="card">
        <strong>양정민</strong>
         <div class="work">
		<p>
          <ul>
            <li>기획/기획서 작성</li>
            <li>리뷰 제작</li>
          	<li>RESTful, Ajax</li>
          	<li>Controller, Routing</li>
          	<li></li>
          </ul>
          <div class="qr_code">깃코드</div>
        </div>
      </div>
      <div class="card">
        <strong>이창현</strong>  
         <div class="work">
   		<p>
          <ul>
           <li>상품 데이터 모델링</li>
            <li>시장 조사</li>
          	<li>DB, VO</li>
          	<li>상품 리스트 제작</li>
          	<li>MyBatis</li>
          </ul>
          <div class="qr_code">깃코드</div>
        </div>
      </div>
      <div class="card">
        <strong>이승관</strong>
         <div class="work">
		<p>
          <ul>
           <li>스케쥴 관리</li>
            <li>프로젝트 매니징</li>
          	<li></li>
          	<li></li>
          	<li></li>
          </ul>
          <div class="qr_code">깃코드</div>
        </div>
      </div>
</body>
</html>
