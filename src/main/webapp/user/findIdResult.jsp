<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	  
	  <h2 class="login-header">아이디 조회결과</h2>
	
	  <div class="login-container">
	  <c:choose>
	  	<c:when test="${userId != null}">
		  	<p>고객님의 아이디는 [${userId }]입니다.</p>
		    <p><input type="button" value="로그인 계속하기" id="goLogin" onclick="window.close()"></p>
		    <p><input type="button" value="비밀번호 조회하기" id="findPwd" onclick="location.href='./user/findPwdForm.jsp'"></p>
	  	</c:when>
	  	<c:otherwise>
	  		<p>고객님의 아이디를 찾을 수 없습니다.</p>
		    <p><input type="button" value="아이디 계속찾기" onclick="history.back(-1)"></p>
		    <p><input type="button" value="닫기" onclick="self.close()"></p>
	  	</c:otherwise>
	  </c:choose>
	  </div>
	</div>
</body>
</html>