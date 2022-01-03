<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
    <script>
        function nwindow(){
            var url="ProjectServlet?command=specialPriceHotelListPopUp";
            window.open(url,"","width=600,height=250,left=400,top=100");
        }
        
        
    </script>
    
    <body onLoad="nwindow()">
    
    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="heading-page header-text">
      <section class="page-heading">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="text-content">
                <h4>Welcome!</h4>
                <h2>Human Hotels Combined</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->
    
   <!-- 검색기능시작 -->
    <section class="contact-us">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-12">
            <div class="down-contact">
              <div class="row">
                <div class="col-lg-8" style="margin:5% auto">
                  <div class="sidebar-item contact-form">
                    <div class="sidebar-heading">
                      <h2>호텔 찾기</h2>
                    </div>
                    <div class="content">
                      <form id="contact" action="ProjectServlet?command=hotelList" method="post">
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              <input name="location" type="text" id="location" placeholder="서울,대한민국">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              <input name="date" type="date" id="date" placeholder="숙박일">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              <input name="guest" type="text" id="guest" placeholder="투숙객">
                            </fieldset>
                          </div>
                          
                         <div class="col-lg-12">
                            <fieldset>
                              <button type="submit" id="search" class="main-button" style="width: 48%;" >호텔검색</button>
                            </fieldset>
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
   <!-- 검색기능끝 -->
    
    <!-- 작은배너시작 -->
        <section class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="main-content">
              <div class="row">
                <div class="col-lg-8">
                  <span>최고의 시설들!</span>
                  <h4>전국 최고의 숙소들을 확인해보세요!</h4>
                </div>
                <div class="col-lg-4">
                  <div class="main-button">
                    <a href="ProjectServlet?command=hotelAllList">보러가기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 작은배너 끝 -->
    
    <!-- 할인숙소 시작-->
     <!--  <section class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="main-content" style="background-image:url(assets/images/blog-post-03.jpg);">
              <div class="row">
                <div class="col-lg-8">
                  <span>할인 숙소</span>
                  <h4>지금 바로 특가 숙소들 확인하기!</h4>
                </div>
                <div class="col-lg-4">
                  <div class="main-button">
                    <a href="ProjectServlet?command=specialPriceHotelList">보러가기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->
      
    <!-- 할인숙소 끝 -->
    
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
          <div class="item">
           <a href="ProjectServlet?command=hotelList&location=서울" >
            <img src="upload/seoul_main.jpg" alt="">
            </a>
            <div class="item-content">
              <div class="main-content">
                <h2>서울</h2>
              </div>
            </div>
          </div>
          
          <div class="item">
             <a href="ProjectServlet?command=hotelList&location=인천">
            <img src="upload/incheon_main.jpg" alt="">
            </a>
             <div class="item-content">
              <div class="main-content">
                <h2>인천</h2>
              </div>
            </div>
          </div>
         
          <div class="item">
             <a href="ProjectServlet?command=hotelList&location=제주">
            <img src="upload/jeju_main.jpg" alt="">
            </a>
             <div class="item-content">
              <div class="main-content">
                <h2>제주</h2>
              </div>
            </div>
          </div>
        
          <div class="item">
               <a href="ProjectServlet?command=hotelList&location=부산">
               <img src="upload/pusan_main.jpg" alt="">
               </a>
                <div class="item-content">
              <div class="main-content">
                <h2>부산</h2>
              </div>
            </div>
          </div>
        
          <div class="item">
             <a href="ProjectServlet?command=hotelList&location=여수">
            <img src="upload/yeosu_main.jpg" alt="">
            </a>
             <div class="item-content">
              <div class="main-content">
                <h2>여수</h2>
              </div>
            </div>
          </div>
          
          <div class="item">
              <a href="ProjectServlet?command=hotelList&location=광주">
            <img src="upload/kwangju_main.jpg" alt="">
              </a>
               <div class="item-content">
              <div class="main-content">
                <h2>광주</h2>
              </div>
            </div>
          </div>
          
        </div>
      </div>
</body>
    <!-- Banner Ends Here -->
<%@ include file = "../footer.jsp"%>

    
   