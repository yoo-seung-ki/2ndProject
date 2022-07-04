'use strict'

const regiFrm = document.regiFrm;
const companyregi = document.companyFrm;

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

    if(regiFrm.Pnum.value==""){
        alert("전화번호를 입력해주세요.");
        regiFrm.Pnum.focus();
        return;
    }

    if(regiFrm.type.value == "구분"){
        alert("장애유형을 선택해주세요.");
        regiFrm.type.focus();
        return;
    }

    if(regiFrm.degree.value=="구분"){
        alert("장애정도를 선택해주세요.");
        regiFrm.degree.foucs();
        return;
    }
    regiFrm.submit();
}

function btnable(checkbox){
	const btn_elem=document.getElementById('smbtn');
	
	btn_elem.disabled = checkbox.checked ? false : true;
	
	if(btn_elem.disabled){
		$('#smbtn').css("background-color","#b2b2b2");	
        $('#smbtn').css("cursor","Default");	
	}else{
		$('#smbtn').css("background-color","coral");
		$('#smbtn').css("color","#fff");
		$('#smbtn').css("cursor","pointer");
			

	}
}

function companyregiChk(){
	
	const Aaa = document.getElementById("profrm");

	if(companyregi.companyid.value == ""){
        alert("아이디를 입력해주세요.");
        companyregi.companyid.focus();
        Aaa.preventDefault();
    }
	if(companyregi.companypassword.value == ""){
        alert("비밀번호를 입력해주세요.");
        companyregi.companypassword.focus();
        Aaa.preventDefault();
    }
	if(companyregi.companyname.value == ""){
        alert("기업명을 입력해주세요.");
        companyregi.companyname.focus();
        Aaa.preventDefault();
    }
    if(companyregi.homepage.value == ""){
        alert("홈페이지 주소를 입력해주세요.");
        companyregi.homepage.focus();
        Aaa.preventDefault();
    }
    if(companyregi.ceo.value == ""){
        alert("대표자명을 입력해주세요.");
        companyregi.ceo.focus();
        Aaa.preventDefault();
    }
    if(companyregi.companytype.value == ""){
        alert("업종을 입력해주세요.");
        companyregi.companytype.focus();
        Aaa.preventDefault();
    }
    if(companyregi.createyear.value == ""){
        alert("설립시기를 입력해주세요.");
        companyregi.createyear.focus();
        Aaa.preventDefault();
    }
    if(companyregi.companycontent.value == ""){
        alert("사업내용을 입력해주세요.");
        companyregi.companycontent.focus();
        Aaa.preventDefault();
    }
    if(companyregi.address.value == ""){
        alert("주소을 입력해주세요.");
        companyregi.address.focus();
        Aaa.preventDefault();
    }
    if(companyregi.companysize.value == ""){
        alert("규모를 입력해주세요.");
        companyregi.companysize.focus();
        Aaa.preventDefault();
    }

}

