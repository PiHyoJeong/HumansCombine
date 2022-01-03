<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
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
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
         
         console.log("hotelRoomType", hotelRoomType  );
         console.log("parseInt(tempNumber / 2)", parseInt(tempNumber / 2) );
         console.log("stayInDay", stayInDay );
         console.log("totalPrice", totalPrice );
         
         $("#totalPrice").val(totalPrice);
	}

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
    console.log("minDate", minDate); 
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
                    
                      <form id="reservation" action="ProjectServlet?command=hotelReservation" method="post">
                        <input type="hidden" name="hotelSeq" value="${hotelDetail.hotelSeq}">
                        <div class="row">
                        
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                              호텔 이름<input name="hotelName" type="text" id="" value="${hotelDetail.hotelName}" readonly>
                            </fieldset>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                           룸 타입<select name="hotelPrice" id="hotelPrice" onchange="javascript:cal();" >
                              	  	<option value="${hotelDetail.hotelPrice}" selected>싱글룸 : ${hotelDetail.hotelPrice}</option>
			                		<option value="${priceDouble}">더블룸 : ${priceDouble}</option>
			                		<option value="${priceLuxury}">럭셔리룸 : ${priceLuxury}</option>
                             	</select>
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

                         <div class="col-md-6 col-sm-12">
                            <fieldset>
                              체크인 날짜<input type="date" name="reservationCheckInDate"  id="reservationCheckInDate" onchange="javascript:cal()" 
                             min="2021-09-30" max="2022-09-30">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              체크아웃 날짜<input type="date" name="reservationCheckOutDate"  id="reservationCheckOutDate" onchange="javascript:cal()"
                              min="today" max="today + 365)">
                              
                            </fieldset>
                          </div>
                       
                        <div class="col-md-12 col-sm-12">
                            <fieldset>
                              총액<input name="totalPrice"  id="totalPrice" type="text" value="${totalPrice}" readonly> 
                            </fieldset>
                          </div>
	                          <div class="col-md-12 col-sm-12">
	                      		<fieldset style="margin-left:40%">	                           
	                              <button type="submit" id="form-submit" class="main-button">
	                               	결제하기</button>
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
    
    </section>


<%@ include file = "../footer.jsp"%>