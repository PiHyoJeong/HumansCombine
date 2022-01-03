<%@page import="com.project.dto.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>호텔 예약 시스템</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    
    <!-- js -->
    <script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="user/user.js?ver=1"></script>
    <script type="text/javascript" src="mypage/mypage.js?ver=1"></script>
    <script type="text/javascript" src="user/join.js?ver=1"></script>
    <script type="text/javascript" src="hotel/regist.js?ver=1"></script>   
    <script type="text/javascript" src="hotel/hotelUpdate.js?ver=1"></script>
 
	<style>	
	  img:hover {
	  transition: transform 1s;
	  filter: brightness(70%);
		}
		
	</style>
	
                  			
	
                  			 

  </head>

  <body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="index.jsp"><h2>human<em>.</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
			
			<c:if test="${empty loginUser}">
				  <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=index">Home
	                </a>
	              </li>
				  <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=loginForm">로그인</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=contract">회원가입</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=mypage">마이페이지</a>
	              </li>
	                <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=cartList">찜목록</a>
	              </li>
			</c:if>
			
			<!-- 관리자 -->
          	<c:if test="${loginUser.userGrade == 2}">
          		  <li class="nav-item">
	                <a class="nav-link" href="#">${loginUser.userName} 관리자님 환영합니다</a>
	              </li>
          	      <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=index">Home
	                </a>
	              </li> 
	              <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=mypage">마이페이지</a>
	              </li>
	                <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=cartList">찜목록</a>
	              </li>
	                <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=rsvnList">예약목록</a>
	              </li>
	               <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=hotelRegisterForm">숙소등록</a>                          
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=logout">로그아웃</a>
	              </li>
          	</c:if>
          	
          	<!-- 일반회원 -->
			<c:if test="${loginUser.userGrade == 1}">
				  <li class="nav-item">
	                <a class="nav-link" href="#">${loginUser.userName}님 환영합니다</a>
	              </li>
				  <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=index">Home
	                </a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=mypage">마이페이지</a>
	              </li>
	              
	              <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=cartList">찜목록</a>
	              </li>
	              
	                <li class="nav-item">
	                <a class="nav-link" href="ProjectServlet?command=rsvnList">예약목록</a>
	              </li>

	              <li class="nav-item">
	                <!-- <a class="nav-link" href="ProjectServlet?command=logout" onclick="javascript:kakaoLogout();">로그아웃</a> -->
	                <!-- <a class="nav-link" href="javascript:kakaoLogout();">로그아웃</a> -->
	                <a class ="nav-link"href="javascript:kakaoLogout();">로그아웃</a><br>
	               
	               
	               <script src = "https://developers.kakao.com/sdk/js/kakao.js"></script>
     <script>
	     Kakao.init("e1e25dd75184da8323e8117e2cf6487f");
	     function kakaoLogout() {
	    	    if (Kakao.Auth.getAccessToken()) {
	    	      //토큰이 있으면
	    	      Kakao.API.request({
	    	        //로그아웃하고
	    	        url: '/v1/user/unlink',
	    	        success: function (response) {
	    	          //console.log(response)
	    	      location.replace("ProjectServlet?command=logout");
	    	        },
	    	        fail: function (error) {
	    	          console.log(error)
	    	        },
	    	      })
	    	    }
	    	  }
     </script>
                  		
                      
              </li>
      	</c:if>
          
            </ul>
          </div>
          
        </div>
      </nav>
    </header>