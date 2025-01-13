// Image Slider
$(document).ready(() => {
    let currentIndex = 0;
    const $slideList = $('.slidelist');
    const $dots = $('.dot-nav');
    const totalSlides = $('.slidelist .slide-item').length;
    const moveSlide = (index) => {
        if (index < 0) {
            currentIndex = totalSlides - 1;
        } else if (index >= totalSlides) {
            currentIndex = 0;
        } else {
            currentIndex = index;
        }
        $slideList.css({
            'transition': 'transform 0.5s ease-in-out',
            'transform': `translateX(${-100 * currentIndex}%)`
        });
        $dots.find('li').each(function (idx) {
            $(this).toggleClass('active', idx === currentIndex);
        });
    };
    $('.prev').on('click', () => {
        moveSlide(currentIndex - 1);
    });
    $('.next').on('click', () => {
        moveSlide(currentIndex + 1);
    });
    setInterval(() => {
        moveSlide(currentIndex + 1);
    }, 5000);


    for (let i = 0; i < totalSlides; i++) {
        $dots.append('<li><button></button></li>');
    }
    $dots.find('li').first().addClass('active');
    $dots.find('li').on('click', function () {
        const index = $(this).index();
        moveSlide(index);
    });
});