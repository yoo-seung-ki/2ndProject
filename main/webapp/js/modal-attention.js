const modal2 = document.querySelector(".modalBackground-attention");
const modalopen2 = document.querySelector(".attention");
const modalclose2 = document.querySelector(".modalClose");

function modalPage2(event) {
	event.preventDefault();
	modal2.classList.toggle("inactive2");
};

modalopen2.addEventListener("click", modalPage2);
modalclose2.addEventListener("click", modalPage2);