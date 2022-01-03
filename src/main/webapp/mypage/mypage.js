function userUpdate() {
	if(document.formm.userPwd.value == "") {
		alert("비밀번호를 입력하세요.");
		formm.userPwd.focus();
		return false;
	} else if(document.formm.userPwd.value.length <= 3){
		alert("비밀번호가 너무 짧습니다.");
		formm.userPwd.focus();
		return false;
	} else if(document.formm.userPwd.value != document.formm.userPwd2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		formm.userPwd.focus();
		return false;
	}else if(document.formm.userEmail.value =="") {
		alert("이메일을 입력하세요.");
		formm.userEmail.focus();
		return false;
	}else if(document.formm.userPhone.value =="") {
		alert("전화번호를 입력하세요.");
		formm.userPhone.focus();
		return false;
	}else {
	document.formm.action="ProjectServlet?command=userpageUpdate";
	document.formm.submit();
	}
	return true;
}