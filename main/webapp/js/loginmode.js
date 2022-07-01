
$('#userlogin').click(function(){
    $('.login').css("display","block");
    $('.company-login').css("display","none");
    $('.manage-login').css("display","none");
    $('#userlogin').css("background-color","#FB6544");
    $('#comlogin').css("background-color","lightgray");
    $('#mglogin').css("background-color","lightgray");
    $('#userlogin').css("color","#FFF");
    $('#comlogin').css("color","#000");
    $('#mglogin').css("color","#000");
    $('.ulogin').css("display","block");
    $('.clogin').css("display","none");
    $('.mlogin').css("display","none");
});


$('#comlogin').click(function(){
    $('.login').css("display","none");
    $('.company-login').css("display","block");
    $('.manage-login').css("display","none");
    $('#userlogin').css("background-color","lightgray");
    $('#comlogin').css("background-color","#FB6544");
    $('#mglogin').css("background-color","lightgray");
    $('#userlogin').css("color","#000");
    $('#comlogin').css("color","#FFF");
    $('#mglogin').css("color","#000");
    $('.ulogin').css("display","none");
    $('.clogin').css("display","block");
    $('.mlogin').css("display","none");
});


$('#mglogin').click(function(){
    $('.login').css("display","none");
    $('.company-login').css("display","none");
    $('.manage-login').css("display","block");
    $('#userlogin').css("background-color","lightgray");
    $('#comlogin').css("background-color","lightgray");
    $('#mglogin').css("background-color","#FB6544");
    $('#userlogin').css("color","#000");
    $('#comlogin').css("color","#000");
    $('#mglogin').css("color","#fff");
    $('.ulogin').css("display","none");
    $('.clogin').css("display","none");
    $('.mlogin').css("display","block");
});

