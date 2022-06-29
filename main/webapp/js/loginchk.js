'use strict'

const logFrm = document.dislogin;
const managelogFrm = document.managelogin;

function loginChk(){
	
	if(logFrm.loginname.value == ""){
		alert("이름을 입력하지 않았습니다.");
		logFrm.loginname.focus();
		return;
	}	
	
	if(logFrm.loginmobile.value ==""){
		alert("연락처를 입력하지 않았습니다.");
		logFrm.loginmobile.focus();
		return;
	}
}

function manageloginChk(){
	
	if(managelogFrm.manageid.value==""){
		alert("아이디를 입력하지 않았습니다");
		managelogFrm.manageid.focus();
		return;
	}
	
	if(managelogFrm.managepw.value==""){
		alert("패스워드를 입력하지 않았습니다.");
		managelogFrm.managepw.focus();
		return;
	}
}

