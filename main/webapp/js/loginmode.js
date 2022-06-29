$(document).ready(function() {
    $('#user-login-page').css("display","block"); 
    $('#mg-login-page').css("display","none"); 
    $('#user-login').css("background-color","#b2b2b2");
    $('#user-login-page').css("background-color","#b2b2b2");
    $('#user-login').css("border-top-right-radius","2em");
    $('#user-login').css("color","#fff");
    $('#user-login-page').css("color","#fff");
    $('#user-login-page').css("font-weight","bold");
    $('.user-login').css("color","#fff");

});
$('#mg-login').click(function(){
$('#user-login-page').css("display","none"); //클릭 시 첫 번째 요소 숨김
 $('#mg-login-page').css("display","block"); //클릭 시 두 번째 요소 표시
 $('#user-login').css("background-color","#fff");
 $('#user-login-page').css("background-color","#fff");
 $('#mg-login').css("background-color","#b2b2b2");
 $('#mg-login-page').css("background-color","#b2b2b2");
 $('#mg-login').css("border-top-left-radius","2em");
 $('#user-login').css("color","#000");
 $('#mg-login').css("color","#fff");
 $('#mg-login-page').css("color","#fff");
 $('#mg-login-page').css("font-weight","bold");
 $('.mg-login').css("color","#fff");
  return false;
});

$('#user-login').click(function(){
    $('#user-login-page').css("display","block"); //클릭 시 첫 번째 요소 숨김
    $('#mg-login-page').css("display","none"); //클릭 시 두 번째 요소 표시
    $('#mg-login').css("background-color","#fff");
    $('#mg-login-page').css("background-color","#fff");
    $('#user-login').css("background-color","#b2b2b2");
    $('#user-login-page').css("background-color","#b2b2b2");
    $('#user-login').css("color","#fff");
    $('#user-login-page').css("color","#fff");
    $('#user-login-page').css("font-weight","bold");
    $('.user-login').css("color","#fff");
    $('#mg-login').css("color","#000");
      return false;
     });
  