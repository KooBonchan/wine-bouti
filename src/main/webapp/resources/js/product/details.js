let currentPage = 1; // 현재 페이지

// 와인 이미지 변경
function changeWineImage(id) {
    const wineImage = document.getElementById('main-wine-image');

    if (id === 1) {
        wineImage.src = 'wine1.jpg';
        wineImage.alt = '와인 이미지 1';
    } else if (id === 2) {
        wineImage.src = 'wine2.jpg';
        wineImage.alt = '와인 이미지 2';
    } else if (id === 3) {
        wineImage.src = 'wine3.jpg';
        wineImage.alt = '와인 이미지 3';
    }
}

// 상세 페이지 / 리뷰 내용 보여주기
function showContent(content) {
    const detailsContent = document.getElementById('details-content');
    const reviewsContent = document.getElementById('reviews-content');

    if (content === 'details') {
        detailsContent.style.display = 'block';
        reviewsContent.style.display = 'none';
    } else if (content === 'reviews') {
        detailsContent.style.display = 'none';
        reviewsContent.style.display = 'block';
    }
}

// 이전 페이지로 이동
function prevPage() {
    if (currentPage > 1) {
        currentPage--;
        updateReviewPage();
    }
}

// 다음 페이지로 이동
function nextPage() {
    currentPage++;
    updateReviewPage();
}

// 리뷰 페이지 업데이트
function updateReviewPage() {
    // 여기에 페이지에 맞는 리뷰 데이터를 보여주는 로직 추가 가능
    console.log('현재 페이지:', currentPage);
}
