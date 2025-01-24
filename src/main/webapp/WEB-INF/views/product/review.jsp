<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>리뷰 목록</title>
</head>
<body>
    <h1>리뷰 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviews}">
                <tr>
                    <td>${review.review_id}</td>
                    <td>${review.user_name}</td>
                    <td>${review.content}</td>
                    <td>${review.created_at}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
