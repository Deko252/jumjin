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
</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 500px;; height: 500px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afab85b277584170c156a224f1486e30"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.484085, 126.782803), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
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