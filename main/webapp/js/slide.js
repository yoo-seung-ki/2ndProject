$(document).ready(function() {
    var meinSlider = $('.ba-slide').bxSlider({
        auto: true,
        controls: true,
        pager: false,
        pause: 5000,
        controls: false,
        maxSlides: 4,
    }); //메인배너 슬라이드
    $(".l-arrow").on("click", function() {
        meinSlider.goToPrevSlide();
        return false;
    });
    $(".r-arrow").on("click", function() {
        meinSlider.goToNextSlide();
        return false;
    });
}); // 슬라이드 및 좌,우 클릭 버튼


$(document).ready(function() {
    $(".main-nav>li").mouseover(function() {
        $(this).children(".sub").stop().slideDown();
    });
    $(".main-nav>li").mouseleave(function() {
        $(this).children(".sub").stop().slideUp();
    });
});