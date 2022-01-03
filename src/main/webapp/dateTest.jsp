<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<input type="date" id="reservationCheckInDate">


<script>

	var today = new Date();
	var day = today.getDate();
	var month = today.getMonth() +1;
	if(day < 10) {
		 day = '0' + day;
	}
	if(month < 10) {
		 month ='0'+ month;
	}
	var year = today.getFullYear();
	var minDate = year + '-' + month + '-' + day;
	
	console.log("minDate : ", minDate);
	document.getElementById("reservationCheckInDate").setAttribute('min', minDate);
	
	var today = new Date();
	var day = today.getDate();
	var month = today.getMonth() +1;
	if(day < 10) {
		 day = '0' + day;
	}
	if(month < 10) {
		 month ='0'+ month;
	}
	
	var year = today.getFullYear()+1 ;
	var maxDate = year + '-' + month + '-' + day;
	document.getElementById("reservationCheckInDate").setAttribute('max', maxDate);
	
	// 여기까지 미니멈 맥시멈 구현 성공
	
	
</script>
</body>
</html>