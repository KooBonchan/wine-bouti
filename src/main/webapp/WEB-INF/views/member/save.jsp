<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- jQuery의 https://를 http://로 변경 -->
    <script src="http://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- CSS 경로 수정 -->
    <title>회원가입</title>
    <%-- <link rel="stylesheet" href="<c:url value='/resources/css/save.css' />" /> --%>
</head>
<body>
    <!-- 폼을 감싸는 컨테이너 추가 -->
    <div class="form-container">
        <h2>회원가입</h2> 
        <form action="<c:url value='/member/save' />" method="post">
            <p>e-mail: <input type="text" name="memberEmail" placeholder="이메일"
                    id="memberEmail" onblur="emailCheck()"></p>
            <p id="check-result"></p>

            <p>비밀번호 : <input type="text" name="memberPassword" placeholder="비밀번호"></p>
            <p>이   름 : <input type="text" name="memberName" placeholder="이름"></p>
            <p>나   이 : <input type="text" name="memberAge" placeholder="나이"></p>
            <p>전화번호 : <input type="text" name="memberMobile" placeholder="전화번호"></p>
            <input type="submit" value="회원가입">
        </form>
    </div>

    <script>
        // 이메일 입력값을 가져오고,
        // 입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한 후
        // 사용 가능 여부를 이메일 입력창 아래에 표시
        const emailCheck = () => {
            const email = document.getElementById("memberEmail").value;
            const checkResult = document.getElementById("check-result");
            console.log("입력한 이메일", email);
            $.ajax({
                type: "post",
                url: "/member/email-check",
                data: {
                    "memberEmail": email
                },
                success: function(res) {
                    console.log("요청성공", res);
                    if (res == "ok") {
                        console.log("사용가능한 이메일");
                        checkResult.className = 'green';
                        checkResult.innerHTML = "사용가능한 이메일";
                    } else {
                        console.log("이미 사용중인 이메일");
                        checkResult.className = 'red';
                        checkResult.innerHTML = "이미 사용중인 이메일";
                    }
                },
                error: function(err) {
                    console.log("에러발생", err);
                }
            });
        }
    </script>
</body>
</html>
