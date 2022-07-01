const modal = document.querySelector(".modal-background");
const modalopen = document.querySelector(".myInfo");
const modalclose = document.querySelector(".modal-close");
const inactive = "inactive";


function modalPage(event){
    event.preventDefault();
    modal.classList.toggle(inactive);
};

modalopen.addEventListener("click", modalPage);
modalclose.addEventListener("click", modalPage);