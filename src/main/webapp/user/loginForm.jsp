<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<script type="text/javascript">
	
function findId() {
	  
	var url = "ProjectServlet?command=findIdForm";
		 window.open(url, "_blank_1",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=500");
}

function findPwd() {
	  
	var url = "ProjectServlet?command=findPwdForm";
		 window.open(url, "_blank_1",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=500");
}

</script>

<section class="contact-us">
	<div class="container">
		<div class="row">

			<div class="col-lg-12">
				<div class="down-contact">
					<div class="row">
						<div class="col-lg-8" style="margin: 5% auto">
							<div class="sidebar-item contact-form">

								<h4 style="padding: 13px; text-align: center; font-weight: 600;">로그인</h4>

								<div class="content">

									<form id="loginForm" name="loginForm"
										action="ProjectServlet?command=login" method="post"
										onsubmit="return loginCheckForm();">
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<fieldset>
													<input name="userId" type="text" id="userId"
														placeholder="아이디 입력">
												</fieldset>
											</div>

											<div class="col-md-12 col-sm-12">
												<fieldset>
													<input name="userPwd" type="password" id="userPwd"
														placeholder="비밀번호 입력">
												</fieldset>
											</div>

											<div class="col-md-12 col-sm-12">
												<fieldset>
													<input type="checkbox" id="cb1" name="cb1" style="width: 14px; height: 14px;"> 
													<label for="cb1">아이디 저장</label> 
													<div class="right" style="float:right">
														<input type="hidden" id="findId" name="findId" style="width: 14px; height: 14px;">
														<label for="findId" style="padding-right: 8px;"> 
														<a href="#" onclick="findId()">아이디 찾기</a></label> 
														<input type="hidden" style="width: 14px; height: 14px;">
														<label>|</label>
														<input type="hidden" id="findPwd" name="findPwd" style="width: 14px; height: 14px;"> 
														<label for="findPwd" style="padding-left: 8px;">
														<a href="#" onclick="findPwd()" style="text-align: right">비밀번호 찾기</a></label>
													</div>
												</fieldset>
											</div>

											<div class="col-lg-12">
												<fieldset>
													<button type="submit" id="form-submit" class="main-button" style="width: 100%">로그인</button>
												</fieldset>
											</div>
										</div>
										<hr>
										<h4 style="padding: 13px; text-align: center; font-weight: 600;">간편 로그인</h4>
										<div class="right" style="text-align: center;">
											<a href="javascript:kakaoLogin();"><img src="user/kakao.png" alt="kakao"></a><br>
											<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
											<div id="response"></div>
	
											<script>
					                      		window.Kakao.init("e1e25dd75184da8323e8117e2cf6487f");
					                      		 function kakaoLogin(){
					                      			
					                      			Kakao.Auth.login({	//로그인 사용자 정보 동의 화면
					                          			scope:'account_email,profile_nickname',
					                      				success:function(response){//인증 성공 시 서비스의 로그인 처리를 success 콜백함수 사용
					                      					window.Kakao.API.request({	//로그인 성공 시 api호출
					                      						url:'/v2/user/me',		//계정 정보 가져오는 request url
					                      						success:function(response){
						                      						console.log(response)
						                      						$('#response').append(response);
						                      				        id = response.id
						                      				        connected_at = response.connected_at
						                      				        kakao_account = response.kakao_account
					                      				        	properties = response.properties                      				        	
						                      				        $('#response').append(kakao_account);	                      				        
						                      				        email ="";
						                      				        gender = "";
						                      				        name="";
						                      				        if(typeof kakao_account != 'undefined'){
						                      				        	email = kakao_account.email;
						                      				        	gender = kakao_account.gender;
						                      				        	name=properties.nickname;
						                      				        }	                      				      
						                      				$("#email").val(email);
						                      				$("#id").val(id);	                      				
						                      				$("#name").val(name);
						                      				$("#form2").submit();
																},
					                      						fail:function(error){
					                      							console.log(error)
					                      						},
					                      					})
					                      				},
					                      				fail:function(error){
					                      					console.log(error)
					                      				},
					                      				}
					                      			)}
	                      					</script>
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

<form id="form2" name="form2" action="ProjectServlet?command=login"
	method="post">
	<input type="hidden" name="email" id="email" /> <input type="hidden"
		name="name" id="name" /> <input type="hidden" name="id" id="id" />
</form>

<%@ include file="../footer.jsp"%>