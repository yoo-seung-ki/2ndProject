'use strict';

// 로컬스토리지 데이터 읽기(darkMode keyName 읽기)
let darkMode = localStorage.getItem('darkMode');
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
    darkModeToggle.textContent = '다크모드 비활성화';
  } else {
    // 그렇지 않다면(활성화 되어 있다면) 비활성화 함수 호출
    disableDarkMode();
    darkModeToggle.textContent = '다크모드 활성화';
  }
});