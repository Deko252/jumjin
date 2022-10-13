<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ladder</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/ghostLeg_styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">
$(function(){
	$("#legBtn").click(function(){
		var count = prompt("인원을 입력하세요.");
		var arr = [];

		for(var num = 1; num <= count; num++){
			arr.push(prompt(num + "번째 이름을 입력하세요"));
		}
		//alert(arr[0]);
	
		var random1 = parseInt(Math.random()*count);
		//alert(random1);
		//alert(arr[random1]);
		$("#resultMsg").text("오늘의 희생양은 " + arr[random1]);
		//$(arr[random1]);
	});
});
</script>
<div id="resultMsg">누가 밥을 살건가</div>

<button id="legBtn">입력하기</button>

	<!-- Navigation-->
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