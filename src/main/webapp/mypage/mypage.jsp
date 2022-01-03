<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>

	 <section class="contact-us">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-12">
            <div class="down-contact">
              <div class="row">
                <div class="col-lg-8" style="margin:5% auto">
                  <div class="sidebar-item contact-form">
            
                    <h4 style="padding:13px; text-align:center;font-weight: 600;">회원정보</h4>
                  	<!-- 여기가 실질적으로 mypage가 되어야 한다. 이미 내가 코드 다 만들어놔서 -->
                    <div class="content">
                      <form id="join" action="ProjectServlet?command=userUpdateForm" method="get">
                        <div class="row">
                        
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                              이름<input name="name" type="text" id="name" value="${loginUser.getUserName()}" readonly>
                            </fieldset>
                          </div>
                          
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                             아이디<input name="id" type="text" id="id" value="${loginUser.getUserId()}" readonly>
                            </fieldset>
                          </div>

                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              이메일<input name="email" type=text id="email" value="${loginUser.getUserEmail()}" readonly>
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              전화번호<input name="phone" type=text id="phone" value="${loginUser.getUserPhone()}" readonly>
                            </fieldset>
                          </div>
                          
                        <!-- 
                         <fieldset>
    							<legend><h3>예약정보</h3></legend>
	                           <div class="col-md-12 col-sm-12">
	                            <fieldset>
	                              예약 숙소이름 <input name="phone" type=text id="phone" placeholder="서울신라호텔">
	                              예약 날짜 <input name="phone" type=text id="phone" placeholder="2021-09-21">
	                           	  예약 인원 <input name="phone" type=text id="phone" placeholder="2명">
	                            </fieldset>
	                          </div> -->
	                          
	                          <div class="col-md-12 col-sm-12">
	                      		<fieldset style="margin-left:40%">	                           
	                              <button type="button" id="form-submit" class="main-button" onclick="location.href='ProjectServlet?command=userUpdateForm'">수정하기</button>
	                              <button type="button" id="form-submit" class="main-button" onclick="history.back(-1)">돌아가기</button>
	                           </fieldset>
                          	  </div>
                          	  
                           <!--    </fieldset> -->
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