// 비밀번호 변경 모달
const modal_changeNum = document.querySelector(".modal-changeNum-background");
const modalopen_changeNum = document.querySelector(".changeNum");
const modalclose_changeNum = document.querySelector(".modal-changeNum-close");

function modalPage_changeNum(event){
  event.preventDefault();
  modal_changeNum.classList.toggle("inactive");
};

modalopen_changeNum.addEventListener("click", modalPage_changeNum);
modalclose_changeNum.addEventListener("click", modalPage_changeNum);