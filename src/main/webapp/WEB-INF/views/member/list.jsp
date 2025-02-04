<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원 목록</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/save.css'/>">

</head>
<body>
    <div class="main-container">
        <h2>회원 목록</h2>
        <table class="member-table">
            <thead>
                <tr>
                    <th>id</th>
                    <th>email</th>
                    <th>password</th>
                    <th>name</th>
                    <th>age</th>
                    <th>mobile</th>
                    <th>조회</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${memberList}" var="member">
                    <tr>
                        <td>${member.memberId}</td>
                        <td>
                            <a href="<c:url value='/ex01/member?memberId=${member.memberId}' />" class="member-link">${member.memberEmail}</a>
                        </td>
                        <td>${member.memberPassword}</td>
                        <td>${member.memberName}</td>
                        <td>${member.memberAge}</td>
                        <td>${member.memberMobile}</td>
                        <td>
                            <a href="<c:url value='/ex01/member?memberId=${member.memberId}' />" class="btn btn-view">조회</a>
                        </td>
                        <td>
                            <button class="btn btn-delete" onclick="deleteMember('${member.memberId}')">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        const deleteMember = (memberId) => {
            if (confirm("회원 정보를 삭제하시겠습니까?")) {
                location.href = "<c:url value='/ex01/member/delete?memberId=' />" + memberId;
            }
        }
    </script>
</body>
</html>
