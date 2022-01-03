<%@page import="com.project.dto.RoomTypeVO"%>
<%@page import="com.project.dto.HotelVO"%>
<%@page import="com.project.dto.UserVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int totalPrice = (int)request.getAttribute("totalPrice");
	String userEmail = (String)request.getAttribute("userEmail");
	String userName = (String)request.getAttribute("userName");
	String reservationCheckInDate = (String)request.getAttribute("reservationCheckInDate");
	String reservationCheckOutDate = (String)request.getAttribute("reservationCheckOutDate");
	String personNumber = (String)request.getAttribute("personNum");
	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	HotelVO hotelDetail = (HotelVO)request.getAttribute("hotelDetail");
	RoomTypeVO roomTypeVO = (RoomTypeVO)request.getAttribute("roomTypeVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp14812531'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '휴먼스호텔',
            amount : '<%=totalPrice%>',		
            buyer_email : '<%=userEmail%>',
            buyer_name : '<%=userName%>',
            buyer_postcode : '123-456',
        }, function(rsp) {
            if ( rsp.success ) {
               //서버단에서 결제정보 조회를 위해 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                    }
                }).done(function(data) {
                    //서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                    	msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                });
                 document.formm.submit();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/ProjectServlet?command=roomSelection&hotelSeq=<%=hotelDetail.getHotelSeq()%>";
                alert(msg);
            }
        });
        
    });
    </script>
 <form name="formm" action="ProjectServlet?command=donePayment" method="post">
	<input type="hidden" name="roomTypeSeq" value="<%=roomTypeVO.getRoomTypeSeq()%>">
 	<input type="hidden" name="hotelSeq" value="<%=hotelDetail.getHotelSeq()%>">
 	<input type="hidden" name="hotelName" value="<%=hotelDetail.getHotelName()%>">
 	<input type="hidden" name="hotelPrice" value="<%=hotelDetail.getHotelPrice()%>">
 	<input type="hidden" name="userId" value="<%=loginUser.getUserId()%>">
 	<input type="hidden" name="personNumber" value="<%=personNumber%>">
 	<input type="hidden" name="reservationCheckInDate" value="${reservationCheckInDate}">
 	<input type="hidden" name="reservationCheckOutDate" value="${reservationCheckOutDate}">
 	<input type="hidden" name="totalPrice" value="<%=totalPrice%>">
 	<input type="hidden" name="userEmail" value="<%=userEmail%>">
 	
 </form>
</body>
</html>