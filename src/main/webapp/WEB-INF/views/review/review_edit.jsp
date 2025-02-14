<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 수정</title>
<style>
/* 기존 스타일 유지 */
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

label {
    display: block;
    margin: 5px 0;
    font-weight: bold;
}

input[type="text"], textarea, input[type="file"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
    height: 300px;
}

.title-rating {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin-bottom: 15px;
}

.title-rating label {
    margin-right: 10px;
}

.title-rating input[type="text"] {
    width: 500px;
    margin-right: 20px;
}

.rating {
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.rating label {
    margin-right: 15px;
}

.rating input {
    margin-right: 5px;
}

.file-upload {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-bottom: 15px;
}

.file-upload label {
    margin-bottom: 5px;
}

.file-upload-container {
    position: relative;
    width: 100%;
    border: none;
    padding: 0;
}

/* 기존 이미지 미리보기 스타일 */
.preview-container {
    margin-top: 10px;
    width: auto;
    height: 50px;
    border-radius: 4px;
    overflow: hidden;
}

.preview-container img {
    width: auto;
    height: 100%;
    object-fit: cover;
}
</style>
</head>
<body>
    <div class="container">
        <h1>리뷰 수정</h1>
        <form id="editReviewForm"
            action="${pageContext.request.contextPath}/review/edit/${review.reviewId}"
            method="post" enctype="multipart/form-data">
            
            <!-- 기존 리뷰 정보 유지 -->
            <input type="hidden" name="reviewId" value="${review.reviewId}">
            <input type="hidden" name="productId" value="${review.productId}">
            <input type="hidden" name="memberId" value="<sec:authentication property='principal.memberVO.memberId'/>">

            <div class="title-rating">
                <label for="title"> 
                    <input type="text" id="title" name="title" value="${review.title}" required>
                </label>
                <div class="rating">
                    <label>평점</label>
                    <input type="radio" id="rating1" name="star" value="1" ${review.star == 1 ? 'checked' : ''}> <label for="rating1">1</label>
                    <input type="radio" id="rating2" name="star" value="2" ${review.star == 2 ? 'checked' : ''}> <label for="rating2">2</label>
                    <input type="radio" id="rating3" name="star" value="3" ${review.star == 3 ? 'checked' : ''}> <label for="rating3">3</label>
                    <input type="radio" id="rating4" name="star" value="4" ${review.star == 4 ? 'checked' : ''}> <label for="rating4">4</label>
                    <input type="radio" id="rating5" name="star" value="5" ${review.star == 5 ? 'checked' : ''}> <label for="rating5">5</label>
                </div>
            </div>

            <label for="content"> 
                <textarea id="content" name="content" rows="5" required>${review.content}</textarea>
            </label>

            <!-- 기존 이미지 표시 -->
            <div class="file-upload">
                <label for="imageUpload">기존 이미지</label>
                <div class="preview-container">
                    <c:if test="${not empty review.imagePath}">
                        <img src="<c:url value='/api/image/review/${review.imagePath}' />" alt="리뷰 이미지">
                    </c:if>
                </div>
            </div>

            <!-- 새 이미지 업로드 -->
            <div class="file-upload">
                <label for="imageUpload">새로운 사진 첨부</label>
                <div class="file-upload-container">
                    <input type="file" id="imageUpload" name="imageUpload" accept="image/*">
                    <div class="preview-container" id="imagePreview"></div>
                </div>
            </div>

            <input type="submit" id="submitBtn" value="리뷰 수정">
        </form>
    </div>

    <script>
    // 이미지 미리보기 기능 
    document.getElementById("imageUpload").addEventListener("change", function(event) {
        const previewContainer = document.getElementById("imagePreview");
        previewContainer.innerHTML = ""; // 이전 미리보기 이미지 제거

        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = function(e) {
                const imgElement = document.createElement("img");
                imgElement.src = e.target.result;
                previewContainer.appendChild(imgElement);
            };

            reader.readAsDataURL(file);
        }
    });
    </script>

</body>
</html>
