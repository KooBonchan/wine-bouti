<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 수정</title>
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
            height: 300px;
        }

        .title-rating {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-bottom: 15px;
        }

        .rating {
            display: flex;
            align-items: center;
            justify-content: flex-start;
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

        .preview-container {
            position: relative;
            width: auto;
            height: 50px;
            border-radius: 4px;
            overflow: hidden;
        }

        .preview-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>리뷰 수정</h1>
        <form id="reviewEditForm" 
            action="${pageContext.request.contextPath}/review/edit" method="post" enctype="multipart/form-data">
            
            <!-- 리뷰 ID, 상품 ID 숨김 처리 -->
            <input type="hidden" name="reviewId" value="${review.reviewId}">
            <input type="hidden" name="productId" value="${review.productId}">

            <div class="title-rating">
                <label for="title">
                    <input type="text" id="title" name="title" value="${review.title}" required>
                </label>
                <div class="rating">
                    <label>평점</label>
                    <c:forEach var="i" begin="1" end="5">
                        <input type="radio" id="rating${i}" name="rating" value="${i}" ${review.star == i ? 'checked' : ''}>
                        <label for="rating${i}">${i}</label>
                    </c:forEach>
                </div>
            </div>

            <label for="reviewText">
                <textarea id="reviewText" name="reviewText" rows="5" required>${review.content}</textarea>
            </label>
            
            <!-- 기존 이미지 표시 -->
            <c:if test="${not empty review.imagePath}">
                <div class="preview-container">
                    <img id="currentImage" src="${pageContext.request.contextPath}/uploads/${review.imagePath}" alt="기존 이미지">
                </div>
            </c:if>

            <!-- 사진 첨부 필드 -->
            <div class="file-upload">
                <label for="imageUpload">사진 변경 (선택)</label>
                <input type="file" id="imageUpload" name="imageUpload" accept="image/*">
                <div class="preview-container" id="imagePreview"></div>
            </div>

            <input type="submit" value="수정 완료">
        </form>
    </div>

    <script>
        document.getElementById("imageUpload").addEventListener("change", function(event) {
            const previewContainer = document.getElementById("imagePreview");
            previewContainer.innerHTML = ""; // 이전 미리보기 제거

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
