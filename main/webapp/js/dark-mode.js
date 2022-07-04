'use strict';

// employment, employmentresult 다크모드
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
        document.querySelector('.bannerTitle').style.color = '#000';
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



// 로컬스토리지 데이터 읽기(darkMode keyName 읽기)
let darkMode = localStorage.getItem('darkMode');

let checkboxShowGPSInfo = document.querySelector('#checkboxShowGPSInfo')
const darkModeToggle = document.querySelector('#darkModeToggle');

const enableDarkMode = () => {
  // body 태그에 다크모드 클래스 추가
  document.body.classList.add('dark-mode');

  // 로컬스토리지에 다크모드 키-값 생성
  localStorage.setItem('darkMode', 'enabled');  
};

const disableDarkMode = () => {
  // body 태그에 다크모드 클래스 제거
  document.body.classList.remove('dark-mode');
  // 로컬스토리지에 다크모드 키의 값을 null로 업데이트
  localStorage.setItem('darkMode', null);
};

if (darkMode === 'enabled') enableDarkMode();

darkModeToggle.addEventListener('click', () => {
  
  // 클릭 시마다 초기화
  darkMode = localStorage.getItem('darkMode');
  // 만약 다크모드가 활성화 되어 있지 않다면
  if (darkMode !== 'enabled') {
    // 다크모드 활성화 함수 호출
    enableDarkMode();
  } else {
    // 그렇지 않다면(활성화 되어 있다면) 비활성화 함수 호출
    disableDarkMode();
  }
});
    