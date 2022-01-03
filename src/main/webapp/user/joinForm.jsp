<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>

	<script type="text/javascript">

function idcheck() {
	  
	var url = "ProjectServlet?command=id_check_form&userId=" 
		+ document.formm.userId.value;
		  window.open( url, "_blank_1",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=350");
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
            
                    <h4 style="padding:13px; text-align:center;font-weight: 600;">회원가입</h4>
                  
                    <div class="content"><!-- join.js -->
                      <form action="ProjectServlet?command=join" method="post" name="formm" onsubmit="return joinCheckForm();">
                        <div class="row">
                        
                         <div class="col-md-12 col-sm-12">
                            <fieldset>
                              이름<input id="userName" name="userName"  type="text" value="${name }">
                            </fieldset>
                          </div>
                          
                         <div class="col-md-6 col-sm-12">
                            <fieldset>
                             아이디<input name="userId" type="text" value="${id}">
                            </fieldset>
                          </div>
                          <div class="col-md-6 col-sm-12">
                             <fieldset>
                             &nbsp;
                             
                             <!--  <button name="idcheck" id="idcheck" style="margin-top: 8%;">중복체크</button> -->
                           
                        <fieldset>
                         &nbsp;<button type="button" class="dup" onclick="idcheck()" name="reid">중복체크</button>
                        </fieldset>
                        <br>
                            
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              비밀번호<input name="userPwd" type="password" id="userPwd" onchange="check_pw()">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              비밀번호 확인<input name="userPwd2" type="password" id="userPwd2" onchange="check_pw()">&nbsp;<span id="check"></span>
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              이메일<input name="userEmail" type=text id="userEmail" value="${email }">
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              전화번호<input name="userPhone" type=text id="userPhone">
                            </fieldset>
                          </div>
                          
                         
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              <span style="margin-right: 5%">회원등급</span>
                            <input type="radio" name="userGrade" value="1" checked="checked" style="width:14px;height:14px;">일반회원&nbsp;&nbsp;
							<input type="radio" name="userGrade" value="2" style="width:14px;height:14px;">관리자
                            </fieldset>
                          </div>
                          
                          <div class="col-md-12 col-lg-12">
                      		<fieldset style="margin-left:40%">
                              <button type="reset" class="main-button">취소</button>
                           
                              <button type="submit" id="form-submit" class="main-button">확인</button>
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