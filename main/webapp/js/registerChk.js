'use strict'

const regiFrm = document.regiFrm;



function regiChk(){
	
	if(regiFrm.reginame.value ==""){
        alert("이름을 입력해주세요.");
        regiFrm.reginame.focus();
        return;
    }

    if(regiFrm.ssnf.value ==""){
        alert("주민번호 앞자리를 입력해주세요.");
        regiFrm.ssnf.focus();
        return;
    }
    
    if(regiFrm.ssnb.value == ""){
        alert("주민번호 뒷자리를 입력해주세요.");
        regiFrm.ssnb.focus();
        return;
    }

    if(regiFrm.address.value =="구분"){
        alert("거주지역을 선택해주세요.");
        regiFrm.address.focus();
        return;
    }

    if(regiFrm.Pnum.value=""){
        alert("전화번호를 입력해주세요.");
        regiFrm.Pnum.focus();
        return;
    }

    if(regiFrm.type.value="구분"){
        alert("장애유형을 선택해주세요.");
        regiFrm.type.focus();
        return;
    }

    if(regiFrm.degree.value=="구분"){
        alert("장애정도를 선택해주세요.");
        regiFrm.degree.foucs();
        return;
    }
}

function btnable(checkbox){
	const btn_elem=document.getElementById('submit');
	
	btn_elem.disabled = checkbox.checked ? false : true;
	
	if(btn_elem.disabled){
		$('#submit').css("background-color","#b2b2b2");	
        $('#submit').css("cursor","Default");	
	}else{
		$('#submit').css("background-color","coral");
		$('#submit').css("color","#fff");
		$('#submit').css("cursor","pointer");
			

	}
}



