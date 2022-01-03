function joinCheckForm() {
   
   if (document.formm.userName.value == "") {
      alert('이름을 입력하여 주십시오.');
      document.formm.userName.focus();
      return false;
   }
   if (document.formm.userId.value == "") {
      alert('아이디를 입력하여 주십시오.');
      document.formm.userId.focus();
      return false;
   }
/*	else if (document.formm.reid.value.length == 0) {
		alert('중복 체크를 하지 않았습니다.');
		document.formm.userName.focus();
		return false;
	}*/

   if (document.formm.userPwd.value == "") {
      alert('비밀번호를 입력하여 주십시오.');
      document.formm.userPwd.focus();
      return false;
   }

   if (document.formm.userPwd2.value == "") {
      alert('비밀번호 확인부분을 입력하여 주십시오.');
      document.formm.userPwd2.focus();
      return false;
   }


   if (document.formm.userEmail.value == "") {
      alert('이메일을 입력하여 주십시오.');
      document.formm.userEmail.focus();
      return false;
   }

   if (document.formm.userPhone.value == "") {
      alert('전화번호를 입력하여 주십시오.');
      document.formm.userPhone.focus();
      return false;
   }


   if(document.formm.userGrade.value ==""){
     alert('회원등급을 선택하여 주십시오.');
      document.formm.userGrade.focus();
      return false;
   } 
	
   

    if(document.getElementById('userPwd').value !='' && document.getElementById('userPwd2').value!=''){
       if(document.getElementById('userPwd').value==document.getElementById('userPwd2').value){
       alert('회원가입이 완료되었습니다.')         
        } else{
       alert('비밀번호가 일치하지 않습니다.')        
      }
   }
	return true;

}