<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function checkElement() {
		if(document.formm.userId.value == "") {
			alert("아이디를 입력하세요.");
			document.formm.userId.focus();
			return false;
		}else if(document.formm.userEmail.value.indexOf("@") == -1){
			alert("올바른 이메일 형식이 아닙니다.");
			document.formm.userEmail.focus();
			return false;
		}else if(document.formm.userEmail.value.indexOf(".com") == -1) {
			alert("올바른 이메일 형식이 아닙니다.");
			document.formm.userEmail.focus();
			return false;
		}
		return;
	}
</script>

<style>
	/* 'Open Sans' font from Google Fonts */
	@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);
	
	body {
	  background: #456;
	  font-family: 'Open Sans', sans-serif;
	}
	
	.login {
	  width: 400px;
	  margin: 16px auto;
	  font-size: 16px;
	}
	
	/* Reset top and bottom margins from certain elements */
	.login-header,
	.login p {
	  margin-top: 0;
	  margin-bottom: 0;
	}
	
	/* The triangle form is achieved by a CSS hack */
	.login-triangle {
	  width: 0;
	  margin-right: auto;
	  margin-left: auto;
	  border: 12px solid transparent;
	  border-bottom-color: #28d;
	}
	
	.login-header {
	  background: #28d;
	  padding: 20px;
	  font-size: 1.4em;
	  font-weight: normal;
	  text-align: center;
	  text-transform: uppercase;
	  color: #fff;
	}
	
	.login-container {
	  background: #ebebeb;
	  padding: 12px;
	}
	
	/* Every row inside .login-container is defined with p tags */
	.login p {
	  padding: 12px;
	}
	
	.login input {
	  box-sizing: border-box;
	  display: block;
	  width: 100%;
	  border-width: 1px;
	  border-style: solid;
	  padding: 16px;
	  outline: 0;
	  font-family: inherit;
	  font-size: 0.95em;
	}
	
	.login input[type="email"],
	.login input[type="password"] {
	  background: #fff;
	  border-color: #bbb;
	  color: #555;
	}
	
	/* Text fields' focus effect */
	.login input[type="email"]:focus,
	.login input[type="password"]:focus {
	  border-color: #888;
	}
	
	.login input[type="submit"] {
	  background: #28d;
	  border-color: transparent;
	  color: #fff;
	  cursor: pointer;
	}
	
	.login input[type="submit"]:hover {
	  background: #17c;
	}
	
	/* Buttons' focus effect */
	.login input[type="submit"]:focus {
	  border-color: #05a;
	}
</style>
</head>
<body>
	<div class="login">
	  <div class="login-triangle"></div>
	  
	  <h2 class="login-header">비밀번호 찾기</h2>
	
	  <form class="login-container" method="post" action="ProjectServlet?command=findPwd" name="formm" onsubmit="return checkElement()">
	    <p><input type="text" placeholder="아이디를 입력하세요." name="userId" id="userId"></p>
	    <p><input type="text" placeholder="이메일 주소를 입력하세요." name="userEmail" id="userEmail"></p>
	    <p><input type="submit" value="임시 비밀번호 발급받기"></p>
	  </form>
	</div>
</body>
</html>