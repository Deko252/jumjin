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