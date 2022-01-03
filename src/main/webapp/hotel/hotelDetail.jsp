<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.project.dto.HotelVO"%>
<%@page import="java.util.List"%>

  <script type="text/javascript" src="hotel.js"></script>
  
    <div class="main-banner header-text">
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
        
        <c:forEach var="image" items="${imageList}">
          <div class="item">
            <img src="upload/${image.hotel_image}">
           <div class="item-content">
              <div class="main-content">
                <ul class="post-info">
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                </ul>
              </div>
            </div>
          </div>
         </c:forEach>
        </div>
      </div>
    </div>
    
    
    
    

    <section class="blog-posts grid-system" style="margin-top:100px;">
      <div class="container">
       <div class="row">
          <div class="col-lg-12">
            <div class="all-blog-posts">
              <div class="row">
                <div class="col-lg-8" style="margin: 0 auto;">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="upload/${imageDetail.hotel_image}"> <!-- 호텔 디테일 대표사진 수정 -->
                    </div>
                    <div class="down-content">
                      <span>${detail.hotelLocation}</span>
                      <a href="post-details.html"><h4>${detail.hotelName}</h4></a>
                      <ul class="post-info">
                        <li><a href="#">${detail.hotelRank} 성급</a></li>
                        <li><a href="#">룸 타입 : ${detail.hotelRoomType}</a></li>
                        <li><a href="#">전화번호 : ${detail.hotelPhone}</a></li>
                        <li><a href="#">가격 : ${detail.hotelPrice}</a></li>
                      </ul>
                      <p>${detail.hotelDescription}</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                            <c:if test="${loginUser.userGrade == 2}">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="ProjectServlet?command=hotelUpdateForm&hotelName=${detail.hotelName}&hotelSeq=${detail.hotelSeq}">내용</a>,</li>
                              <li><a href="ProjectServlet?command=hotelUpdateForm&hotelName=${detail.hotelName}&hotelSeq=${detail.hotelSeq}">추가 가능</a></li>
                            </c:if>
                            <c:if test="${loginUser.userGrade == 1}">
                            <li><i class="fa fa-tags"></i></li>
                              <li><a href="#" onclick="alert('관리자만 수정할 수 있습니다.'); return false;">내용</a>,</li>
                              <li><a href="#" onclick="alert('관리자만 수정할 수 있습니다.'); return false;">추가 가능</a></li>
                            </c:if>
                            </ul>
                          </div>
                        
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
             
               <div class="col-lg-12">
               
				
                  <div class="sidebar-item submit-comment" style="text-align: center;margin-top: 0px;">
                    <div class="sidebar-heading">
                      <h2></h2>
                    </div>
                    <div class="content">
                      <form id="comment" action="ProjectServlet?command=hotelReservation" method="post">
                      <input type="hidden" name="hotelSeq" value="${detail.hotelSeq}">
                     
                       <div class="col-lg-12"> 
                                                 
	 				<button type="button" id="button" name="button">해당 호텔로 이동</button>
				<p>&nbsp;</p>
				 
				<div id="map" style="margin:0 auto;width:650px;height:650px;" ></div>
				<div class="sidebar-heading">
                      <h2></h2>
                     </div>
                     
                     </div>
                     
                        <div class="row">
                        
                       
                 
                          <div class="col-lg-12">
                            <fieldset>
                            	 <button type="button" class="submit"
                              onclick="location.href='ProjectServlet?command=cartInsert&hotelName=${detail.hotelName}&hotelSeq=${detail.hotelSeq}&hotelPrice=${detail.hotelPrice}'"
                                  > 찜목록에 추가하기</button>
                                 <button type="button" class="submit"
                              onclick="location.href='ProjectServlet?command=roomSelection&hotelSeq=${detail.hotelSeq}'"
                                  > 호텔예약하기</button>
                              <c:if test="${loginUser.userGrade == 2}">
                         	  	<button type="button" id="form-submit" class="main-button" onclick="location.href='ProjectServlet?command=hotelUpdateForm&hotelName=${detail.hotelName}&hotelSeq=${detail.hotelSeq}'">호텔정보 수정하기</button>
                         	  </c:if>
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
	<body>
    
		<script>
		
		var positions = [
		    {
		        content: 'JW 메리어트 호텔 서울', 
		        latlng: new kakao.maps.LatLng(37.503898, 127.004759)
		    },
		    {
		        content: '나이아가라',
		        latlng: new kakao.maps.LatLng(37.579150, 126.878643)
		    },
		    {
		        content: '라이즈 오토그래프 컬렉션 바이 메리어트',
		        latlng: new kakao.maps.LatLng(37.554424, 126.921217)
		    },
		    {
		        content: '서머셋 팰리스 서울',
		        latlng: new kakao.maps.LatLng(37.575026, 126.981191)
		    },
		    {
		        content: '시타딘 한리버 서울', 
		        latlng: new kakao.maps.LatLng(37.540791, 126.890669)
		    },
		    {
		        content: '파크 하얏트 서울', 
		        latlng: new kakao.maps.LatLng(37.508541, 127.064141)
		    },
		    {
		        content: '서울 해밀톤 호텔', 
		        latlng: new kakao.maps.LatLng(37.534782, 126.993572)
		    },
		    {
		        content: '서울 루체브릿지', 
		        latlng: new kakao.maps.LatLng(37.559572, 126.836203)
		    },
		    {
		        content: '시그니엘 서울', 
		        latlng: new kakao.maps.LatLng(37.512697, 127.102471)
		    },
		    {
		        content: '서울 신라 호텔', 
		        latlng: new kakao.maps.LatLng(37.556472, 127.006161)
		    },
		    {
		        content: 'ACC 디자인 호텔', 
		        latlng: new kakao.maps.LatLng(35.148648, 126.916582)
		    },
		    {
		        content: '노블스테이 호텔', 
		        latlng: new kakao.maps.LatLng(35.216756, 126.849347)
		    },
		    {
		        content: '라마다 플라자 광주 호텔', 
		        latlng: new kakao.maps.LatLng(35.151984, 126.850510)
		    },
		    {
		        content: '마드리드 비지니스 호텔', 
		        latlng: new kakao.maps.LatLng(35.138773, 126.793531)
		    },
		    {
		        content: '스테이53 호텔', 
		        latlng: new kakao.maps.LatLng(37.47616, 126.866994)
		    },
		    {
		        content: '엠파이어 관광호텔', 
		        latlng: new kakao.maps.LatLng(35.216235, 126.846235)
		    },
		    {
		        content: '유탑 부티크 호텔&레지던스', 
		        latlng: new kakao.maps.LatLng(35.153123, 126.851200)
		    },
		    {
		        content: '탑클라우드호텔 광주', 
		        latlng: new kakao.maps.LatLng(35.220566, 126.847919)
		    },
		    {
		        content: '호텔 B', 
		        latlng: new kakao.maps.LatLng(35.153725, 126.852407)
		    },
		    {
		        content: '홀리데이 인 광주', 
		        latlng: new kakao.maps.LatLng(35.147711, 126.838103)
		    },
		    {
		        content: '부산 라발스 호텔', 
		        latlng: new kakao.maps.LatLng(35.094686, 129.039136)
		    },
		    {
		        content: '롯데호텔 부산', 
		        latlng: new kakao.maps.LatLng(35.156768, 129.055870)
		    },
		    {
		        content: '베스트웨스턴 해운대 호텔', 
		        latlng: new kakao.maps.LatLng(35.160451, 129.161139)
		    },
		    {
		        content: '에이치에비뉴 호텔 광안리', 
		        latlng: new kakao.maps.LatLng(35.153250, 129.124654)
		    },
		    {
		        content: '엠에스 호텔', 
		        latlng: new kakao.maps.LatLng(35.159746, 129.161084)
		    },
		    {
		        content: '일루아 호텔', 
		        latlng: new kakao.maps.LatLng(35.158940, 129.174537)
		    },
		    {
		        content: '토요코인 부산역 1호점', 
		        latlng: new kakao.maps.LatLng(35.114167, 129.040744)
		    },
		    {
		        content: '파라다이스 호텔 부산', 
		        latlng: new kakao.maps.LatLng(35.160133, 129.164687)
		    },
		    {
		        content: '하운드 호텔 광안', 
		        latlng: new kakao.maps.LatLng(35.148902, 129.114535)
		    },
		    {
		        content: '해운대 씨클라우드 호텔 레지던스', 
		        latlng: new kakao.maps.LatLng(35.160406, 129.162084)
		    },
		    {
		        content: '더 호텔 수', 
		        latlng: new kakao.maps.LatLng(34.732939, 127.747812)
		    },
		    {
		        content: '라마다 프자라 여수', 
		        latlng: new kakao.maps.LatLng(34.716687, 127.748185)
		    },
		    {
		        content: '베네치아 호텔 & 리조트', 
		        latlng: new kakao.maps.LatLng(34.745759, 127.751714)
		    },
		    {
		        content: '베니키아 호텔 여수', 
		        latlng: new kakao.maps.LatLng(34.756552, 127.659143)
		    },
		    {
		        content: '비앤비치호텔', 
		        latlng: new kakao.maps.LatLng(34.756717, 127.659559)
		    },
		    {
		        content: '샹보로 관광호텔', 
		        latlng: new kakao.maps.LatLng(34.744862, 127.742360)
		    },
		    {
		        content: '소노캄 여수', 
		        latlng: new kakao.maps.LatLng(34.742276, 127.754557)
		    },
		    {
		        content: '유탑 마리나 호텔 & 리조트', 
		        latlng: new kakao.maps.LatLng(34.744336, 127.750515)
		    },
		    {
		        content: '헤이븐 호텔', 
		        latlng: new kakao.maps.LatLng(34.731960, 127.749109)
		    },
		    {
		        content: '히든 베이 호텔', 
		        latlng: new kakao.maps.LatLng(34.721620, 127.699396)
		    },
		    {
		        content: '라마다 송도 호텔', 
		        latlng: new kakao.maps.LatLng(37.414166, 126.655366)
		    },
		    {
		        content: '송도 센트럴 파크 호텔', 
		        latlng: new kakao.maps.LatLng(37.390622, 126.637192)
		    },
		    {
		        content: '연화문 호텔', 
		        latlng: new kakao.maps.LatLng(37.446334, 126.376339)
		    },
		    {
		        content: '오라카이 송도 파크 호텔', 
		        latlng: new kakao.maps.LatLng(37.388015, 126.640730)
		    },
		    {
		        content: '오션 솔레뷰호텔', 
		        latlng: new kakao.maps.LatLng(37.494249, 126.579492)
		    },
		    {
		        content: '오크우드 프리미어 인천', 
		        latlng: new kakao.maps.LatLng(37.389211, 126.644230)
		    },
		    {
		        content: '월미도 관광호텔', 
		        latlng: new kakao.maps.LatLng(37.472375, 126.596865)
		    },
		    {
		        content: '파라다이스시티', 
		        latlng: new kakao.maps.LatLng(37.474264, 126.616952)
		    },
		    {
		        content: '호텔 스카이파크 인천', 
		        latlng: new kakao.maps.LatLng(37.384331, 126.638851)
		    },
		    {
		        content: '홀리데이 인 인천 송도', 
		        latlng: new kakao.maps.LatLng(37.393205, 126.632898)
		    },
		    {
		        content: '그랜드 하얏트 제주', 
		        latlng: new kakao.maps.LatLng(33.485372, 126.481572)
		    },
		    {
		        content: '라마다 제주 시티', 
		        latlng: new kakao.maps.LatLng(33.493466, 126.534312)
		    },
		    {
		        content: '롯테시티호텔 제주', 
		        latlng: new kakao.maps.LatLng(33.490583, 126.486752)
		    },
		    {
		        content: '제주 메종 글래드', 
		        latlng: new kakao.maps.LatLng(33.484758, 126.488706)
		    },
		    {
		        content: '베니키아 호텔 제주', 
		        latlng: new kakao.maps.LatLng(33.477731, 126.362100)
		    },
		    {
		        content: '애월 스테이 인 제주', 
		        latlng: new kakao.maps.LatLng(33.483213, 126.377231)
		    },
		    {
		        content: '유탑 유블레스 호텔', 
		        latlng: new kakao.maps.LatLng(33.542330, 126.666164)
		    },
		    {
		        content: '탐라스테이 호텔', 
		        latlng: new kakao.maps.LatLng(33.486788, 126.391803)
		    },
		    {
		        content: '호텔 난타 제주', 
		        latlng: new kakao.maps.LatLng(33.445720, 126.547782)
		    },
		    {
		        content: '호텔 리젠트 마린 더 블루', 
		        latlng: new kakao.maps.LatLng(33.517630, 126.526789)
		    }
		];
		
		var map;
		var marker;
		var name = '<c:out value="${detail.hotelName}"/>';
		
		//지도를 실제 생성하는 코드
		map = new kakao.maps.Map(document.getElementById('map'),{
			center: new kakao.maps.LatLng(37.555983, 126.972316),		//시작시 중심이되는 좌표
			level:8}); 							// zoom level 숫자가 클수록 보이는 범위가 넓어진다.
		
		
		marker = new kakao.maps.Marker({		//ping 생성 코드
	        map: map, 							
	        position: new kakao.maps.LatLng(37.555983, 126.972316) //ping 생성 위치
	    });

		var button = document.getElementById('button');
		 button.addEventListener('click', changeCenter); 
		
		function changeCenter(){
			
			positions.map(({content,latlng})=>{
					var con = content;
					var lat = latlng;
					console.log(con);
					console.log(lat);
					console.log(name);
					if(name==content){
						map = new kakao.maps.Map(document.getElementById('map'),{
							center: lat,
							level:4})
						new kakao.maps.Marker({
					        map: map, 
					        position: lat 
					      					      
					    });
						
						
						var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: lat
					    });
						
						var infowindow = new kakao.maps.InfoWindow({
					        position : lat,
					        content : content
					    });
						infowindow.open(map, marker);
						// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseout', makeOverListener(map, marker, infowindow)); 
					    kakao.maps.event.addListener(marker, 'mouseover', makeOutListener(infowindow)); 
					    kakao.maps.event.addListener(marker, 'click', goHotelDetail(map, marker)); 
					
					}
				})
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
    


<%@ include file = "../footer.jsp"%>