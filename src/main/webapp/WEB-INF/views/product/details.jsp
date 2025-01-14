<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="product-detail"><pre>
본문 내용입니다.
사진 이미지 - Thumbnail, 클릭 시 확대
가격
상세내용 이미지
</pre>

</div>

<!-- 코드로 배우는 스프링 댓글 코드 -->
<!-- 별점 및 이미지(1개) 첨부 가능하도록 변경 -->
<!-- 주문 영수증 / 주문번호 첨부? -->
<section>
	<form name="form-reply" id="form-reply" onsubmit="return false;" class="row">
	  <div class="col-12 mb-1 mt-3">
	    <span id="writer">Leave your comments</span>
	  </div>
	  <div class="col-9">
	      <textarea name="content" id="content" class="form-control" rows="4" placeholder="Comment" required></textarea>
	  </div>
	  <div class="col-3">
	      <button type="button" class="btn btn-primary w-100" onclick="submitReply(<c:out value="${board.idx}"/>)">Reply</button>
	  </div>
	</form>
	<div id="reply-header">
	  <span onclick="loadReplies(<c:out value="${board.idx}"/>)">&#x21bb;</span>
	</div>
	<table id="reply-container">
	  <!-- Table content will be dynamically populated here -->
	  <!-- 파일 입출력 파트 참고하여 썸네일 이미지 클릭 시 원본 이미지 팝업으로 보여주도록 -->
	</table>
</section>

<script src="<c:url value='/resources/js/product/details.js' />"></script>