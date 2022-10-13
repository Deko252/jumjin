<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="head.jsp"%>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/assets/css/board.css" rel="stylesheet" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>

<style>
body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #F4AE34;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>

<body id="page-top">
	<!-- SideBar -->
	<%@ include file="sideBar.jsp"%>

	<!-- Header-->
	<!-- <header class="masthead d-flex align-items-center">
		<div class="container px-4 px-lg-5 text-center"></div>
	</header> -->

	<!-- content -->
	<main class="form-signin">
		<form>
			<h1 class="h3 mb-3 fw-normal">점.진.사</h1>

			<div class="form-floating">
				<input type="email" class="form-control" id="floatingInput"
					placeholder="name@example.com"> <label for="floatingInput">아이디를
					입력하세요</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password"> <label for="floatingPassword">비밀번호를
					입력하세요</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					아이디 기억하기
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<button class="w-100 btn btn-lg btn-primary" type="submit">회원가입</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
		</form>
	</main>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"><i
		class="fas fa-angle-up"></i></a>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="./resources/assets/js/scripts.js"></script>
</body>
</html>
