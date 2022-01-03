<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
        <c:forEach items="${list}" var="list">
        <!-- <form action="ProjectServlet?command=hotelDetail" method="post">
        <input type="hidden" name="name" value="{list.hotelName}"> -->
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row"  style="margin-top: 20%">
                <div class="col-lg-8">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="upload/${list.hotelImage1}">
                    </div>
                    <div class="down-content">
                     <h4>${list.hotelName}</h4>
                      <ul class="post-info">
                        <li>수영장</li>
                        <li>주차 가능</li>
                        <li>레스토랑</li>
                      </ul>
                     <!--  <a>
                      <p><button style="background-color: #f48840; border-color:#f48840; color:white;" onclick="location.href='ProjectServlet?command=hotelDetail'">호텔 자세히보기</button></p>
                      </a> -->
                       <a href="ProjectServlet?command=hotelDetail&seq=${list.hotelSeq}">
                      <p><button style="background-color: #f48840; border-color:#f48840; color:white;">호텔 자세히보기</button></p>
                      </a>
                    </div>
                  </div>
                </div>
                
                </div>
              </div>
            </div>
           <!--  </form> -->
          </c:forEach>
          
          <div class="col-lg-4">
            <div class="sidebar">
              <div class="row">
                
                <!-- 검색기능시작 -->
    <section class="contact-us">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-12">
            <div class="down-contact">
              <div class="row">
                <div class="col-lg-12">
                  <div class="sidebar-item contact-form">
                    <div class="sidebar-heading">
                      <h2>호텔 찾기</h2>
                    </div>
                    <div class="content">
                      <form id="contact" action="ProjectServlet?command=hotelList" method="post">
                        
                            <fieldset>
                              <input name="location" type="text" id="location" placeholder="서울,대한민국">
                            </fieldset>
                     
                          
                            <fieldset>
                              <input name="date" type="date" id="date" placeholder="숙박일">
                            </fieldset>
                       
                         
                            <fieldset>
                              <input name="guest" type="text" id="guest" placeholder="투숙객">
                            </fieldset>
                   
              
                            <fieldset>
                              <button type="submit" id="search" class="main-button">호텔검색</button>
                            </fieldset>
               
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
   <!-- 검색기능끝 -->
   
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


<%@ include file = "../footer.jsp"%>