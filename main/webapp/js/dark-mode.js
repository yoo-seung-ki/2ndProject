// employment 다크모드
function Buttontoggle()
  {
	
    var toggle = document.getElementById("toggle");
    var aTag = document.querySelectorAll('.cardInfo');
	var listNum = document.querySelectorAll('.listNum');
    
    
    if(toggle.value=="off"){
        toggle.value="on";
        
      for(let i = 0; i < aTag.length; i++){ // aTag 만큼 반복
      aTag[i].style.color = '#fff';   // 돌면서 aTag[i]에 스타일 변경
      }
      for(let j = 0; j < listNum.length; j++){ // aTag 만큼 반복
      listNum[j].style.color = '#fff';   // 돌면서 aTag[i]에 스타일 변경
      }
      
        
        document.querySelector('body').style.backgroundColor = '#000';      
        document.querySelector('body').style.color = '#fff';
        document.querySelector('.title-text').style.color = '#fff';
        document.querySelector('.bannerTitle').style.color = '#000';
        document.querySelector('p').style.color = '#fff';
        console.log("돋보기 켜기")
    }

    else if(toggle.value=="on"){
        toggle.value="off";
        
      for(let i = 0; i < aTag.length; i++){ // aTag 만큼 반복
      aTag[i].style.color = '#000';   // 돌면서 aTag[i]에 스타일 변경
      }
       for(let j = 0; j < listNum.length; j++){ // aTag 만큼 반복
      listNum[j].style.color = '#000';   // 돌면서 aTag[i]에 스타일 변경
      }
      
        
        document.querySelector('body').style.backgroundColor = '#fff';      
        document.querySelector('body').style.color = '#000';
        document.querySelector('.title-text').style.color = '#000';
        document.querySelector('.bannerTitle').style.color = '#fff';
        document.querySelector('p').style.color = '#000';
        console.log("돋보기 끄기")
    }
  }