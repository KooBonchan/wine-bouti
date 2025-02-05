<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>update</title>
    <link rel="stylesheet" href="<c:url value='/resources/style/member/update.css' />" />
</head>
<body>
	<div class="main-container_update">
        <form action="<c:url value='/member/update'/>" method="post" name="updateForm">
           	<div class="title">회원정보 수정</div>
            id: <input type="text" name="memberId" value="${member.memberId}" readonly>
            email: <input type="text" name="email" value="${member.email}" readonly>
            password: <input type="password" name="password" id="password">
            이름: <input type="text" name="username" value="${member.username}" readonly>
            주소: <input type="text" name="address" value="${member.address}">
            우편번호: <input type="text" name="zipcode" value="${member.zipcode}">
            <input type="button" value="수정" onclick="update()">
        </form>
   </div>
</body>
<script>
    function update() {
        const password = document.getElementById("password").value;

        if (!password) {
            alert("비밀번호를 입력해주세요.");
            return;
        }

        document.forms["updateForm"].submit();
    }

    window.onload = function() {
        const success = "<c:out value='${updateSuccess}' />";
        if (success === "true") {
            alert("정보가 수정되었습니다.");
        }
    };
</script>
</html>
