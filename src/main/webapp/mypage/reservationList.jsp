<%@page import="java.util.List"%>
<%@page import="com.project.dto.RoomTypeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
	.second{
	padding: 7px;
	}
	
	button{
	display: inline-block;
	background-color: #f48840;
	color: #fff;
	font-size: 13px;
	font-weight: 500;
	padding: 10px 20px;
	transition: all .3s;
	border: none;
	outline: none;
	}
	
	button:hover {
	background-color: #fb9857 !important;
	}

button:active, button:focus{
		outline:none !important; box-shadow: none !important; background-color: #fb9857 !important; 
	}
</style>
  <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
        <c:forEach items="${rsvnList}" var="rsvnList">
          <div class="col-lg-4"  style="text-align:center; margin-top: 5%;">
            <div class="all-blog-posts">
              <div class="row"  style="margin-top: 20%">
                <div  style="  flex: 50%; max-width: 100%;">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="upload/${rsvnList.hotelImage}">
                    </div>
                    <div class="down-content">
                     <h4>[ ${rsvnList.hotelName} ]</h4>
                     <table style="margin: 0 auto;font-size: 18px; font-weight: bold;">
                     	<%-- <tr>
                     		<td>호텔 가격 : </td>
                     		<td><h4>${rsvnList.hotelPrice}</h4></td>
                     	</tr> --%>
                     	<tr>
                     		<td>결제 금액 : </td>
                     		<td class="second">
                     			<fmt:formatNumber value="${rsvnList.totalPrice}" type="currency"/>
                     		</td>
                     	</tr>
                     	<tr>
                     		<td>인원수 : </td>
                     		<td class="second">${rsvnList.personNumber}</td>
                     	</tr>
                     	<tr>
                     		<td>체크인 : </td>
                     		<td class="second">${rsvnList.reservationCheckInDate}</td>
                     	</tr>
                     	<tr>
                     		<td>체크아웃 : </td>
                     		<td class="second">${rsvnList.reservationCheckOutDate}</td>
                     	</tr>
                     </table>
                      <ul class="post-info" style="padding: 10px;">
                        <li>수영장</li>
                        <li>주차 가능</li>
                        <li>레스토랑</li>
                      </ul>
                     <!--  <a>
                      <p><button style="background-color: #f48840; border-color:#f48840; color:white;"
                       onclick="location.href='ProjectServlet?command=hotelDetail'">호텔 자세히보기</button></p>
                      </a> -->
                      
                      <button type="button" onclick="location.href='ProjectServlet?command=hotelDetail&seq=${rsvnList.hotelSeq}'">호텔 자세히보기</button>
        
 					  <button type="button" onclick="location.href='ProjectServlet?command=deleteRsvn&rsvnSeq=${rsvnList.reservationSeq}&roomTypeSeq=${rsvnList.roomTypeSeq}'">취소하기</button>
 			
                    
                    
                     </div>
                  </div>
                </div>
                
                </div>
              </div>
            </div>
           <!--  </form> -->
          </c:forEach>
          
         
        </div>
      </div>
    </section>


<%@ include file = "../footer.jsp"%>