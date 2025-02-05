<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- jQuery의 https://를 http://로 변경 -->
    <script src="http://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- CSS 경로 수정 -->
    <title>update</title>
</head>
<body>
	<div class="main-container_update">
    <form action="<c:url value='/member/update'/>" method="post" name="updateForm">
        id: <input type="text" name="memberId" value="${member.memberId}" readonly>
        email: <input type="text" name="email" value="${member.email}" readonly>
        password: <input type="text" name="password" id="password">
        name: <input type="text" name="username" value="${member.username}" readonly>
        age: <input type="text" name="address" value="${member.address}">
        mobile: <input type="text" name="zipcode" value="${member.zipcode}">
        <input type="button" value="수정" onclick="update()">
    </form>
   </div>
</body>
<script>
    const update = () => {
        const passwordDB = '${member.password}';
        const password = document.getElementById("password").value;
        if (passwordDB == password) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
</script>
</html>
