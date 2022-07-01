// employment 다크모드
$(document).ready(function() {
    $("#colormode").change(function(){
    if($("#colormode").is(":checked")){
        $("body").css("background-color","#000");
        $("body").css("color","#fff");
        $(".title-text").css("color","#fff");
        $(".bannerTitle").css("color","#000");
        $("p").css("color","#fff");
        consol.log("되네")
    }else{
        $("body").css("background-color","#fff");
        $("body").css("color","#000");
        $(".title-text").css("color","#000");
        $(".bannerTitle").css("color","#000");
        $("p").css("color","#000");
        consol.log("되네")
    }        
    });
});