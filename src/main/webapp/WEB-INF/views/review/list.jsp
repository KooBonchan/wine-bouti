<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 목록</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
}

h1 {
	text-align: center;
	color: #333;
}

.review-box {
	border-bottom: 1px solid #ddd;
	padding: 15px;
	margin-bottom: 15px;
	cursor: pointer;
	position: relative;
}

.review-box:hover {
	background-color: #f9f9f9;
}

.review-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.review-stars {
	color: gold;
	font-size: 16px;
}

.review-user {
	font-weight: bold;
}

.review-date {
	color: gray;
	font-size: 14px;
}

.review-content {
	margin-top: 10px;
	color: #555;
}

.review-image {
	margin-top: 10px;
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 5px;
}

.review-response {
	margin-top: 10px;
	padding: 10px;
	background-color: #f3f3f3;
	border-radius: 5px;
	font-size: 14px;
	color: #333;
}

/* 삭제 버튼 스타일 */
.delete-btn {
	position: absolute;
	right: 10px;
	top: 10px;
	padding: 5px 10px;
	background-color: #ff6b6b;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 12px;
}

.delete-btn:hover {
	background-color: #ff6b6b;
}

.pagination {
	margin-top: 20px;
	text-align: center;
}

.pagination a {
	display: inline-block;
	padding: 8px 12px;
	margin: 0 4px;
	color: #007bff;
	text-decoration: none;
	border: 1px solid #007bff;
	border-radius: 4px;
}

.pagination a.active {
	background-color: #007bff;
	color: white;
	border: none;
}

.pagination a:hover {
	background-color: #0056b3;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<!-- <h1>리뷰 목록</h1> -->

		<c:choose>
			<c:when test="${empty reviews}">
				<p>아직 작성된 리뷰가 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="review" items="${reviews}">
					<div class="review-box" id="review-${review.reviewId}">
						<div class="review-header">
							<span class="review-stars"> <c:forEach begin="1"
									end="${review.star}">★</c:forEach>
							</span> <span class="review-user">${review.userName}</span> <span
								class="review-date">${review.writeDate}</span>
						</div>

						<p class="review-content">${review.content}</p>

						<c:if test="${not empty review.imagePath}">
							<img class="review-image"
								src="${pageContext.request.contextPath}/uploads/${review.imagePath}"
								alt="리뷰 이미지">
						</c:if>

						<c:if test="${not empty review.response}">
							<div class="review-response">
								<p>${review.response}</p>
							</div>
						</c:if>

						<!-- 삭제 버튼 추가 (모든 사용자에게 보이도록 설정) -->
						<button class="delete-btn"
							onclick="deleteReview(${review.reviewId})">삭제</button>
					</div>
				</c:forEach>

				<!-- 페이지네이션 -->
				<div class="pagination">
					<c:if test="${currentPage > 1}">
						<a
							href="${pageContext.request.contextPath}/review/list?page=${currentPage - 1}">«
							이전</a>
					</c:if>

					<c:forEach begin="1" end="${totalPages}" var="pageNum">
						<a
							href="${pageContext.request.contextPath}/review/list?page=${pageNum}"
							class="${currentPage == pageNum ? 'active' : ''}">${pageNum}</a>
					</c:forEach>

					<c:if test="${currentPage < totalPages}">
						<a
							href="${pageContext.request.contextPath}/review/list?page=${currentPage + 1}">다음
							»</a>
					</c:if>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<script>
	// AJAX 리뷰 삭제 기능
	function deleteReview(reviewId) {
    console.log("삭제 요청된 reviewId:", reviewId); // ✅ 값 확인용 로그

    if (!confirm("정말 삭제하시겠습니까?")) return;

    fetch("${pageContext.request.contextPath}/review/delete/" + reviewId, {
        method: "DELETE"
    })
    .then(response => {
        if (response.ok) {
            alert("리뷰가 삭제되었습니다.");
            document.getElementById("review-" + reviewId).remove(); // 화면에서 즉시 삭제
        } else {
            alert("리뷰 삭제에 실패했습니다.");
        }
    })
    .catch(error => console.error("삭제 오류:", error));
	}
	</script>
</body>
</html>
