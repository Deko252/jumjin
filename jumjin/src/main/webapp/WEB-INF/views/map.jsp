<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>kakao map</title>
<link href="./resources/css/map_styles.css" rel="stylesheet" />
<style>
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:35px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:0px; margin-top: 12px; border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
</style>
</head>
<body>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    <!-- 지도타입 컨트롤 div 입니다 -->
    <div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn"  onclick="setMapType('roadmap')" style="font-size: 5pt";>지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')" style="font-size: 5pt; width: 65px;">스카이</span>
    </div>
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="./resources/img/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
</div>

	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: ($(window).width() - 15); height: 600px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afab85b277584170c156a224f1486e30"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.484085, 126.782803), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		}

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
		function setMapType(maptype) { 
		    var roadmapControl = document.getElementById('btnRoadmap');
		    var skyviewControl = document.getElementById('btnSkyview'); 
		    if (maptype === 'roadmap') {
		        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
		        roadmapControl.className = 'selected_btn';
		        skyviewControl.className = 'btn';
		    } else {
		        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
		        skyviewControl.className = 'selected_btn';
		        roadmapControl.className = 'btn';
		    }
		}

		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomIn() {
		    map.setLevel(map.getLevel() - 1);
		}

		// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomOut() {
		    map.setLevel(map.getLevel() + 1);
		}
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.4876131, 126.7791434);
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;">향만성<br><a href="https://map.kakao.com/link/map/향만성,37.4876131, 126.7791434" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/향만성,37.4876131, 126.7791434" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    	iwPosition = new kakao.maps.LatLng(37.4876131, 126.7791434), //인포윈도우 표시 위치입니다
	    	iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	    	
		 // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        position : iwPosition, 
	        content : iwContent,
	        removable : iwRemoveable
	    });
	 // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	          // 마커 위에 인포윈도우를 표시합니다
	          infowindow.open(map, marker);  
	    });
	    
	 // 마커에 마우스오버 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseover', function() {
	      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	        infowindow.open(map, marker);
	    });

	 	

	</script>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-bottom">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="./index.do">점.진.사</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="./roulette.do">룰렛
							돌리기</a></li>
					<li class="nav-item"><a class="nav-link" href="./ghostLeg.do">사다리
							타기</a></li>
					<li class="nav-item"><a class="nav-link" href="./map.do">지도</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="./board.do">리뷰게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>