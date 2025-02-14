<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!-- 현재 상품 ID 저장 -->
<input type="hidden" id="productId"
	value="<c:out value='${productId}' default='0' />">

<div id="review-container">
	<c:choose>
		<c:when test="${empty reviews}">
			<p>아직 작성된 리뷰가 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach var="review" items="${reviews}">
				<div class="review-box" id="review-${review.reviewId}" data-review-id="${review.reviewId }">
					<div>
						<span class="star-rating"> <c:forEach begin="1"
								end="${review.star}">
					        ★
					    </c:forEach>
						</span> <span>${review.userName}</span> <span><fmt:formatDate
								value="${review.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
					</div>

					<!--리뷰 제목 -->
					<h3 class="review-title">${review.title}</h3>



					<!-- 썸네일 이미지 출력 -->
					<p>${review.content}</p>
					<c:if test="${not empty review.imagePath}">
						<a href="<c:url value='/api/image/review/${review.imagePath}' />"
							target="_blank"> <img class="review-thumbnail"
							src="<c:url value='/api/image/thumbnail/review/${review.imagePath}' />"
							onerror="this.style.display='none'">
						</a>
					</c:if>


					<!-- 관리자 답글 -->
					<c:if test="${not empty review.response}">
						<div class="review-response">
							<strong>winebouti :</strong>
							<p>${review.response}</p>

							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="delete-button-container">
									<button class="deleteResponse"
										data-review-id="${review.reviewId}">답글 삭제</button>
								</div>
							</sec:authorize>

						</div>
					</c:if>


					<!-- ✅ 관리자 답글 입력창 -->
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div class="response-form" id="response-form-${review.reviewId}">
							<textarea id="response-${review.reviewId}" placeholder="답글 입력">${review.response}</textarea>
							<button class="submitResponse"
								data-review-id="${review.reviewId}">답글 등록</button>
						</div>
					</sec:authorize>



					<!-- 삭제 -->
					<button class="delete-btn" data-review-id="${review.reviewId}">삭제</button>

					<!-- 수정 -->
					<button class="edit-btn"
						onclick="location.href='<c:url value="/review/edit/${review.reviewId}" />'">
						수정</button>


				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<!-- 더보기 버튼 -->
<button id="load-more">더보기</button>

<script>
$(document).ready(function () {
    let page = 2;
    let totalPages = "${totalPages}" !== "" ? parseInt("${totalPages}") : 1;
    let productId = $("#productId").val();

    console.log("Product ID:", productId);

    if (!productId) {
        alert("상품 ID가 유효하지 않습니다!");
        return;
    }

    /* 리뷰  */
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
                    
                    let imageHtml = "";
                    if (review.thumbnailPath) {
                        imageHtml = `
                            <a href="/upload/review/${review.imagePath}" target="_blank">
                                <img class="review-thumbnail" src="/upload/review/thumbnail/${review.thumbnailPath}" 
                                     alt="리뷰 이미지" onerror="this.style.display='none'">
                            </a>
                        `;
                    }

                    let reviewHtml = `
                        <div class="review-box" id="review-<c:out value='${review.reviewId}'/>">
                            <div>
                                <span>${'★'.repeat(review.star)}</span>
                                <span>${review.userName}</span>
                                <span>${review.writeDate}</span>
                            </div>
                            <h3 class="review-title">${review.title}</h3>
                            <p>${review.content}</p>
                            ${imageHtml} <!-- 썸네일 추가 -->
                            <button class="delete-btn" onclick="deleteReview(${review.reviewId})">삭제</button>
                        </div>
                    `;
                    $("#review-container").append(reviewHtml);
                });

                page++;
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
    
    function updateReviewCount() {
        let productId = $("#productId").val(); // 상품 ID 가져오기

        $.ajax({
            url: `/review/${productId}`,
            type: "GET",
            dataType: "json",
            success: function (data) {
                console.log("📌 [updateReviewCount] 응답 데이터:", data); // 디버깅 로그 추가

                let reviewCount = data.reviewCount; // JSON 응답에서 reviewCount 가져오기
                $("#reviewCount").text('총 리뷰 ${reviews.size()}개'); // 리뷰 개수 업데이트
            },
            error: function (xhr) {
                console.error("⛔ [updateReviewCount] 오류 발생:", xhr.responseText);
                alert("리뷰 개수를 불러오는 중 오류가 발생했습니다.");
            }
        });
    }


    
 // 리뷰 삭제 함수
    function deleteReview(reviewId) {

        if (!confirm("정말 삭제하시겠습니까?")) {
            return; 
        }

        $.ajax({
            type: "DELETE",
            url: "<c:url value='/review/' />"+ reviewId,
            dataType: "text",
            success: function (result) {
                alert("리뷰가 삭제되었습니다.");
                $("#review-" + reviewId).fadeOut(300, function () {
                    $(this).remove();
                });
            },
            error: function (xhr, status, er) {
                console.log("삭제 실패:", er);
                alert("삭제 실패: " + er);
            },
        });
    }

    // 삭제 버튼 클릭 이벤트 (이벤트 리스너 수정)
    $(document).on("click", ".delete-btn", function () {
        let reviewId = $(this).data("review-id"); // 버튼의 data-review-id 값 가져오기
        console.log("삭제 버튼 클릭됨, reviewId:", reviewId); // 확인 로그
        deleteReview(reviewId); // 함수 호출
    });


    <c:url value="/review/response/" var="responseUrl" />
    $(document).on("click", ".submitResponse", function() {
        var reviewId = $(this).data("review-id");
        var responseText = $("#response-" + reviewId).val();
    
        console.log("🚀 등록 버튼 클릭됨! reviewId:", reviewId, "response:", responseText);
    
        $.ajax({
            type: "POST",
            url: "${responseUrl}",
            contentType: "application/json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            data: JSON.stringify({
                reviewId: reviewId,
                response: responseText
            }),
            success: function(data) {
                console.log("✅ 서버 응답:", data);
                alert("답글이 등록되었습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                console.error("❌ AJAX 오류:", xhr.responseText);
                alert("답글 등록에 실패했습니다.");
            }
        });
    });
    
    //삭제
    $(document).on("click", ".deleteResponse", function() {
        var reviewId = $(this).data("review-id");
    
        console.log("🚀 삭제 버튼 클릭됨! reviewId:", reviewId);
    
        $.ajax({
            type: "DELETE",
            url: "${responseUrl}" + reviewId,
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(data) {
                console.log("✅ 서버 응답:", data);
                alert("답글이 삭제되었습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                console.error("❌ AJAX 오류:", xhr.responseText);
                alert("답글 삭제에 실패했습니다.");
            }
        });
    });
    
    
        // 페이지 로드 시 답변 불러오기
    $(".review-box").each(function () {
        let reviewId = $(this).data("review-id");
        loadResponse(reviewId);
    });

});


function loadResponse(reviewId) {
    console.log(`📌 [Ajax] 리뷰 ID 확인:`, reviewId); // reviewId 값 확인

    $.get("${responseUrl}" + reviewId)
        .done(function (data) {
            console.log(`✅ [Ajax] 리뷰(${reviewId}) 답변 응답:`, data);
            let responseContainer = $(`#reviewResponse-${reviewId}`);
            responseContainer.html(data === "답변이 없습니다." ? "<p>아직 답변이 없습니다.</p>" : `<strong>관리자 답변:</strong><p>${data}</p>`);
        })
        .fail(function (xhr) {
            console.error(`⛔ [Ajax] 답변 불러오기 실패 - 상태 코드: ${xhr.status}, 응답:`, xhr.responseText);
            alert("답변을 불러오는 중 오류가 발생했습니다.");
        });
}




</script>
