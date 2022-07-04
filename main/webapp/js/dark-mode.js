// employment 다크모드
function Buttontoggle()
  {
	
    var toggle = document.getElementById("toggle");
    var aTag = document.querySelectorAll('.cardInfo');
	var listNum = document.querySelectorAll('.listNum');
    
    
    if(toggle.value=="off"){
        toggle.value="on";
        
      for(let i = 0; i < aTag.length; i++){ // aTag 만큼 반복
      aTag[i].style.color = '#fff';   // 돌면서 aTag[i]에 스타일 변경
      }
      for(let j = 0; j < listNum.length; j++){ // aTag 만큼 반복
      listNum[j].style.color = '#fff';   // 돌면서 aTag[i]에 스타일 변경
      }
      
        
        document.querySelector('body').style.backgroundColor = '#000';      
        document.querySelector('body').style.color = '#fff';
        document.querySelector('.title-text').style.color = '#fff';
        document.querySelector('.bannerTitle').style.color = '#000';
        document.querySelector('p').style.color = '#fff';
        console.log("employment 다크모드 켜기")
    }

    else if(toggle.value=="on"){
        toggle.value="off";
        
      for(let i = 0; i < aTag.length; i++){ // aTag 만큼 반복
      aTag[i].style.color = '#000';   // 돌면서 aTag[i]에 스타일 변경
      }
       for(let j = 0; j < listNum.length; j++){ // aTag 만큼 반복
      listNum[j].style.color = '#000';   // 돌면서 aTag[i]에 스타일 변경
      }
      
        
        document.querySelector('body').style.backgroundColor = '#fff';      
        document.querySelector('body').style.color = '#000';
        document.querySelector('.title-text').style.color = '#000';
        document.querySelector('.bannerTitle').style.color = '#fff';
        document.querySelector('p').style.color = '#000';
        console.log("employment 다크모드 끄기")
    }
  }

  // excelinput 다크모드

  function excelinputdarkmode()
  {
	
    var toggle = document.getElementById("colormode");
    var table = document.querySelectorAll("table");
    
    
    if(toggle.value=="off"){
      toggle.value="on";
      for(var i=0; i<table.length; i++) {
        table[i].style.color = '#fff'
      }
        document.querySelector('header').style.backgroundColor = '#000';
        document.querySelector('.option').style.color = '#fff';
        document.querySelector('.body').style.backgroundColor = '#000';
        document.querySelector('.body').style.color = '#fff';
        document.querySelector('.title-text').style.color = '#fff';
        document.querySelector('.title').style.color = '#000';
        document.querySelector('.signup-link').style.color = '#000';
        document.querySelector('.menu').style.color = '#fff';
        document.querySelector('.bannerTitle').style.color = '#000';
        console.log("excelinput 다크모드 켜기")
    }

    else if(toggle.value=="on"){
      toggle.value="off";
      for(var i=0; i<table.length; i++) {
        table[i].style.color = '#000'
      }
      document.querySelector('header').style.backgroundColor = '#fff';
      document.querySelector('.option').style.color = '#000';
      document.querySelector('.body').style.backgroundColor = '#fff';
      document.querySelector('.body').style.color = '#000';
      document.querySelector('.title-text').style.color = '#000';
      document.querySelector('.title').style.color = '#fff';
      document.querySelector('.signup-link').style.color = '#fff';
      document.querySelector('.menu').style.color = '#000';
      document.querySelector('.bannerTitle').style.color = '#fff';
      console.log("excelinput 다크모드 끄기")
    }
  }

  // 다크모드
  $(document).ready(function() {
    $("#colormode").change(function(){
    if($("#colormode").is(":checked")){
        $("header").css("background-color","#000");
        $('.option').css("color","#fff");
        $(".body").css("background-color","#000");
        $(".body").css("color","#fff");
        $(".title-text").css("color","#fff");
        $(".title").css("color","#000");
        $(".signup-link").css("color","#000");
        $(".menu").css("color","#fff");
        $(".bannerTitle").css("color","#000");
        $('table').css("color","#fff");
        $('magnifier').css("background-color","#000");
        $('magnifier').css("color","#fff");
        $('magnifier-content').css("background-color","#000");
        $('magnifier-content').css("color","#fff");
        $('magnifier-glass').css("background-color","#000");
        $('magnifier-glass').css("color","#fff");
    }                         
    else{
        $("header").css("background-color","#fff");
        $('.option').css("color","#000");
        $(".body").css("background-color","#fff");                
        $(".body").css("color","#000");                    
        $(".title-text").css("color","#000");
        $(".menu").css("color","#000");
        $(".bannerTitle").css("color","#000");
        $('table').css("color","#000");
        $('magnifier').css("background-color","#fff");
        $('magnifier').css("color","#000");
        $('magnifier-content').css("background-color","#fff");
        $('magnifier-content').css("color","#000");
        $('magnifier-glass').css("background-color","#fff");
        $('magnifier-glass').css("color","#000");
    }        
});
});