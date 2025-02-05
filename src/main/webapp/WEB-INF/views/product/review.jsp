<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>review</title>
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
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
	height: 300px; /* 원하는 높이를 설정 */
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
	margin-right: 20px; /* 제목과 평점 사이 간격을 줄임 */
}

.rating {
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

.rating label {
	margin-right: 15px; /* 평점 라벨과 버튼 사이 간격을 줄임 */
}

.rating input {
	margin-right: 5px; /* 평점 입력 버튼 간격을 줄임 */
}

.file-upload {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin-bottom: 15px; /* 필요 시 여백 조정 */
}

.file-upload label {
	margin-bottom: 5px;
}

.file-upload-container {
	position: relative;
	width: 100%;
	border: none; /* border 제거 */
	padding: 0; /* 불필요한 여백 제거 */
}

/* 파일 입력 버튼에서 선 제거 */
input[type="file"] {
	border: none; /* 파일 입력 필드의 경계선 제거 */
	padding: 5px 0; /* 여백을 조정하여 깔끔하게 */
	background-color: transparent; /* 배경색 투명으로 설정 */
}

/* 이미지 미리보기 스타일 수정 */
.preview-container {
	position: absolute;
	top: 0;
	right: 10px; /* 이미지가 오른쪽에 배치되도록 */
	width: auto;
	height: 50px; /* 고정된 크기 */
	border-radius: 4px;
	overflow: hidden;
}

.preview-container img {
	width: 100%;
	height: 100%; /* 이미지가 50px 크기 내에 맞춰지도록 */
	object-fit: cover; /* 비율을 유지하면서 영역에 맞게 이미지를 잘라서 맞춤 */
}
</style>
</head>
<body>
	<div class="container">
		<h1>review</h1>
		<form id="reviewForm"
			action="${pageContext.request.contextPath}/review/write"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="productId" value="${param.productId}">
			<%-- <input type="hidden" name="memberId" value="${sessionScope.loggedInUserId}"> --%>
			<input type="hidden" name="memberId" value="3">


			<div class="title-rating">
				<label for="title"> <input type="text" id="title"
					name="title" placeholder="리뷰 제목" required>
				</label>
				<div class="rating">
					<label>평점</label> <input type="radio" id="rating1" name="star"
						value="1"> <label for="rating1">1</label> <input
						type="radio" id="rating2" name="star" value="2"> <label
						for="rating2">2</label> <input type="radio" id="rating3"
						name="star" value="3"> <label for="rating3">3</label> <input
						type="radio" id="rating4" name="star" value="4"> <label
						for="rating4">4</label> <input type="radio" id="rating5"
						name="star" value="5"> <label for="rating5">5</label>
				</div>
			</div>

			<label for="content"> <textarea id="content" name="content"
					rows="5" placeholder="리뷰 내용을 작성하세요" required></textarea>
			</label>


			<!-- 사진 첨부 필드 추가 -->
			<div class="file-upload">
				<label for="imageUpload">사진 첨부</label>
				<div class="file-upload-container">
					<input type="file" id="imageUpload" name="imageUpload"
						accept="image/*">
					<!-- 이미지 미리보기 표시 영역 -->
					<div class="preview-container" id="imagePreview"></div>
				</div>
			</div>

			<input type="submit" id="submitBtn" value="리뷰 제출">

		</form>

		<!-- jQuery 추가 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

		<script>
    document.getElementById("reviewForm").addEventListener("submit", function(event) {
        event.preventDefault(); // 기본 폼 제출 방지
        
        let productIdElement = document.querySelector('input[name="productId"]');
        let productId = productIdElement ? productIdElement.value : null;

        let memberIdElement = document.querySelector('input[name="memberId"]');
        let memberId = memberIdElement ? memberIdElement.value : null;
        
        let title = document.getElementById("title").value;
        let content = document.getElementById("content").value;
        let rating = document.querySelector('input[name="star"]:checked')?.value;
        let image = document.getElementById("imageUpload").files[0];
        

        if (!title || !content || !rating) {
            alert("모든 필드를 채워주세요.");
            return;
        }
        
        let formData = new FormData();
        formData.append("productId", productId);
        formData.append("memberId", memberId);
        formData.append("title", title);
        formData.append("content", content);
        formData.append("star", rating);

        // 이미지가 있으면 먼저 업로드 (Ajax)
        if (image) {
            formData.append("uploadFile", image);

            $.ajax({
                url: "/winebouti/upload/image",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                dataType: "json",
                success: function (response) {
                    console.log("파일 업로드 성공:", response);
                    let uploadedFile = response[0]; // 업로드된 파일 정보 저장

                    // 파일 업로드 성공 후 리뷰 데이터 서버로 전송
                    sendReviewData(title, content, rating, uploadedFile);
                },
                error: function (xhr) {
                    console.error("파일 업로드 실패:", xhr.responseText);
                    alert("이미지 업로드에 실패했습니다.");
                }
            });
        } else {
            // 이미지가 없으면 파일 정보 없이 리뷰 전송
            sendReviewData(title, content, rating, null);
        }
    });

    // 서버로 리뷰 데이터 전송
		let formData = new FormData();
		formData.append("productId", productId);  // ✅ productId 추가
		formData.append("memberId", memberId);    // ✅ memberId 추가
		formData.append("content", content);
		formData.append("star", rating);
		
		if (image) {
		    formData.append("file", image);  // ✅ 파일 추가
		}
		
		$.ajax({
		    url: "/review/write",
		    type: "POST",
		    data: formData,
		    processData: false,  // 🚀 `FormData` 사용 시 필수
		    contentType: false,  // 🚀 `FormData` 사용 시 필수
		    success: function(response) {
		        alert("리뷰가 성공적으로 등록되었습니다!");
		        window.location.href = "/product/details/" + productId;
		    },
		    error: function(xhr) {
		        console.error("리뷰 등록 실패:", xhr.responseText);
		        alert("리뷰 등록 중 오류가 발생했습니다.");
		    }
		});

    }

    //  이미지 미리보기 기능 
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
