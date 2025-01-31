<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세 페이지</title>

<!-- CSS 파일 연결 -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/style/product/details.css' />">
</head>
<body>
	<div class="container">
		<!-- 헤더 -->
		<header>
			<h1>Grapes&Wine</h1>
		</header>

		<!-- 상품 상세 정보 섹션 -->
		<main class="product-section">
			<!-- 상품 이미지 및 기본 정보 -->
			<div class="product-detail">
				<div class="image-wrapper">
					<img
						src="<c:url value='/resources/images/${product.productImageName}' />"
						alt="상품 이미지">
				</div>
				<div class="product-info">
					<h2>${product.koreanName}
						<span>${product.alcoholContent}%</span>
					</h2>
					<p>${product.origin}</p>
					<p class="price">${product.originalPrice}원</p>

					<!-- 상품 속성 (바디, 산도, 당도, 탄닌) -->
					<div class="attributes">
						<span>바디: ${product.body}</span> <span>산도:
							${product.acidity}</span> <span>당도: ${product.sweetness}</span> <span>탄닌:
							${product.tannin}</span>
					</div>

					<!-- 버튼 섹션 -->
					<div class="action-buttons">
						<button class="btn add-to-cart">장바구니</button>
						<button class="btn buy-now">바로 구매하기</button>
					</div>
				</div>
			</div>

			<!-- 탭 네비게이션 -->
			<div class="tabs">
				<button class="tablinks active" onclick="openTab(event, 'Product')">Product</button>
				<button class="tablinks" onclick="openTab(event, 'Review')">Review
					(0)</button>
			</div>

			<!-- Product 탭 -->
			<div id="Product" class="tabcontent active">
				<h3>상품 상세 정보</h3>
				<p>이곳에 상품에 대한 상세 설명을 추가하세요.</p>
			</div>


			<!-- Review 탭 -->
			<div id="Review" class="tabcontent">
				<!-- 리뷰 섹션 -->
				<section>

					<!-- 리뷰 목록 -->
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
			</div>

			<!-- 리뷰 작성 폼 -->
			<form name="form-reply" id="form-reply" action="/reviews/create"
				method="POST" enctype="multipart/form-data" class="row">
				<div class="col-12 mb-1 mt-3">
					<span id="writer">Leave your review</span>
				</div>
				<!-- 추가 필드와 파일 업로드 영역 필요 -->
			</form>

			<!-- 이미지 확대 모달 창 -->
			<div id="imageModal" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Image View</h5>
							<button type="button" class="close" onclick="closeImageModal()">&times;</button>
						</div>
						<div class="modal-body text-center">
							<img id="modalImage" src="" class="img-fluid" />
						</div>
					</div>
				</div>
			</div>

			<!-- 팝업 알림 모달 -->
			<div id="alertModal" class="modal fade" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Notification</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="modal-body"></div>
					</div>
				</div>
			</div>

			<!-- 리뷰 및 이미지 모달 관련 JS 파일 연결 -->
			<script src="<c:url value='/resources/js/product/details.js' />"></script>
			<script>
				// 이미지 모달 창 열기
				function showImageModal(imageUrl) {
					document.getElementById('modalImage').src = imageUrl;
					document.getElementById('imageModal').style.display = 'block';
				}

				// 이미지 모달 창 닫기
				function closeImageModal() {
					document.getElementById('imageModal').style.display = 'none';
				}

				// 팝업 알림창
				function showModal(message) {
					document.getElementById("modal-body").innerText = message;
					$("#alertModal").modal("show");
				}
			</script>
</body>
</html>
