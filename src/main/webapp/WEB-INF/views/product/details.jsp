<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 상품 상세 페이지 -->
<div class="product-detail">
    <!-- 상품 이름 표시 -->
    <h2>${product.korean_name}</h2>

    <!-- 상품 썸네일 이미지 (클릭 시 확대) -->
    <div class="product-images">
        <img src="<c:url value='/resources/images/${product.product_image_name}'/>" 
             alt="Product Image" 
             id="thumbnail" 
             onclick="showImageModal('<c:url value='/resources/images/${product.real_product_image_name}'/>')">
    </div>

    <!-- 상품 가격 표시 -->
    <div class="product-price">
        <h3>Price: ₩<c:out value="${product.original_price}"/></h3>
    </div>

    <!-- 상세 이미지 표시 -->
    <div class="product-description">
        <img src="<c:url value='/resources/images/${product.detail_image_name}'/>" alt="Detailed Description">
    </div>
</div>

<!-- 리뷰(댓글) 작성 섹션 -->
<section>
    <!-- 리뷰 작성 폼 -->
    <form name="form-reply" id="form-reply" enctype="multipart/form-data" class="row">
        <div class="col-12 mb-1 mt-3">
            <span id="writer">Leave your review</span>
        </div>

        <!-- 리뷰 입력창 -->
        <div class="col-9">
            <textarea name="content" id="content" class="form-control" rows="4" placeholder="Write your review here..." required></textarea>
        </div>

        <!-- 이미지 첨부 및 리뷰 작성 버튼 -->
        <div class="col-3">
            <input type="file" name="image" id="image" accept="image/*" class="form-control mb-2">
            <button type="button" class="btn btn-primary w-100" onclick="submitReply(<c:out value='${product.product_id}'/>)">Submit Review</button>
        </div>
    </form>

    <!-- 리뷰 새로고침 버튼 -->
    <div id="reply-header">
        <span onclick="loadReplies(<c:out value='${product.product_id}'/>)">&#x21bb; Refresh Reviews</span>
    </div>

    <!-- 리뷰 목록 테이블 -->
    <table id="reply-container" class="table table-bordered">
        <thead>
            <tr>
                <th>Writer</th>
                <th>Content</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- 동적으로 리뷰가 추가되는 영역 -->
        </tbody>
    </table>
</section>

<!-- 이미지 확대 모달 창 -->
<div id="imageModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Image View</h5>
                <button type="button" class="close" onclick="closeImageModal()">&times;</button>
            </div>
            <div class="modal-body text-center">
                <img id="modalImage" src="" class="img-fluid"/>
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
