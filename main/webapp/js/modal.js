const modal = document.querySelector(".modalBackground");
const modalopen = document.querySelector(".myInfo");
const modalclose = document.querySelector(".modalClose");

function modalPage(event){
  event.preventDefault();
  modal.classList.toggle("inactive");
};

modalopen.addEventListener("click", modalPage);
modalclose.addEventListener("click", modalPage);