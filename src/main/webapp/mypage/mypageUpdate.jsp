<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>

<%
	session.getAttribute("loginUser");
%>
<script>
	
</script>
	 <section class="contact-us">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-12">
            <div class="down-contact">
              <div class="row">
                <div class="col-lg-8" style="margin:5% auto">
                  <div class="sidebar-item contact-form">
            
                    <h4 style="padding:13px; text-align:center;font-weight: 600;">회원정보 수정</h4>
                   
                    <div class="content">
                      <form id="join" method="post" name="formm" onsubmit="return userUpdate();"> <!-- 여기 수정 -->
                        <div class="row">
                        
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                               이름<input name="userName" id="userName" placeholder="${loginUser.getUserName() } (수정불가)" value="${loginUser.getUserName()}" readonly >
                            </fieldset>
                          </div>
                          
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                               아이디<input name="userid" id="userid" placeholder="${loginUser.getUserId() } (수정불가)" value="${loginUser.getUserId()}" readonly>
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              비밀번호<input name="userPwd" type="password" id="userPwd">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              비밀번호 확인<input name="userPwd2" type="password" id="userPwd2">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              이메일<input name="userEmail" type=text id="userEmail" value="${loginUser.getUserEmail() }">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              전화번호<input name="userPhone" type=text id="userPhone"  value="${loginUser.getUserPhone() }">
                            </fieldset>
                          </div>
                          
                      <!--     
                         <fieldset>
    							<legend><h3>예약정보</h3></legend>
	                           <div class="col-md-12 col-sm-12">
	                            <fieldset>
	                              예약 숙소이름 <input name="phone" type=text id="phone" placeholder="서울신라호텔" readonly> 이 부분 수정 필요
	                              예약 날짜 <input name="phone" type=text id="phone" placeholder="2021-09-21" readonly> 호텔 예약 객체 정보 가져와야 함 by userId
	                           	  예약 인원 <input name="phone" type=text id="phone" placeholder="2명" readonly> 이 부분 수정 필요
	                            </fieldset>
	                          </div> -->
	                          
	                          <div class="col-md-12 col-sm-12">
	                      		<fieldset style="margin-left:40%">
	                           	  <button type="button" id="form-submit" class="main-button" onclick="history.back(-1)">취소</button>
	                              <button type="submit" id="form-submit" class="main-button">수정</button>
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