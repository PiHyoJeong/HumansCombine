<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8">
  <title>Human 인기 숙소 확인</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script>
    function goSubmit() {
        window.opener.name = "parentPage"; // 부모창의 이름 설정
        document.myForm.target = "parentPage"; // 타켓을 부모창으로 설정
        document.myForm.action = "ProjectServlet?command=hotelDetail&seq=1";
        document.myForm.submit();
        self.close();
    }

    function closeSubmit(){ 
    	self.close();
    }
    
 // 쿠키 생성
    function setCookie( name, value, expiredays ) {  // 쿠키저장
    	var todayDate = new Date();  //date객체 생성 후 변수에 저장
    	todayDate.setDate( todayDate.getDate() + expiredays ); 
       	 // 시간지정(현재시간 + 지정시간)
    	document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toUTCString() + ";"
    	//위 정보를 쿠키에 굽는다
    } 
 
    $(function(){           
    	if(document.cookie.indexOf("popToday=close") < 0 ){      // 쿠키 저장여부 체크
    		document.getElementById("popup_layer").style.display = "block";
    		}else {
    		document.getElementById("popup_layer").style.display = "none"; 
    		self.close();
    		}
    	});
                 
    //오늘하루만보기 닫기버튼 스크립트
    function closeToday() { 
    	setCookie( "popToday", "close" , 1  ); 
    	$("#popup_layer").css("display", "none");
    	document.getElementById("popup_layer").style.display = "none";
    	self.close();
    }
</script>

  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Questrial'>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
  <div id="popup_layer">
  <div class="popup_box">
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
         
  <div class="modal">
  <p class="message">인기 숙소 보러가기!</p>
  <div class="options">
  <form name="myForm" method="post">
    <input type="hidden" value="what" name="whatValue">
</form>
 <input type="button" onclick="goSubmit()" value="보러가기" class="btn">
 <input type="button" onclick="closeSubmit()" value="취소" class="btn">
  </div>
</div> 
 <!--팝업 버튼 영역-->
      <div class="popup_btn">
          <!--하루동안 보지않기-->
          <input type="button" id="chk_today" onclick="closeToday()" class="close_day" value="오늘하루보지않기"> 
  	  		
      </div>
      </div>
     
  </div>
</div>
  

</body>

</html>
 