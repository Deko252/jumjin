<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <%@ include file="head.jsp" %>
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="./resources/assets/css/board.css" rel="stylesheet" />

<style type="text/css">
#sidebar-wrapper{
	position: fixed;
	top:0;


		
}
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
  margin-top:120px;
  z-index:-99;
  background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
a.btn-secondary{
	margin:16px ;
	margin-top:0px; 
	font-weight: 400;
	background-color: #fd7e14;
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
                    	<form action="./write.do" method="post" enctype="multipart/form-data">
							<input type="text" name="title" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
							<div class="form-group">
								<textarea class="form-control" rows="20" id="summernote" name="content" required></textarea>
							</div>
							<input type="file" name="file" accept=".png, .jpg, .gif, .jpeg, .bmp">
							<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
							 <a href="board.do" role="button" class="btn btn-secondary">취소</a>
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