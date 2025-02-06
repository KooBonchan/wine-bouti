<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 현재 상품 ID 저장 -->
<input type="hidden" id="productId" value="<c:out value='${productId}' default='0' />">

<div id="review-container">
	<c:choose>
		<c:when test="${empty reviews}">
			<p>아직 작성된 리뷰가 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach var="review" items="${reviews}">
				<div class="review-box" id="review-${review.reviewId}">
					<div>
						<c:forEach begin="1" end="${review.star}">
        						★
    					</c:forEach>
						<span>${review.userName}</span> 
						<span><fmt:formatDate value="${review.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</div>
					
					<!--리뷰 제목 -->
                   <%--  <h3 class="review-title">${review.title}</h3>  --%>
                   
                   
					
					<p>${review.content}</p>
					<c:if test="${not empty review.imagePath}">
						<img class="review-image" src="/upload/${review.imagePath}"
							alt="리뷰 이미지" onerror="this.style.display='none'">
					</c:if>
					
					<!-- 삭제 -->
					<button class="delete-btn"
						onclick="deleteReview(${review.reviewId})">삭제</button>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<!-- 더보기 버튼 -->
<button id="load-more">더보기</button>

<script>
$(document).ready(function () {
    let page = 2; // 첫 페이지(1)는 이미 불러왔으므로 2부터 시작
    let totalPages = "${totalPages}" !== "" ? parseInt("${totalPages}") : 1;
    let productId = $("#productId").val(); 

    console.log("Product ID:", productId); // 디버깅

    if (!productId) {
        alert("상품 ID가 유효하지 않습니다!");
        return;
    }

    function loadMoreReviews() {
        if (page > totalPages) {
            $("#load-more").hide();
            return;
        }

        $.ajax({
            url: "/review/list",
            type: "GET",
            data: { page: page, productId: productId },
            dataType: "json",
            success: function (response) {
                response.reviews.forEach(review => {
                    let reviewHtml = `
                        <div class="review-box" id="review-${review.reviewId}">
                            <div>
                                <span>${'★'.repeat(review.star)}</span>
                                <span>${review.userName}</span>
                                <span>${review.writeDate}</span>
                            </div>
                            <p>${review.content}</p>
                            ${review.imagePath ? '<img class="review-image" src="/upload/${review.imagePath}" alt="리뷰 이미지">' : ''}
                            <button class="delete-btn" onclick="deleteReview(${review.reviewId})">삭제</button>
                        </div>
                    `;
                    $("#review-container").append(reviewHtml);
                });

                page++; // 페이지 증가
                if (page > totalPages) {
                    $("#load-more").hide();
                }
            },
            error: function () {
                alert("리뷰를 불러오는 중 오류가 발생했습니다.");
            }
        });
    }

    $("#load-more").click(function () {
        loadMoreReviews();
    });

    window.deleteReview = function(reviewId) {
        if (!confirm("정말 삭제하시겠습니까?")) return;

        $.ajax({
            url: "/review/delete/" + reviewId,
            type: "DELETE",
            success: function (response) {
                alert("리뷰가 삭제되었습니다!");
                $("#review-" + reviewId).remove();  //UI에서 삭제
            },
            error: function (xhr) {
                alert("리뷰 삭제 중 오류가 발생했습니다.");
            }
        });
    };

</script>
