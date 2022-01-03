function hotelregistCheckForm() {
   
   if (document.regist.hotelName.value == "") {
      alert('호텔명을 입력하여 주십시오.');
      document.regist.hotelName.focus();
      return false;
      
   }else if(document.regist.hotelPrice.value == "") {
      alert('가격을 입력하여 주십시오.');
      document.regist.hotelPrice.focus();
      return false;
      
   }else if(document.regist.hotelLocation.value == "") {
      alert('호텔 위치를 입력하여 주십시오.');
      document.regist.hotelLocation.focus();
      return false;
      
   }else if(document.regist.hotelRoomType.value == "") {
      alert('객실타입을 입력하여 주십시오.');
      document.regist.hotelRoomType.focus();
      return false;
      
   }else if(document.regist.hotelRoomNum.value == "") {
      alert('방 번호를 입력하여 주십시오.');
      document.regist.hotelRoomNum.focus();
      return false;
      
   }else if(document.regist.hotelPhone.value == "") {
      alert('호텔 전화번호를 입력하여 주십시오.');
      document.regist.hotelPhone.focus();
      return false;
      
   }else if(document.regist.hotelDe1.value == "") {
  	  alert("고객에세 보여지는 내용입니다. 호텔 키워드를 입력하세요.");
	  document.formm.hotelDe1.focus();
	  return false;
		
	}else if(document.regist.hotelDe2.value == "") {
		alert("고객에세 보여지는 내용입니다. 호텔 키워드를 입력하세요.");
		document.formm.hotelDe2.focus();
		return false;
		
	}else if(document.regist.hotelDe3.value == "") {
		alert("고객에세 보여지는 내용입니다. 호텔 키워드를 입력하세요.");
		document.formm.hotelDe3.focus();
		return false;
		
	}else if(document.regist.hotelDescription.value == "") {
		alert("호텔에 대한 설명을 입력해주세요.");
		document.formm.hotelDescription.focus();
		return false;
		
	}else if(document.regist.hotelImage1.value.indexOf("room") == -1) {
		alert("방 사진을 넣어주세요.");
		return false;
		
	}else if(document.regist.hotelImage2.value.indexOf("restaurant") == -1) {
		alert("식당 사진을 넣어주세요.");
		return false;
		
	}else if(document.regist.hotelImage3.value.indexOf("building") == -1) {
		alert("건물 사진을 넣어주세요.");
		return false;
		
	}else if(document.regist.hotelImage4.value.indexOf("detail") == -1) {
		alert("호텔 내부 사진을 넣어주세요.");
		return false;
	}
	return;
   
}