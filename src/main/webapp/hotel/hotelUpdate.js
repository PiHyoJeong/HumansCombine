function hotelDelete() {
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		document.formm.action = "ProjectServlet?command=delete";
	    document.formm.submit();
	}else{   //취소
	    return;
	}
}

function hotelUpdate() {

	if(document.formm.hotelPrice.value == "") {
	 	alert("가격을 입력하세요.");
		document.formm.hotelPrice.focus();
		return false;
		
	}else if(document.formm.hotelLocation.value == "") {
		alert("장소를 입력하세요.");
		document.formm.hotelLocation.focus();
		return false;
		
	}else if(document.formm.hotelRoomType.value == "") {
		alert("객실 타입을 입력하세요.");
		document.formm.hotelRoomType.focus();
		return false;
		
	}else if(document.formm.hotelRoomNum.value == "") {
		alert("객실 수를 입력하세요.");
		document.formm.hotelRoomNum.focus();
		return false;
		
	}else if(document.formm.hotelPhone.value == "") {
		alert("전화번호를 입력하세요.");
		document.formm.hotelPhone.focus();
		return false;
		
	}else if(document.formm.hotelDescription.value == "") {
		alert("호텔에 대한 설명을 입력해주세요.");
		document.formm.hotelDescription.focus();
		return false;
	}else if(document.formm.hotelDe1.value == "") {
		alert("고객에세 보여지는 내용입니다. 호텔 키워드를 입력하세요.");
		document.formm.hotelDe1.focus();
		return false;
		
	}else if(document.formm.hotelDe2.value == "") {
		alert("고객에세 보여지는 내용입니다. 호텔 키워드를 입력하세요.");
		document.formm.hotelDe2.focus();
		return false;
		
	}else if(document.formm.hotelDe3.value == "") {
		alert("고객에세 보여지는 내용입니다. 호텔 키워드를 입력하세요.");
		document.formm.hotelDe3.focus();
		return false;
		
	}else if(document.formm.hotelImage1.value.indexOf("room") == -1) {
		alert("방 사진을 넣어주세요.");
		return false;
		
	}else if(document.formm.hotelImage2.value.indexOf("restaurant") == -1) {
		alert("식당 사진을 넣어주세요.");
		return false;
		
	}else if(document.formm.hotelImage3.value.indexOf("building") == -1) {
		alert("건물 사진을 넣어주세요.");
		return false;
		
	}else if(document.formm.hotelImage4.value.indexOf("detail") == -1) {
		alert("호텔 내부 사진을 넣어주세요.");
		return false;
	}
	return;
}

