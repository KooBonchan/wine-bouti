<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>회원가입</title>
    <link rel="stylesheet" href="<c:url value='/resources/style/member/save.css' />" />
    
    <!-- jQuery UI 추가 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <div class="form-container">
        <h2>Sign up</h2> 
        <img src="<c:url value='/resources/images/icon/login4.png'/>" alt="login" width="70" height="70">
        <form action="<c:url value='/member/save' />" method="post">
            <p>e-mail: <input type="email" name="email" id="email" placeholder="이메일" onblur="emailCheck()"></p>
            <p id="check-result"></p>
            <p>비밀번호 : <input type="password" name="password" placeholder="비밀번호"></p>
            <p>이   름 : <input type="text" name="username" placeholder="이름"></p>
            <p>전화번호 : <input type="text" name="phone" placeholder="번호"></p>
            <p>주   소 : <input type="text" name="address" placeholder="주소"></p>
            <p>우편번호 : <input type="text" name="zipcode" placeholder="우편번호"></p>
            <input type="submit" value="회원가입">
        </form>
    </div>

    <c:url value="/member/email-check" var="emailCheckUrl" />
    
    <script>
        function emailCheck() {
            const email = document.getElementById("email").value;
            const checkResult = document.getElementById("check-result");
            if (email.trim() === "") {
                checkResult.className = 'red';
                checkResult.innerHTML = "이메일을 입력해주세요.";
                return;
            }
            $.ajax({
                type: "post",
                url: "${emailCheckUrl}",
                data: {"memberEmail": email},
                success: function(res) {
                    if (res == "ok") {
                        checkResult.className = 'green';
                        checkResult.innerHTML = "사용가능한 이메일";
                    } else {
                        checkResult.className = 'red';
                        checkResult.innerHTML = "이미 사용중인 이메일";
                    }
                },
                error: function(err) {
                    console.log("에러발생", err);
                }
            });
        }

        // 회원가입 완료 후 알림창 표시
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('success') === 'true') {
                alert("회원가입이 성공적으로 완료되었습니다!");
            }
        };
    </script>
</body>
</html>
