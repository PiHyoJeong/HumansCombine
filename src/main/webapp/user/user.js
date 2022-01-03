window.onload = function () {
   var user_id = getCookie("cid");
   /*
   document.getElementById('userId').value = user_id;
    
    if(document.getElementById('userId').value != ""){
      document.getElementById('cb1').checked = true;
   }
   */
}
function loginCheckForm() {
   if (document.loginForm.userId.value == "") {
      alert('아이디를 입력하여 주십시오.');
      document.loginForm.userId.focus();
      return false;
   }
   if (document.loginForm.userPwd.value == "") {
      alert('비밀번호를 입력하여 주십시오.');
      document.loginForm.userPwd.focus();
      return false;
   }
		
   if(document.loginForm.cb1.checked){
      var user_id = document.loginForm.userId.value;
      setCookie("cid", user_id, 7);
   }else{
      deleteCookie("cid");
   }
   
}

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}