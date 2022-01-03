<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<style type="text/css">

	#wrap{     
	  margin: 0 20px;
	}

	input[type=button], input[type=submit] {
	  float: right;
	}
<style type="text/css">
	body{   
	  background-color:#B96DB5;
	  font-family: Verdana;
	}
	#wrap{     
	  margin: 0 20px;
	}
	input[type=text]{
	width: 60%;
    margin: 1 0 0 11px;
    height: 40px;
    border: 1px solid #776d6d;
    font-size: 13px;
    font-weight: 500;
    color: #776d6d;
    outline: none;
    padding: 0px 15px;
    margin-bottom: 30px;
    }
	input[type=button], input[type=submit] {
	  float: right;
	  isplay: inline-block;
	    background-color: #f48840;
	    color: #fff;
	    font-size: 13px;
	    font-weight: 500;
	    padding: 12px 20px;
	    transition: all .3s;
	    border: none;
	    outline: none;
}
	}
</style> 

<script type="text/javascript">
	function idok(){
		
		opener.formm.userId.value="${userId}"; 
		//opener.formm.reid.value="${userId}";
		self.close();
	}
</script>
  <body style="padding: 20px;">

	<div id="wrap">
  		<h1 style="text-align: center;">ID 중복확인</h1>
  		<form method="post" name="formm" action="ProjectServlet?command=id_check_form" style="margin-right:0 ">
  			User ID <input type=text name="userId" value=""> 
                    <input type=submit value="검색" class="submit"><br> 
            <div style="margin-top: 20px">
            	<script>
            		opener.document.formm.userId.value="";
            	</script>
            	 <c:if test="${message == 1 }">
            	 	${userId}는 이미 사용중인 아이디 입니다.
            	 </c:if> 
            	 <c:if test="${message == -1 }">
            	 	${userId}는 사용가능한 아이디 입니다.
            	 	<input type="button" value="사용" class="cancel" onclick="idok()">
            	 </c:if>           
            </div>
  		</form>
    </div>
  </body>
</html>