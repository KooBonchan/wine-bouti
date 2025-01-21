// 탭 전환 기능
function openTab(evt, tabName) {
    const tabcontent = document.getElementsByClassName("tabcontent");
    for (let i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    const tablinks = document.getElementsByClassName("tablinks");
    for (let i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";

    if (tabName === "Review") {
        loadReplies(); // productId는 글로벌 스코프에서 접근
    }
}

// 기본 탭 활성화
document.getElementById("defaultTab").click();

// 리뷰 목록 로드
function loadReplies() {
    fetch(`/product/reviews?productId=${productId}`)
        .then(response => response.json())
        .then(reviews => {
            let innerHTML = "";
            if (reviews.length === 0) {
                innerHTML = "<p>No reviews available.</p>";
            } else {
                for (const review of reviews) {
                    innerHTML += `
                        <div class="review-item">
                            <p><strong>${escapeHTML(review.writer)}</strong></p>
                            <p>${escapeHTML(review.content)}</p>
                            ${review.imagePath ? `<img src="/uploads/${review.imagePath}" width="50" onclick="showImageModal('/uploads/${review.imagePath}')"/>` : ""}
                        </div>`;
                }
            }
            document.getElementById("reviewList").innerHTML = innerHTML;
        })
        .catch(() => showModal("Failed to load reviews."));
}

// 리뷰 작성 폼 표시
function showReviewForm() {
    document.getElementById("reviewList").innerHTML = `
        <form id="reviewForm">
            <textarea name="content" placeholder="Write your review here..." required></textarea>
            <input type="file" name="image" accept="image/*" id="imageUpload" onchange="previewThumbnail()">
            <div id="thumbnailPreview" style="margin-top: 10px;"></div>
            <button type="button" onclick="submitReply()">Submit</button>
        </form>
    `;
}

// 썸네일 미리보기 생성
function previewThumbnail() {
    const fileInput = document.getElementById("imageUpload");
    const previewContainer = document.getElementById("thumbnailPreview");
    previewContainer.innerHTML = ""; // 기존 미리보기 초기화

    const file = fileInput.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement("img");
            img.src = e.target.result;
            img.alt = "Thumbnail Preview";
            img.style.maxWidth = "100px";
            img.style.maxHeight = "100px";
            img.style.borderRadius = "5px";
            img.style.marginTop = "10px";
            previewContainer.appendChild(img);
        };
        reader.readAsDataURL(file);
    }
}

// 리뷰 제출
function submitReply(productId) {
    const form = document.getElementById("form-reply");
    const formData = new FormData(form);

    // 별점 추가
    const rating = document.querySelector('input[name="rating"]:checked');
    if (rating) {
        formData.append("rating", rating.value);
    } else {
        alert("별점을 선택해주세요!");
        return;
    }

    fetch(`/product/reviews?productId=${productId}`, {
        method: "POST",
        body: formData,
    })
        .then(response => {
            if (response.ok) {
                alert("리뷰가 성공적으로 작성되었습니다!");
                loadReplies(productId);
            } else {
                alert("리뷰 작성에 실패했습니다.");
            }
        })
        .catch(() => alert("서버 오류가 발생했습니다."));
}


// 이미지 모달 창 열기
function showImageModal(imageUrl) {
    document.getElementById("modalImage").src = imageUrl;
    document.getElementById("imageModal").style.display = "block";
}

// 이미지 모달 창 닫기
function closeImageModal() {
    document.getElementById("imageModal").style.display = "none";
}

// 팝업 알림창
function showModal(message) {
    const modalBody = document.getElementById("modal-body");
    modalBody.innerText = message;
    $("#alertModal").modal("show");
}

// HTML 특수문자 처리
const escapeHTML = str =>
    str.replace(/[&<>"']/g, match =>
        ({"&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"}[match])
    );
