<%@page import="com.project.dto.RoomTypeVO"%>
<%@page import="com.project.dto.HotelVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%

	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	HotelVO hotelVO = (HotelVO)request.getAttribute("hotelVO");
	RoomTypeVO room = (RoomTypeVO)request.getAttribute("room");
	
%>
<script>
 function makePayment() {
	 window.open(url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=500");
} 

function dblCheck() {
	if(document.formm.userName.value == "") {
		alert('이름을 적어주세요.');
		document.formm.userName.focus();
		return false;
		
	}else if(document.formm.userEmail.value == "") {
		alert('이메일을 적어주세요.');
		document.formm.userEmail.focus();
		return false;
		
	}else if(document.formm.userEmail.value.indexOf("@") == -1) {
		alert('이메일 형식이 아닙니다.');
		document.formm.userEmail.focus();
		return false;
		
	}else if(document.formm.userEmail.value != document.formm.chkEmail.value) {
		alert('이메일이 같지 않습니다.');
		document.formm.userEmail.focus();
		return false;
	}
	
	return;
}

</script>
	 <section class="contact-us">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-12">
            <div class="down-contact">
              <div class="row">
                <div class="col-lg-8" style="margin:5% auto">
                  <div class="sidebar-item contact-form">
            
                    <h4 style="padding:13px; text-align:center;font-weight: 600;">고객님의 예약정보를 입력해 주세요.</h4>
                   
                    <div class="content">
                      <form id="info" method="post" name="formm" onsubmit="makePayment()" action="ProjectServlet?command=makePayment"> <!-- 여기 수정 -->
                        <div class="row">
                        
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                               아이디<input name="userId" id="userId" value="<%=loginUser.getUserId() %>" readonly>
                            </fieldset>
                          </div>
                          
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                               이름<input name="userName" id="userName">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              이메일<input name="userEmail" type=text id="userEmail" placeholder="입력하신 이메일주소로 예약메일이 발송됩니다.">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              이메일 재입력<input name="chkEmail" type=text id="chkEmail">
                            </fieldset>
                          </div>
							<br>
							
	                         <fieldset>
	                           <div class="col-md-12 col-sm-12">
    							<legend><h3>예약정보</h3></legend> <br>
	                              <input name="roomTypeSeq" type="hidden" id="roomTypeSeq" value="${room.roomTypeSeq}">
	                              <input name="hotelSeq" type="hidden" id="hotelSeq" value="<%=hotelVO.getHotelSeq()%>">
	                              <input name="reservationCheckInDate" type="hidden" id="reservationCheckInDate" value="${reservationCheckInDate}">
	                              <input name="reservationCheckOutDate" type="hidden" id="reservationCheckOutDate" value="${reservationCheckOutDate}">
	                              예약 숙소이름 <input name="HotelName" type=text id="HotelName" value="<%=hotelVO.getHotelName()%>" readonly>
	                              예약 객실 <input name="RoomType" type=text id="RoomType" value="<%=room.getRoomType()%>" readonly>
	                              숙박 기간 <input name="lengthOfStay" type=text id="lengthOfStay" value="${reservationCheckInDate} ~ ${reservationCheckOutDate}" readonly>
	                           	  예약 인원 <input name="personNumber" type="text" id="personNumber" value="${personNumber} 명" readonly>
	                           	  		  <input name="personNum" type="hidden" id="personNum" value="${personNumber}">	<!-- 여기부분 수정했음 -->
	                           	  결제 금액 <input name="totalPriceDisplay" type="text" id="totalPriceDisplay" value="<fmt:formatNumber value="${(room.roomPrice + hotelVO.hotelPrice) * diffDay}" 
	                             	 	type="currency"/>" readonly>
	                           	  		  <input name="totalPrice" type="hidden" id="totalPrice" value="${(room.roomPrice + hotelVO.hotelPrice) * diffDay}">
	                           	  
	                          	</div> 
	                            </fieldset>
	                           
	                          <div class="col-md-12 col-sm-12">
	                      		<fieldset style="margin-left:40%">
	                           	  <button type="button" id="form-submit" class="main-button" onclick="history.back(-1)">돌아가기</button>
	                              <button type="submit" id="submit" class="main-button" onclick="return dblCheck()">결제 진행하기</button>
	                           </fieldset>
                          </div>
                             <!--  </fieldset> -->
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
    </section>


<%@ include file = "../footer.jsp"%>