const modal3 = document.querySelector(".modalBackground-apply");
const modalopen3 = document.querySelector(".apply");
const modalclose3 = document.querySelector(".modalClose");

function modalPage3(event) {
	event.preventDefault();
	modal3.classList.toggle("inactive3");
};

modalopen3.addEventListener("click", modalPage3);
modalclose3.addEventListener("click", modalPage3);