document.addEventListener("DOMContentLoaded", function() {
    var acc = document.querySelectorAll(".accordion"); // 모든 아코디언 버튼을 선택

    // '나라'와 '가격' 아코디언만 선택
    var countryAccordion = acc[0]; // 첫 번째 아코디언 (나라)
    var priceAccordion = acc[1]; // 두 번째 아코디언 (가격)

    // '나라' 아코디언에 클릭 이벤트 추가
    countryAccordion.addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });

    // '가격' 아코디언에 클릭 이벤트 추가
    priceAccordion.addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });

    // 나머지 필터는 기본적으로 펼쳐놓기 (가격, 나라 제외)
    document.querySelectorAll('.panel').forEach(function(panel, index) {
        if (index > 1) {  // 나라(0)와 가격(1) 제외
            panel.style.display = 'block';
        }
    });
});

