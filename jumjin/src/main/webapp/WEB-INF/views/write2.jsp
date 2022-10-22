<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"> 
    <head>
        <%@ include file="head.jsp" %>
        <!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/assets/css/board.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
<script type="text/javascript">
$(function(){$('#summernote').summernote({height: 500});});
</script> 

<style type="text/css">
#sidebar-wrapper{
	position: fixed;
	top:0;
}
body {
	min-height: 100vh;
	background-color: #F4AE34;
	overflow: hidden;
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
.container {
}
.input-form {
	margin-top: 50px;
	width: 1200px;
	padding: 15px 32px 5px;
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
	border: 1px solid #fd7e14;
}
#writeBtn {
	position: relative;
	left: 85%;
	margin-top: 10px;
}
#findFile {
	margin-top: 10px;
}
.mt-4{
	margin-top: 1rem !important;
}

/* .note-style,
.note-fontname,
.note-para .btn-group,
.note-table,
.note-view .btn-fullscreen{
	display: none;
} */

</style>
    </head>
      
    <body id="page-top">
                <!-- Page content-->
                <div class="container">
				<!-- SideBar -->
      <%@ include file="sideBar.jsp" %>
				 
                    <!-- 본문내용은 여기에 -->
                    <div class="input-form col-md-12 mx-auto">
                    	<form action="./write2.do" method="post" enctype="multipart/form-data">
							<input type="text" name="title" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
							<div class="form-group">
								<textarea class="form-control" placeholder="내용을 입력해주세요." rows="20" id="summernote" name="content" required></textarea>
							</div>
							<input id="findFile" type="file" name="file" accept=".png, .jpg, .gif, .jpeg, .bmp">
							<div id="writeBtn">
							<button type="submit" class="btn btn-secondary mb-3">글쓰기</button>
							<a href="board2.do" role="button" class="btn btn-secondary">취소</a>
							</div>
						</form>
                    </div>
                </div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afab85b277584170c156a224f1486e30&libraries=services"></script>
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