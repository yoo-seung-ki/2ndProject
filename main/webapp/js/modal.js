const modal = document.querySelector(".modalBackground");
const modalopen = document.querySelector(".myInfo");
const modalclose = document.querySelector(".modalClose");
const modal2 = document.querySelector(".modalBackground-attention");
const modalopen2 = document.querySelector(".attention");

 
function modalPage(event){
  event.preventDefault();
  modal.classList.toggle("inactive");
  document.querySelector(".modalBackground-attention")
};

function modalPage2(event) {
	event.preventDefault();
	modal2.classList.toggle("inactive2");
};


modalopen.addEventListener("click", modalPage);
modalclose.addEventListener("click", modalPage);

modalopen2.addEventListener("click", modalPage2);
modalclose.addEventListener("click", modalPage2);