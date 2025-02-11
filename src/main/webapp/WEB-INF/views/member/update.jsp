<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>update</title>
    <link rel="stylesheet" href="<c:url value='/resources/style/member/update.css' />" />
    <script>
               
    function validateForm() {
        const username = document.updateForm.username.value;  // signupForm을 updateForm으로 변경
        const phoneNumber = document.updateForm.phoneNumber.value;  
        const address = document.updateForm.address.value; 
        const zipcode = document.updateForm.zipcode.value;  

        const phonePattern = /^[0-9]{10,11}$/;
        const addressPattern = /^(?=.*[a-zA-Z가-힣])(?=.*\d)[a-zA-Z0-9가-힣\s,.-]+$/;
        const zipcodePattern = /^[0-9]{5}$/;

        // 이름 유효성 검사 (빈 값 체크)
        if (!username) {
            alert("이름을 입력해주세요.");
            return false;
        }

        // 전화번호 유효성 검사 (010xxxxxxx 형식)
        if (!phoneNumber || !phonePattern.test(phoneNumber)) {
            alert("전화번호는 010xxxxxxxx 형식이어야 합니다.");
            return false;
        }

        // 주소 유효성 검사 (글자와 숫자 각각 최소 하나 이상 포함)
        if (!address || !addressPattern.test(address)) {
            alert("주소는 반드시 글자와 숫자가 포함되어야 합니다.");
            return false;
        }

        // 우편번호 유효성 검사 (5자리 숫자)
        if (!zipcode || !zipcodePattern.test(zipcode)) {
            alert("우편번호는 5자리 숫자여야 합니다.");
            return false;
        }

        document.updateForm.submit();  // updateForm 제출
        return true;
    }


        function update() {
            if (!validateForm()) {
                return; // 유효성 검사에 실패하면 폼을 제출하지 않음
            }
            document.forms["updateForm"].submit(); // 모든 입력이 유효하면 폼 제출
        }

        window.onload = function() {
            const success = "<c:out value='${updateSuccess}' />";
            if (success === "true") {
                alert("정보가 수정되었습니다.");
            }
        };
    </script>
</head>
<body>
	<div class="main-container_update">
        <form action="<c:url value='/member/update'/>" method="post" name="updateForm">
           	<div class="title">회원정보 수정</div>
            <input type="hidden" name="memberId" value="<sec:authentication property='principal.memberVO.memberId'/>">
            
            <div>
                <label for="email">email:</label>
                <input type="text" value="<sec:authentication property='principal.memberVO.email'/>" disabled>
                <input type="hidden" name="email" value="<sec:authentication property='principal.memberVO.email'/>">
            </div>
            
            <div>
                <label for="password">password:</label>
                <input type="password" name="password" id="password" placeholder="6자 이상 입력">
            </div>
          
            <div>
                <label for="username">이름:</label>
                <input type="text" name="username" value="<sec:authentication property='principal.memberVO.username'/>" placeholder="홍길동">
            </div>
            
            <div>
                <label for="phoneNumber">전화번호:</label>
                <input type="text" name="phoneNumber" id="phoneNumber" value="<sec:authentication property='principal.memberVO.phoneNumber'/>" placeholder="010-1234-5678">
            </div>
            
            <div>
                <label for="address">주소:</label>
                <input type="text" name="address" value="<sec:authentication property='principal.memberVO.address'/>" placeholder="서울시 강남구 테헤란로 123">
            </div>
            
            <div>
                <label for="zipcode">우편번호:</label>
                <input type="text" name="zipcode" value="<sec:authentication property='principal.memberVO.zipcode'/>" placeholder="12345">
            </div>
            
            <input type="button" value="수정" onclick="update()">
        </form>
   </div>
</body>
</html>
