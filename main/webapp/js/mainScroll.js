const lists = document.querySelectorAll("li");  //nav 메뉴 리스트를 지정
const main = document.querySelector('.logo a'); //메인 로고를 지정

main.onclick = (event) => {
    event.preventDefault()
    window.scrollTo({top:0, left:0, behavior: 'smooth'});
    }
lists[0].onclick = (event) => {
    event.preventDefault()
    window.scrollTo({top:835, left:0, behavior: 'smooth'});
    }
lists[1].onclick = (event) => {
    event.preventDefault()
    window.scrollTo({top:1670, left:0, behavior: 'smooth'});
    }
lists[2].onclick = (event) => {
    event.preventDefault()
    window.scrollTo({top:2505, left:0, behavior: 'smooth'});
    }
lists[3].onclick = (event) => {
    event.preventDefault()
    window.scrollTo({top:3340, left:0, behavior: 'smooth'});
    }



