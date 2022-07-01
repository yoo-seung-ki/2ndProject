const modal = document.querySelector(".modalBackground");
const modalopen = document.querySelector(".myInfo");
const modalclose = document.querySelector(".modalClose");
const modal2 = document.querySelector(".modalBackground-attention");
const modalopen2 = document.querySelector(".attention");

 
function modalpage1() {
  document.querySelector('.inactive1').style.display = 'block'
  event.preventDefault();
}

function modalpage2() {
  document.querySelector('.inactive2').style.display = 'block'
  event.preventDefault();
}



function modalpage1close() {
  document.querySelector('.inactive1').style.display = 'none'
  document.querySelector('.inactive2').style.display = 'none'
  event.preventDefault();
}

// 토글
// function modalPage(event){
//   event.preventDefault();
//   modal.classList.toggle("inactive1");
// };

// function modalPage2(event) {
// 	event.preventDefault();
// 	modal2.classList.toggle("inactive2");
// };


modalopen.addEventListener("click", modalPage);
modalclose.addEventListener("click", modalPage);

modalopen2.addEventListener("click", modalPage2);
modalclose.addEventListener("click", modalPage2);