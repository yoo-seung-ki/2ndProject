function modalpage1() {
  document.querySelector('.inactive1').style.display = 'block'
  event.preventDefault();
}

function modalpage2() {
  document.querySelector('.inactive2').style.display = 'block'
  event.preventDefault();
}

function modalpage3() {
  document.querySelector('.inactive3').style.display = 'block'
  event.preventDefault();
}



function modalpage1close() {
  document.querySelector('.inactive1').style.display = 'none'
  document.querySelector('.inactive2').style.display = 'none'
  document.querySelector('.inactive3').style.display = 'none'
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

