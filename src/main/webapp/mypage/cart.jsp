<%@page import="com.project.dto.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
        <c:forEach items="${cartList}" var="cartList">
          <div class="col-lg-4"  style="text-align:center; margin-top: 5%;">
            <div class="all-blog-posts">
              <div class="row"  style="margin-top: 20%">
                <div  style="  flex: 50%; max-width: 100%;">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="upload/${cartList.hotelImage}">
                    </div>
                    <div class="down-content">
                     <h4>${cartList.hotelName}</h4>
                      <ul class="post-info" style="padding: 10px;">
                        <li>수영장</li>
                        <li>주차 가능</li>
                        <li>레스토랑</li>
                      </ul>
                     <!--  <a>
                      <p><button style="background-color: #f48840; border-color:#f48840; color:white;"
                       onclick="location.href='ProjectServlet?command=hotelDetail'">호텔 자세히보기</button></p>
                      </a> -->
                    
                      <button style="background-color: #f48840; border-color:#f48840; color:white;" onclick="location.href='ProjectServlet?command=hotelDetail&seq=${cartList.hotelSeq}'">호텔 자세히보기</button>
                  
                  	<%-- <a href="ProjectServlet?command=hotelReservation&hotelSeq=${cartList.hotelSeq}">
                	<p><button style="background-color: #f48840; border-color:#f48840; color:white;">&nbsp;&nbsp;호텔 예약하기&nbsp;&nbsp;</button></p>
                	</a>  --%>
                    
                    
 					<button style="background-color: #f48840; border-color:#f48840; color:white;" onclick="location.href='ProjectServlet?command=cartDelete&cartSeq=${cartList.cartSeq}'">취소하기</button>
 					 
                    
                    
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