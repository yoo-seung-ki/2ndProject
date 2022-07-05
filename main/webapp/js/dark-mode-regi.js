 //We're going to use "check" to get the ckeckbox element
const check =document.getElementById("check");

//If darkMode doesn’t exist in the LocalStorage, create it. False by default
if (localStorage.getItem('darkMode')===null){
    localStorage.setItem('darkMode', "false");
}

//checkStatus is only called one time in the program, when you reload the page
//It gives the page it's default look, depening on waht darkMode is set to
checkStatus()

function checkStatus(){
    if (localStorage.getItem('darkMode')==="true"){
        check.checked = true;                                       //the checkbox is checked (if you load the page by default it isn’t)
        document.getElementsByTagName("body")[0].style.color="#000";
        document.getElementsByTagName("header")[0].style.color="#fff";
        document.getElementsByClassName("title-text")[0].style.color="#fff";
        document.body.style.backgroundColor = "#000";       //the backgornd is set to a dark grey
    }else{
        check.checked = false;
        document.getElementsByTagName("body")[0].style.color="black";  //same CSS changes but for light mode
        document.body.style.backgroundColor = "#FFF";
    }
}

function changeStatus(){                                            //This function gets called every time the checkbox is clicked
    if (localStorage.getItem('darkMode')==="true"){                 //if darkMode was active and this function is called it means the user now wants light
        localStorage.setItem('darkMode', "false");                  //so we set it to false, to indicate we are in light mode
        document.getElementsByTagName("body")[0].style.color="black";
           document.getElementsByTagName("header")[0].style.color="#000";
        document.getElementsByClassName("title-text")[0].style.color="#000";
 //same CSS changes as in checkStatus
        document.body.style.backgroundColor = "#FFF";
    } else{
        localStorage.setItem('darkMode', "true");                   //same code but adapted for dark theme
        document.getElementsByTagName("body")[0].style.color="#000";
        document.getElementsByTagName("header")[0].style.color="#fff";
        document.getElementsByClassName("title-text")[0].style.color="#fff";
        document.body.style.backgroundColor = "#000";
    }
}
