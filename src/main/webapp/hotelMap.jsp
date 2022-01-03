<%@page import="com.project.dto.HotelVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5a8ff431cf151fcefb9fb9463e265e5"></script>

<style>
	div {
		text-align:center;
	}
	a {
		text-decoration: none;
	}
	.title {
		text-align: center;
		align:center;
	}
	.map {
		display:flex;
		text-align:center;
		align:center;
	}
	.wrap {
		text-align:center;
	}
	#hotel
	
</style>
</head>
<body>
		<div id="map" style="width:650px;height:650px;" ></div>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
				center: new kakao.maps.LatLng(37.497939, 127.027548), // 지도의 중심좌표
		        level: 8 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		    {
		        content: '<div>JW 메리어트 호텔 서울</div>', 
		        latlng: new kakao.maps.LatLng(37.503898, 127.004759)
		    },
		    {
		        content: '<div>나이아가라</div>',
		        latlng: new kakao.maps.LatLng(37.579150, 126.878643)
		    },
		    {
		        content: '<div>라이즈 오토그래프 컬렉션 바이 메리어트</div>',
		        latlng: new kakao.maps.LatLng(37.554424, 126.921217)
		    },
		    {
		        content: '<div>서머셋 팰리스 서울</div>',
		        latlng: new kakao.maps.LatLng(37.575026, 126.981191)
		    },
		    {
		        content: '<div>시타딘 한리버 서울</div>', 
		        latlng: new kakao.maps.LatLng(37.540791, 126.890669)
		    },
		    {
		        content: '<div>파크 하얏트 서울</div>', 
		        latlng: new kakao.maps.LatLng(37.508541, 127.064141)
		    },
		    {
		        content: '<div>해밀톤 호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.534782, 126.993572)
		    },
		    {
		        content: '<div>호텔 루체브릿지</div>', 
		        latlng: new kakao.maps.LatLng(37.559572, 126.836203)
		    },
		    {
		        content: '<div>시그니엘 서울</div>', 
		        latlng: new kakao.maps.LatLng(37.512697, 127.102471)
		    },
		    {
		        content: '<div>서울 신라 호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.556472, 127.006161)
		    },
		    {
		        content: '<div>ACC 디자인 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.148648, 126.916582)
		    },
		    {
		        content: '<div>노블스테이 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.216756, 126.849347)
		    },
		    {
		        content: '<div>라마다 플라자 광주 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.151984, 126.850510)
		    },
		    {
		        content: '<div>마드리드 비지니스 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.138773, 126.793531)
		    },
		    {
		        content: '<div>스테이53 호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.47616, 126.866994)
		    },
		    {
		        content: '<div>엠파이어 관광호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.216235, 126.846235)
		    },
		    {
		        content: '<div>유탑 부티크 호텔&레지던스</div>', 
		        latlng: new kakao.maps.LatLng(35.153123, 126.851200)
		    },
		    {
		        content: '<div>탑클라우드호텔 광주</div>', 
		        latlng: new kakao.maps.LatLng(35.220566, 126.847919)
		    },
		    {
		        content: '<div>호텔 B</div>', 
		        latlng: new kakao.maps.LatLng(35.153725, 126.852407)
		    },
		    {
		        content: '<div>홀리데이 인 광주</div>', 
		        latlng: new kakao.maps.LatLng(35.147711, 126.838103)
		    },
		    {
		        content: '<div>부산 라발스 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.094686, 129.039136)
		    },
		    {
		        content: '<div>롯데호텔 부산</div>', 
		        latlng: new kakao.maps.LatLng(35.156768, 129.055870)
		    },
		    {
		        content: '<div>베스트웨스턴 해운대 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.160451, 129.161139)
		    },
		    {
		        content: '<div>에이치에비뉴 호텔 광안리</div>', 
		        latlng: new kakao.maps.LatLng(35.153250, 129.124654)
		    },
		    {
		        content: '<div>엠에스 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.159746, 129.161084)
		    },
		    {
		        content: '<div>일루아 호텔</div>', 
		        latlng: new kakao.maps.LatLng(35.158940, 129.174537)
		    },
		    {
		        content: '<div>토요코인 부산역 1호점</div>', 
		        latlng: new kakao.maps.LatLng(35.114167, 129.040744)
		    },
		    {
		        content: '<div>파라다이스 호텔 부산</div>', 
		        latlng: new kakao.maps.LatLng(35.160133, 129.164687)
		    },
		    {
		        content: '<div>하운드 호텔 광안</div>', 
		        latlng: new kakao.maps.LatLng(35.148902, 129.114535)
		    },
		    {
		        content: '<div>해운대 씨클라우드 호텔 레지던스</div>', 
		        latlng: new kakao.maps.LatLng(35.160406, 129.162084)
		    },
		    {
		        content: '<div>더 호텔 수</div>', 
		        latlng: new kakao.maps.LatLng(34.732939, 127.747812)
		    },
		    {
		        content: '<div>라마다 프자라 여수</div>', 
		        latlng: new kakao.maps.LatLng(34.716687, 127.748185)
		    },
		    {
		        content: '<div>베네치아 호텔 & 리조트</div>', 
		        latlng: new kakao.maps.LatLng(34.745759, 127.751714)
		    },
		    {
		        content: '<div>베니키아 호텔 여수</div>', 
		        latlng: new kakao.maps.LatLng(34.756552, 127.659143)
		    },
		    {
		        content: '<div>비앤비치호텔</div>', 
		        latlng: new kakao.maps.LatLng(34.756717, 127.659559)
		    },
		    {
		        content: '<div>샹보로 관광호텔</div>', 
		        latlng: new kakao.maps.LatLng(34.744862, 127.742360)
		    },
		    {
		        content: '<div>소노캄 여수</div>', 
		        latlng: new kakao.maps.LatLng(34.742276, 127.754557)
		    },
		    {
		        content: '<div>유탑 마리나 호텔 & 리조트</div>', 
		        latlng: new kakao.maps.LatLng(34.744336, 127.750515)
		    },
		    {
		        content: '<div>헤이븐 호텔</div>', 
		        latlng: new kakao.maps.LatLng(34.731960, 127.749109)
		    },
		    {
		        content: '<div>히든 베이 호텔</div>', 
		        latlng: new kakao.maps.LatLng(34.721620, 127.699396)
		    },
		    {
		        content: '<div>라마다 송도 호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.414166, 126.655366)
		    },
		    {
		        content: '<div>송도 센트럴 파크 호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.390622, 126.637192)
		    },
		    {
		        content: '<div>연화문 호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.446334, 126.376339)
		    },
		    {
		        content: '<div>오라카이 송도 파크 호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.388015, 126.640730)
		    },
		    {
		        content: '<div>오션 솔레뷰호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.494249, 126.579492)
		    },
		    {
		        content: '<div>오크우드 프리미어 인천</div>', 
		        latlng: new kakao.maps.LatLng(37.389211, 126.644230)
		    },
		    {
		        content: '<div>월미도 관광호텔</div>', 
		        latlng: new kakao.maps.LatLng(37.472375, 126.596865)
		    },
		    {
		        content: '<div>파라다이스시티</div>', 
		        latlng: new kakao.maps.LatLng(37.474264, 126.616952)
		    },
		    {
		        content: '<div>호텔 스카이파크 인천</div>', 
		        latlng: new kakao.maps.LatLng(37.384331, 126.638851)
		    },
		    {
		        content: '<div>홀리데이 인 인천 송도</div>', 
		        latlng: new kakao.maps.LatLng(37.393205, 126.632898)
		    },
		    {
		        content: '<div>그랜드 하얏트 제주</div>', 
		        latlng: new kakao.maps.LatLng(33.485372, 126.481572)
		    },
		    {
		        content: '<div>라마다 제주 시티</div>', 
		        latlng: new kakao.maps.LatLng(33.493466, 126.534312)
		    },
		    {
		        content: '<div>롯테시티호텔 제주</div>', 
		        latlng: new kakao.maps.LatLng(33.490583, 126.486752)
		    },
		    {
		        content: '<div>메종 글래드 제주</div>', 
		        latlng: new kakao.maps.LatLng(33.484758, 126.488706)
		    },
		    {
		        content: '<div>베니키아 호텔 제주</div>', 
		        latlng: new kakao.maps.LatLng(33.477731, 126.362100)
		    },
		    {
		        content: '<div>애월 스테이 인 제주</div>', 
		        latlng: new kakao.maps.LatLng(33.483213, 126.377231)
		    },
		    {
		        content: '<div>유탑 유블레스 호텔</div>', 
		        latlng: new kakao.maps.LatLng(33.542330, 126.666164)
		    },
		    {
		        content: '<div>탐라스테이 호텔</div>', 
		        latlng: new kakao.maps.LatLng(33.486788, 126.391803)
		    },
		    {
		        content: '<div>호텔 난타 제주</div>', 
		        latlng: new kakao.maps.LatLng(33.445720, 126.547782)
		    },
		    {
		        content: '<div>호텔 리젠트 마린 더 블루</div>', 
		        latlng: new kakao.maps.LatLng(33.517630, 126.526789)
		    }
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    /* var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    }); */
		
		    var infowindow = new kakao.maps.InfoWindow({
		        position : positions[i].latlng, 
		        content : positions[i].content 
		    });
		    
		    infowindow.open(map, marker);

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseout', makeOverListener(map, marker, infowindow)); 
		    kakao.maps.event.addListener(marker, 'mouseover', makeOutListener(infowindow)); 
		    kakao.maps.event.addListener(marker, 'click', goHotelDetail(map, marker)); 
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker, infowindow);
		    };
		} 
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		function goHotelDetail(marker) {
		    return function() {
		        location.href="ProjectServlet?command=hotelDetail&seq=3";
		    };
		}
		</script>
		<form name="searchLocation" action="hotelMap.jsp" method="get">
			<table>
				<tr>
					<td>
						<input type="text" name="search" placeholder="지역을 검색하세요.">
					</td>
					<td>
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>