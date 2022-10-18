<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <%@ include file="head.jsp" %>
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="./resources/assets/css/board.css" rel="stylesheet" />
		<script type="text/javascript">
			$(function(){
				<c:if test="${param.error ne null}">
					alert("제목과 본문은 반드시 있어야 합니다");
				</c:if>
				$('#summernote').summernote({height: 500});});
		</script>
<style type="text/css">
body {
  min-height: 100vh;
  background-color: #F4AE34;
}
.blind {
	position: absolute;
	overflow: hidden;
	margin: -1px;
	padding: 0;
	width: 1px;
	height: 1px;
	border: none;
	clip: rect(0, 0, 0, 0);
}

.input-form {
  max-width: 1200px;
  padding: 32px;
  padding-top: 15px;
  background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
</style>
    </head>
    <body id="page-top">
                <!-- Page content-->
                <div class="container">
				<!-- SideBar -->
				<%@ include file="sideBar.jsp"%>
                    <!-- 본문내용은 여기에 -->
                    <div class="input-form col-md-12 mx-auto">
                    	<form action="./write2.do" method="post" enctype="multipart/form-data">
							<input type="text" name="title" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
							<div class="form-group">
								<textarea class="form-control" rows="20" id="summernote" name="content" required></textarea>
							</div>
							<input type="hidden" name="cate" value="${param.cate }">
							<input type="file" name="file" accept=".png, .jpg, .gif, .jpeg, .bmp">
							<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
						</form>
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