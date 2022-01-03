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
        <c:forEach items="${list}" var="list">
        <!-- <form action="ProjectServlet?command=hotelDetail" method="post">
        <input type="hidden" name="name" value="{list.hotelName}"> -->
          <div class="col-lg-4"  style="text-align:center; margin-top: 5%;">
            <div class="all-blog-posts">
              <div class="row"  style="margin-top: 20%">
                <div  style="  flex: 50%; max-width: 100%;">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="upload/${list.hotelImage}">
                    </div>
                    <div class="down-content">
                     <h4>${list.hotelName}</h4>
                      <ul class="post-info"  style="padding: 10px;"> 
                        <li>${list.hotelDe1 }</li>
                        <li>${list.hotelDe2 }</li>
                        <li>${list.hotelDe3 }</li>
                      </ul>
                     <!--  <a>
                      <p><button style="background-color: #f48840; border-color:#f48840; color:white;" onclick="location.href='ProjectServlet?command=hotelDetail'">호텔 자세히보기</button></p>
                      </a> -->
                       <a href="ProjectServlet?command=hotelDetail&seq=${list.hotelSeq}">
                      <button type="button">호텔 자세히보기</button>
                      </a>
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