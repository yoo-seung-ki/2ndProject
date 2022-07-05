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
          document.getElementsByClassName(".body")[0].style.color="#FFF";   //the thext in the p is set to white
          document.body.style.backgroundColor = "#181A1B";            //the backgornd is set to a dark grey
      }else{
          check.checked = false;
          document.getElementsByClassName(".body")[0].style.color="black";  //same CSS changes but for light mode
          document.body.style.backgroundColor = "#FFF";
      }
  }
  
  function changeStatus(){                                            //This function gets called every time the checkbox is clicked
      if (localStorage.getItem('darkMode')==="true"){                 //if darkMode was active and this function is called it means the user now wants light
          localStorage.setItem('darkMode', "false");                  //so we set it to false, to indicate we are in light mode
          document.getElementsByClassName(".body")[0].style.color="black";  //same CSS changes as in checkStatus
          document.body.style.backgroundColor = "#FFF";
      } else{
          localStorage.setItem('darkMode', "true");                   //same code but adapted for dark theme
          document.getElementsByClassName(".body")[0].style.color="#FFF";
          document.body.style.backgroundColor = "#181A1B";
      }
  }





    // // excelinput 다크모드

    // function excelinputdarkmode()
    // {
      
    //   var toggle = document.getElementById("colormode");
    //   var table = document.querySelectorAll("table");
      
      
    //   if(toggle.value=="off"){
    //     toggle.value="on";
    //     for(var i=0; i<table.length; i++) {
    //       table[i].style.color = '#fff'
    //     }
    //       document.querySelector('header').style.backgroundColor = '#000';
    //       document.querySelector('.option').style.color = '#fff';
    //       document.querySelector('.body').style.backgroundColor = '#000';
    //       document.querySelector('.body').style.color = '#fff';
    //       document.querySelector('.title-text').style.color = '#fff';
    //       document.querySelector('.title').style.color = '#000';
    //       document.querySelector('.signup-link').style.color = '#000';
    //       document.querySelector('.menu').style.color = '#fff';
    //       document.querySelector('.bannerTitle').style.color = '#000';
    //       console.log("excelinput 다크모드 켜기")
    //   }
  
    //   else if(toggle.value=="on"){
    //     toggle.value="off";
    //     for(var i=0; i<table.length; i++) {
    //       table[i].style.color = '#000'
    //     }
    //     document.querySelector('header').style.backgroundColor = '#fff';
    //     document.querySelector('.option').style.color = '#000';
    //     document.querySelector('.body').style.backgroundColor = '#fff';
    //     document.querySelector('.body').style.color = '#000';
    //     document.querySelector('.title-text').style.color = '#000';
    //     document.querySelector('.title').style.color = '#fff';
    //     document.querySelector('.signup-link').style.color = '#fff';
    //     document.querySelector('.menu').style.color = '#000';
    //     document.querySelector('.bannerTitle').style.color = '#fff';
    //     console.log("excelinput 다크모드 끄기")
    //   }
    // }