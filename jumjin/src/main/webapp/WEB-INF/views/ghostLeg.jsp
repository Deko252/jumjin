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
<link rel="import"
	href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html">
<link rel="stylesheet" type="text/css" href="./resources/css/style.css">
<link rel="stylesheet" type="text/css" href="./resources/css/meterial.css">
<title>ladder</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/admin_styles.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
 <div class="landing" id="landing">
       <div class="start-form">
            <div class="landing-form">
                <div class="group">      
                  <input type="text" name="member" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label>참여자 수</label>
                    <div  id="button" class="button raised green">
                      <div  class="center" fit>START</div>
                      <paper-ripple fit></paper-ripple>
                    </div>
                </div>
            </div>
       </div>
    </div>
    <div id="ladder" class="ladder">
        <div class="dim"></div>
         <canvas class="ladder_canvas" id="ladder_canvas"></canvas>
    </div>


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
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/admin_scripts.js"></script>
	<script src="./resources/js/ladder.js"></script>
	<script src="./resources/js/temp.js"></script>
</body>
</html>