<%@page import="com.project.dto.RoomTypeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
   select{
    width: 100%;
    height: 46px;
    border: 1px solid #776d6d;
    font-size: 13px;
    font-weight: 500;
    color: #776d6d;
    outline: none;
    padding: 0px 15px;
    margin-bottom: 30px;
    }
    
    .content li{
        font-size: 15px;
    font-weight: 500;
    color: black;
    display: inline-block;
    border: 1px solid gray;
    padding: 10px 18px;
    transition: all .3s;
   }
   .hotel tr:not(:first-child,:last-child){
     border-bottom: 1px solid gray;
     }
   #noReservation {
   	 text-decoration: none;
   	 color:red;
   }
     
</style>

<script>
   function cal(){
      //룸 타입
      var hotelRoomType = $("#hotelPrice option:selected").val();
      //인원 수
      var personNumber = $("#personNumber option:selected").val();      
      //달력(체크인, 체크아웃)
      var reservationCheckInDate = $("#reservationCheckInDate").val();
      var reservationCheckOutDate = $("#reservationCheckOutDate").val();
      
         var firstDateObj = new Date(reservationCheckInDate.substring(0, 4),
               reservationCheckInDate.substring(5, 7) - 1, 
               reservationCheckInDate.substring(8, 10));
         var secondDateObj = new Date(reservationCheckOutDate.substring(0, 4), 
               reservationCheckOutDate.substring(5, 7) - 1, 
               reservationCheckOutDate.substring(8, 10));
         var betweenTime = Math.abs(secondDateObj.getTime() - firstDateObj.getTime());
         var stayInDay = Math.floor(betweenTime / (1000 * 60 * 60 * 24));
         console.log("stayInDay", stayInDay );
         
         var tempNumber = Number(personNumber)+1;
         console.log( parseInt(tempNumber / 2) );
         var totalPrice = parseInt(hotelRoomType)*parseInt(tempNumber / 2)*parseInt(stayInDay);

         console.log("firstDateObj", firstDateObj );
         console.log("secondDateObj", secondDateObj );
         console.log("hotelRoomType", hotelRoomType  );
         console.log("parseInt(tempNumber / 2)", parseInt(tempNumber / 2) );
         console.log("stayInDay", stayInDay );
         console.log("totalPrice", totalPrice );
         
         $("#totalPrice").val(totalPrice);
    
   	}
	
     function goReservationInfo(roomTypeSeq) {
    	 
    	//alert(roomTypeSeq);
    	var reservationCheckInDate = $("#reservationCheckInDate").val();
    	$("#firstDateObj").val(reservationCheckInDate);
    	
    	$("#roomTypeSeq").val(roomTypeSeq);
    	$("#formm").submit();
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
                    <h4 style="padding:13px; text-align:center;font-weight: 600;">호텔 예약하기</h4>
                    <div class="content">
                    
                    <div class="blog-thumb">
                       <img src="assets/images/blog-post-03.jpg" alt="호텔사진으로 변경" style="margin-bottom: 5%;">
                    </div>
                    
                      <form id="formm" method="post" action="ProjectServlet?command=goReservationForm&roomTypeSeq=${roomList.roomTypeSeq }&hotelSeq=${hotelDetail.hotelSeq}">
                        <input type="hidden" name="roomTypeSeqNum" id="roomTypeSeq" value="${roomList.roomTypeSeq }">
                        <input type="hidden" name="hotelSeq" value="${hotelDetail.hotelSeq}">
                        <div class="row">
                        
                        <div class="col-lg-12">
                        <div class="sidebar-heading">
                           <h2>호텔 정보</h2>
                            </div>
                       </div>       
                       
                         <div class="col-md-6 col-sm-12">
                            <fieldset>
                              호텔 이름<input name="hotelName" type="text" id="hotelName" value="${hotelDetail.hotelName}" readonly>
                            </fieldset>
                          </div>
                          
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              위치<input name="hotelLocation" type="text" id="hotelLocation" value="${hotelDetail.hotelLocation}" readonly>
                            </fieldset>
                          </div>
                          
                           <div class="col-lg-12">
                           <div class="sidebar-item tags">
                             <div class="sidebar-heading">
                               <h2>부대 시설</h2>
                             </div>
                             <div class="content">
                               <ul style="margin-bottom: 3%;">
                                 <li>수영장</li>
                                 <li>무료 조식</li>
                                 <li>무료 공항 픽업</li>
                                 <li>가까운 지하철역</li>
                               </ul>
                             </div>
                           </div>
                           </div>
                          
                           <div class="col-lg-12">
                                <div class="sidebar-heading">
                             <h2>예약 정보</h2>
                            </div>  
                       </div>     
                       
                         <div class="col-md-6 col-sm-12">
                            <fieldset>
                              체크인 날짜<input type="date" name="reservationCheckInDate"  id="reservationCheckInDate" onchange="javascript:cal()" >
                            </fieldset>
                          </div>
                          
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              체크아웃 날짜<input type="date" name="reservationCheckOutDate"  id="reservationCheckOutDate" onchange="javascript:cal()">
                            </fieldset>
                          </div>
                            
                        <div class="col-md-6 col-sm-12">
                            <fieldset>
                             인원수<select name="personNumber" id="personNumber" onchange="javascript:cal();">
                                <option value="1" selected >1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                             </select>  
                            </fieldset>
                          </div>
                       
                        <div class="col-lg-12">
                                <div class="sidebar-heading">
                             <h2>객실 정보</h2>
                            </div>  
                       </div>     
                         
                         <div class="col-md-12 col-sm-12">
                            <table class="hotel" style="width:100%; font-size: 17px;margin-bottom: 3%;">
                               <tr style="padding-bottom:30px">
                                  <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진</th>
                                  <th style="text-align:center">객실타입</th>
                                  <th>크기</th>
                                  <th>&nbsp;&nbsp;&nbsp;&nbsp;가격</th>
                                  <th>예약하기</th>
                               </tr>

                               <c:forEach items="${roomTypeList}" var="roomList" varStatus="status">
                               <input type="hidden" value=${roomList.roomTypeSeq }>
                               <tr>
                                  <td>
                                     <div class="author-thumb">
                                     <img src="assets/images/${roomList.roomImage} " alt="">
                                      </div>
                                  </td>
                                  <td style="text-align:center;">
                                  	<input type="hidden" name="roomType1" id="roomType" value="${roomList.roomType }" >${roomList.roomType }
                                  </td>
                                  <td>
                                 	 <input type="hidden" name="roomSize1" id="roomSize" value="${roomList.roomSize }">${roomList.roomSize }㎡</td>
                                  <td>
	                                  <input type="hidden" name="hotelPrice1" id="hotelPrice" value="${hotelDetail.hotelPrice + roomList.roomPrice}">
	                                  <fmt:formatNumber value="${hotelDetail.hotelPrice + roomList.roomPrice}" 
	                             	 	type="currency"/>
                                  </td>
                                  <td>
	                                  <c:choose>
		                                  <c:when test="${roomList.roomResult == 2}">
		                                  	<a href="#" id="noReservation">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약불가</a>
		                                  </c:when>
	                                  <c:otherwise>
	                                  	<a href="#" id="aTagsub" onclick="goReservationInfo('${roomList.roomTypeSeq }')">예약하러 가기</a>
	                                  </c:otherwise>
	                                  </c:choose>
                                  </td>

                               </tr>
                               
                               </c:forEach>
                            </table>
                         </div>
                       
                       <div class="col-lg-12">
                                <div class="sidebar-heading">
                             <h2>환불 규정</h2>
                            </div>  
                       </div>     
                       
					<div class="col-md-12 col-sm-12">
					<textarea rows="15" cols="100">
					 주문 취소 및 반품
					 일반적으로 소비자는 자신이 체결한 전자상거래 계약에 대해 그 계약의 내용을 불문하고 그 청약철회 및 계약해제의 기간(통상 7일) 내에는 청약철회 등을 자유롭게 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항).
					※ 소비자에게 불리한 규정(주문 취소나 반품 금지 등)이 포함된 구매계약은 효력이 없습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제35조).
					 하지만, 다음 어느 하나에 해당하는 경우에는 인터넷쇼핑몰 사업자의 의사에 반(反)해서 주문 취소 및 반품을 할 수 없습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 본문 및 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조).
					1. 소비자의 잘못으로 물건이 멸실(물건의 기능을 할 수 없을 정도로 전부 파괴된 상태)되거나 훼손된 경우(다만, 내용물을 확인하기 위해 포장을 훼손한 경우에는 취소나 반품이 가능)
					2. 소비자가 사용해서 물건의 가치가 뚜렷하게 떨어진 경우
					3. 시간이 지나 다시 판매하기 곤란할 정도로 물건의 가치가 뚜렷하게 떨어진 경우
					4. 복제가 가능한 물건의 포장을 훼손한 경우
					5. 용역 또는 「문화산업진흥 기본법」 제2조제5호의 디지털콘텐츠의 제공이 개시된 경우. 다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 않은 부분은 제외
					6. 소비자의 주문에 따라 개별적으로 생산되는 상품 또는 이와 유사한 상품 등의 청약철회 및 계약해제를 인정하는 경우 인터넷쇼핑몰 사업자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 주문 취소 및 반품이 되지 않는다는 사실을 별도로 알리고 소비자의 서면(전자문서 포함)에 의한 동의를 받은 경우
					 인터넷쇼핑몰 사업자는 위 2.부터 5.까지의 사유에 해당하여 청약철회 등이 불가능한 상품에 대해 그 사실을 상품의 포장이나 그 밖에 소비자가 쉽게 알 수 있는 곳에 명확하게 적거나 시험 사용 상품을 제공하는 등의 방법으로 청약철회 등의 권리 행사가 방해받지 않도록 조치해야 합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제6항 본문). 만약 사업자가 이와 같은 조치를 안했다면, 소비자는 청약철회 등의 제한사유에도 불구하고 청약철회 등을 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 단서).
					 다만, 위의 5. 중 디지털콘텐츠에 대하여 소비자가 청약철회 등을 할 수 없는 경우에는 청약철회 등이 불가능하다는 사실의 표시와 함께 다음의 어느 하나의 방법에 따라 시험 사용 상품을 제공하는 등의 방법으로 청약철회 등의 권리 행사가 방해받지 않도록 해야 합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제6항 단서 및 규제「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의2).
					√ 일부 이용의 허용: 디지털콘텐츠의 일부를 미리보기, 미리듣기 등으로 제공
					√ 한시적 이용의 허용: 일정 사용기간을 설정하여 디지털콘텐츠 제공
					√ 체험용 디지털콘텐츠 제공: 일부 제한된 기능만을 사용할 수 있는 디지털콘텐츠 제공
					√ 위의 방법으로 시험 사용 상품 등을 제공하기 곤란한 경우: 디지털콘텐츠에 관한 정보 제공
					</textarea>
					</div>               

                    
                             <div class="col-md-12 col-sm-12">
                               <fieldset style="margin-left:40%">                              
                                 <button type="button" id="form-submit" class="main-button" 
                                    onclick="history.back(-1)">돌아가기</button>
                              </fieldset>
                               </div>
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
	
	var today = new Date();
	var day = today.getDate() +1;
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
	document.getElementById("reservationCheckOutDate").setAttribute('min', minDate);
	
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
	document.getElementById("reservationCheckOutDate").setAttribute('max', maxDate);
	
</script>
    </section>


<%@ include file = "../footer.jsp"%>