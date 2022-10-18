<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>
<script type="text/javascript">

</script>
<link href="./resources/assets/css/board.css" rel="stylesheet" />
<style type="text/css">
body {
  min-height: 100vh;
  background-color: #F4AE34;
}
h2{
	text-align: center;
	margin-top: 50px;
}

</style>
</head>
<body id="page-top">
	<div class="container">
	<!-- SideBar -->
	<%@ include file="sideBar.jsp"%>
	<div class="d-flex" id="wrapper">
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Page content-->
			<div class="container-fluid">
				<!-- 본문내용은 여기에 -->
				<div style="margin: 0 auto; margin:10px; width: 90%;">
					<div style="font-size:large; border-bottom: 1px solid gray;">${detail.board_title }</div>
					<div style="background-color: #c0c0c0; border-bottom: 1px solid gray;">${detail.b_name } ${detail.board_date }</div>
					<div>
						${detail.board_content }
					</div>
				</div>					
			</div>
		</div>
	</div>
</div>
	<!-- Footer -->
	<%@ include file="footer.jsp"%>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"><i
		class="fas fa-angle-up"></i></a>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="./resources/assets/js/scripts.js"></script>
</body>
</html>