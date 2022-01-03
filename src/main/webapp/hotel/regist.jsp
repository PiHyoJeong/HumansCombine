<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">

	function setThumbnail1(event){
		let reader = new FileReader(); 
		reader.onload = function(event){
			let img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container1").appendChild(img);

			
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	
	function setThumbnail2(event){
		let reader = new FileReader(); 
		reader.onload = function(event){
			let img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container2").appendChild(img);

			
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	function setThumbnail3(event){
		let reader = new FileReader(); 
		reader.onload = function(event){
			let img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container3").appendChild(img);

			
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	function setThumbnail4(event){
		let reader = new FileReader(); 
		reader.onload = function(event){
			let img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container4").appendChild(img);

			
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	

</script>
<style>
.input-file-button {
	padding: 6px 25px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}

#input-file {
	display: none;
}
</style>

<section class="contact-us">
	<div class="container">
		<div class="row">

			<div class="col-lg-12">
				<div class="down-contact">
					<div class="row">
						<div class="col-lg-8" style="margin: 5% auto">
							<div class="sidebar-item contact-form">

								<h4 style="padding: 13px; text-align: center; font-weight: 600;">호텔등록</h4>


								<div class="content">
									<form id="regist" name="regist" action="ProjectServlet?command=hotelRegister" enctype="multipart/form-data" method="post" onsubmit="return hotelregistCheckForm();">
										<div class="row">

											<div class="col-md-12 col-sm-12">
												<fieldset>
													호텔명<input name="hotelName" type="text" id="hotelName">
												</fieldset>
											</div>

											<div class="col-md-12 col-sm-12">
												<fieldset>
													가격<input name="hotelPrice" type="text" id="hotelPrice">
												</fieldset>
											</div>
											<div class="col-md-12 col-sm-12">
												<fieldset>
													위치<input name="hotelLocation" type="text" id="hotelLocation">
												</fieldset>
											</div>


											<div class="col-md-12 col-sm-12">
												<fieldset>
													객실타입<input name="hotelRoomType" type="text" id="hotelRoomType">
												</fieldset>
											</div>

											<div class="col-md-12 col-sm-12">
												<fieldset>
													방 번호<input name="hotelRoomNum" type="text" id="hotelRoomNum">
												</fieldset>
											</div>

											<div class="col-md-12 col-sm-12">
												<fieldset>
													호텔 전화번호<input name="hotelPhone" type="text" id="hotelPhone">
												</fieldset>
											</div>
											
											<div class="col-md-12 col-sm-12">
												<fieldset>
													호텔 간단한 설명
													<input name="hotelDe1" type="text" id="hotelDe1">
												</fieldset>
											</div>
											<div class="col-md-12 col-sm-12">
												<fieldset>
													<input name="hotelDe2" type="text" id="hotelDe2">
												</fieldset>
											</div>
											<div class="col-md-12 col-sm-12">
												<fieldset>
													<input name="hotelDe3" type="text" id="hotelDe3">
												</fieldset>
											</div>

											<div class="col-md-12 col-sm-12">
												<fieldset>
													<span style="margin-right: 5%">호텔 성급</span> <label
														style="padding: 2%;"><input type="radio"
														name="hotelRank" value="1" checked="checked"
														style="width: 14px; height: 14px;">★</label> <label
														style="padding: 2%;"><input type="radio"
														name="hotelRank" value="2" style="width: 14px; height: 14px;">★★</label>
													<label style="padding: 2%;"><input type="radio"
														name="hotelRank" value="3" style="width: 14px; height: 14px;">★★★</label>
													<label style="padding: 2%;"><input type="radio"
														name="hotelRank" value="2" style="width: 14px; height: 14px;">★★★★</label>
													<label style="padding: 2%;"><input type="radio"
														name="hotelRank" value="2" style="width: 14px; height: 14px;">★★★★★</label>
												</fieldset>
											</div>

											<div class="col-md-12 col-sm-12">
												<fieldset>
													호텔설명<input name="hotelDescription" type="text" id="hotelDescription">
												</fieldset>
											</div>
											
											<div class="col-lg-12" id="content">
											
												<fieldset>
													사진첨부<br><br>
													
														HOTEL ROOM <br><label class="input-file-button" for="input-file1">업로드 </label> 
														<input type="file" id="input-file1" name="hotelImage1" accept="image/*" style="display:none" onchange="setThumbnail1(event);" /><button id="clear1" type="button">삭제</button>
														<div id="image_container1"></div> 
														<script src="http://code.jquery.com/jquery-latest.js"></script>
														<script>
															$("#clear1").click(function(){
																$("#input-file1").val("");
																$("#image_container1").text("");
																
															});
															
														</script>
														<br>
														<br>
												
														HOTEL RESTAURANT <br><label class="input-file-button" for="input-file2">업로드 </label> 
														<input type="file" id="input-file2" name="hotelImage2" accept="image/*" style="display:none" onchange="setThumbnail2(event);" /><button id="clear2" type="button">삭제</button>
														<div id="image_container2"></div> 
														<script src="http://code.jquery.com/jquery-latest.js"></script>
														<script>
															$("#clear2").click(function(){
																$("#input-file2").val("");
																$("#image_container2").text("");
																
															});
															
														</script>
														<br>
														<br>
														HOTEL BUILDING <br><label class="input-file-button" for="input-file3">업로드 </label> 
														<input type="file" id="input-file3" name="hotelImage3" accept="image/*" style="display:none" onchange="setThumbnail3(event);" /><button id="clear3" type="button">삭제</button>
														<div id="image_container3"></div> 
														<script src="http://code.jquery.com/jquery-latest.js"></script>
														<script>
															$("#clear3").click(function(){
																$("#input-file3").val("");
																$("#image_container3").text("");
																
															});
															
														</script>
														<br>
														<br>
														HOTEL DETAIL <br><label class="input-file-button" for="input-file4">업로드 </label> 
														<input type="file" id="input-file4" name="hotelImage4" accept="image/*" style="display:none" onchange="setThumbnail4(event);" /><button id="clear4" type="button">삭제</button>
														<div id="image_container4"></div> 
														<script src="http://code.jquery.com/jquery-latest.js"></script>
														<script>
															$("#clear4").click(function(){
																$("#input-file4").val("");
																$("#image_container4").text("");
																
															});
															
														</script>
														<br>
														<br>
													</fieldset>		
													
													
													
													
												</div>
												
												<br><br><br><br><br>
												<div class="col-md-12 col-lg-12">
													<fieldset style="margin-left: 40%">
														<button type="reset" class="main-button">취소</button>

														<button type="submit" id="form-submit" class="main-button">등록</button>
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


<%@ include file="../footer.jsp"%>