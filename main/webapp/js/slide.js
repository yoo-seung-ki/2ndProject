$('.slide').each(function(index) {
    let $thisObj = $(this);
    let totalCount = new Array();
    totalCount[index] = $thisObj.find('enterpriseCard').length;
    totalN = totalCount - 1;
    let meinSlider = $('.slide').bxSlider({
        controls: false,
        minSlides: 3,
        maxSlides: 3,
        moveSlides: 1,
        slideWidth: 1400,
        preloadImages: 'all',
        pager: false //페이지 번호
    }); //기업 지원 현황 슬라이드
    $(".l-arrow").click(function(){
        meinSlider.goToPrevSlide();
        return false;
    });
    $(".r-arrow").click(function(){
        meinSlider.goToNextSlide();
        return false;
    });
}); // 슬라이드 및 좌,우 클릭 버튼


