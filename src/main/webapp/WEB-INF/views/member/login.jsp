<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value='/resources/style/member/save.css' />" />
</head>
<body>
<div class="login-form-container" style="margin-top: 50px;">
    <h2>login</h2>
    <img src="<c:url value='/resources/images/icon/login2.png'/>" alt="login" width="70" height="70">
    <form action="<c:url value='/member/login'/>" method="post">
        <p>
            <input type="text" name="email" placeholder="이메일" required>
        </p>
        <p>
            <input type="password" name="password" placeholder="비밀번호" required>
        </p>
        <p>
            <input type="submit" value="로그인">
        </p>
    </form>
    <p>
        아직 회원이 아니신가요? <a href="<c:url value='/member/save' />">[ 회원 가입 ]</a>
    </p>
</div>
