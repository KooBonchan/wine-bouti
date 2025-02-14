<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="form-container">
    <h2>Sign up</h2> 
    <img src="<c:url value='/resources/images/icon/login4.png'/>" alt="login" width="70" height="70">
    <form name="signupForm" action="<c:url value='/member/save' />" method="post">

   
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	  	<div class="input-date-container">
		<br>
		   <p>생일을 입력하세요:  <input type="date" name="birthDate" id="birthDate"></p>
		    <i class="fa fa-calendar"></i> <!-- 달력 아이콘 -->
		<br>	
		</div>

        <p>e-mail: <input type="email" name="email" id="email" placeholder="이메일" onblur="emailCheck()"></p>
        <p id="check-result"></p>

        <p>비밀번호: <input type="password" name="password" id="password" placeholder="6자 이상 입력"></p>

        <p>이름: <input type="text" name="username" placeholder="이름"></p>

        <p>전화번호: <input type="text" name="phoneNumber" id="phoneNumber" placeholder="01012345678"></p>

        <p>주소: <input type="text" name="address" placeholder="서울시 강남구 테헤란로 123"></p>

        <p>우편번호: <input type="text" name="zipcode" placeholder="12345"></p>
		
        <input type="submit" value="회원가입" onclick="return validateForm()" />
    </form>
</div>

<c:url value="/member/email-check" var="emailCheckUrl" />

<script>
    // 이메일 중복 체크
    function emailCheck() {
        const email = document.getElementById("email").value;
        const checkResult = document.getElementById("check-result");

        // 이메일이 비어있는 경우 경고 메시지 출력
        if (email.trim() === "") {
            checkResult.className = 'red';
            checkResult.innerHTML = "이메일을 입력해주세요.";
            return;
        }

        // 이메일 형식 체크
        const emailPattern = /\S+@\S+\.\S+/;
        if (!emailPattern.test(email)) {
            checkResult.className = 'red';
            checkResult.innerHTML = "유효한 이메일 형식을 입력해주세요.";
            return;
        }

        // 서버에 중복 이메일 확인 요청
        $.ajax({
            type: "post",
            url: "${emailCheckUrl}",
            data: "memberEmail="+email,
            success: function(res) {
                console.log("서버 응답:", res); // 서버 응답 로그 확인
                if (res === "ok") {
                    checkResult.className = 'green';
                    checkResult.innerHTML = "사용가능한 이메일";
                } else {
                    checkResult.className = 'red';
                    checkResult.innerHTML = "이미 사용중인 이메일";
                }
            },
            error: function(err) {
                console.log("에러발생", err); // 서버 오류 로그 확인
            }
        });
    }

    // 비밀번호 및 기타 필드 유효성 검사
    function validateForm() {
        const email = document.signupForm.email.value;
        const password = document.signupForm.password.value;
        const username = document.signupForm.username.value;
        const phoneNumber = document.signupForm.phoneNumber.value;
        const address = document.signupForm.address.value;
        const zipcode = document.signupForm.zipcode.value;

        const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
        const phonePattern = /^010[0-9]{8}$/;  // 010으로 시작하는 전화번호만 허용
        const addressPattern = /^[a-zA-Z0-9가-힣\s,.\-#]+$/;
        const zipcodePattern = /^[0-9]{5}$/;

        // 이메일 유효성 검사
        if (!email || !/\S+@\S+\.\S+/.test(email)) {
            alert("유효한 이메일을 입력해주세요.");
            return false;
        }

        // 비밀번호 유효성 검사
        if (!password || !passwordPattern.test(password)) {
            alert("비밀번호는 최소 6자 이상이어야 하며, 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.");
            return false;
        }

        // 이름 유효성 검사
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

        // 생년월일 유효성 검사 (checkAge()는 생년월일을 19세 이상으로 체크)
        const birthDate = document.signupForm.birthDate.value;
        if (!birthDate || !checkAge()) {
            alert("19세 이상이어야 회원가입이 가능합니다.");
            return false;
        }

        document.signupForm.submit();
        return true;
    }

    // 생년월일 19세 이상 체크
    function checkAge() {
        const birthDate = document.getElementById("birthDate").value;
        const birthYear = new Date(birthDate).getFullYear();
        const currentYear = new Date().getFullYear();

        const age = currentYear - birthYear;

        if (age >= 19) { //25년 기준 2006년 19세
            return true;
        } else {
            alert("19세 이상이어야 회원가입이 가능합니다.");
            return false;
        }
    }

    // 회원가입 완료 후 알림창 표시
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('success') === 'true') {
            alert("회원가입이 성공적으로 완료되었습니다!");
        }
    };
</script>
