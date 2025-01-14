document.addEventListener('DOMContentLoaded', () => {
    let currentIndex = 0; // 현재 슬라이드 인덱스
    const totalSlides = document.querySelectorAll('.slidelist .slide-item').length; // 총 슬라이드 개수

    // 슬라이드를 이동하는 함수
    const moveSlide = (index) => {
        if (index < 0) {
            currentIndex = totalSlides - 1; // 마지막 슬라이드로 돌아가기
        } else if (index >= totalSlides) {
            currentIndex = 0; // 첫 번째 슬라이드로 돌아가기
        } else {
            currentIndex = index;
        }

        // 슬라이드 이동 (transform을 사용하여 부드러운 애니메이션 구현)
        const slideList = document.querySelector('.slidelist');
        slideList.style.transition = 'transform 0.5s ease-in-out';
        slideList.style.transform = `translateX(${(-100 * currentIndex)}%)`;

        // 동그라미 활성화
        document.querySelectorAll('.dot-nav li').forEach((dot, idx) => {
            dot.classList.toggle('active', idx === currentIndex);
        });
    };

    // 좌측 버튼 클릭 시 슬라이드 이동
    document.querySelector('.prev').addEventListener('click', () => {
        moveSlide(currentIndex - 1); // 이전 슬라이드로 이동
    });

    // 우측 버튼 클릭 시 슬라이드 이동
    document.querySelector('.next').addEventListener('click', () => {
        moveSlide(currentIndex + 1); // 다음 슬라이드로 이동
    });

    // 슬라이드 자동 이동 기능
    setInterval(() => {
        moveSlide(currentIndex + 1); // 자동으로 다음 슬라이드로 이동
    }, 5000); // 5초마다 슬라이드 이동

    // 동그라미 네비게이션 생성
    const dotNav = document.querySelector('.dot-nav');
    for (let i = 0; i < totalSlides; i++) {
        const dotItem = document.createElement('li');
        dotItem.innerHTML = '<button></button>';
        dotNav.appendChild(dotItem);
    }

    // 처음에 첫 번째 동그라미를 활성화
    document.querySelectorAll('.dot-nav li')[0].classList.add('active');

    // 동그라미 클릭 시 슬라이드 이동
    document.querySelectorAll('.dot-nav li').forEach((dot, index) => {
        dot.addEventListener('click', () => {
            moveSlide(index); // 해당 인덱스로 슬라이드 이동
        });
    });
});
