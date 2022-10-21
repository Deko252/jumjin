<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/assets/css/board.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
h2{
	text-align: center;
}
body {
  min-height: 100vh;
  background-color: #F4AE34;
}

.input-form {
  max-width: 680px;

  margin-top: 20%;
  padding: 32px;

  background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.input-form > h2 {
	font-family: 'Jua', sans-serif;
    font-size: 50px;
	font-weight: 400;
} 
.custom-control{
	text-align: center;
}
.btn-primary{
	background-color: #EB2524; 
	border-color: #EB2524;
}
.btn-primary:hover{
	background-color: #1F1D1E;
	border-color: #1F1D1E;
}
.mt-4{
	margin-top: 15px !important;
}
.mb-4 > h2 {
	font-size: 20px;
}

</style>
 <script type="text/javascript">
$(function(){
		var check = 0;
		<c:if test="${sessionScope.id ne null}">check = 1;</c:if>
		if(check == 1){
			alert("정상적인 경로를 이용해 주세요.");
			location.href="./index.do";
		} 
	/* $("#login").click(function(){
		alert("등급 : "+${sessionScope.grade });
		if (${sessionScope.grade } == 0) {
			//$("#name").val();
			alert("탈퇴한 회원입니다.");
			location.href="./logout.do"; 
		}
		alert("end");
	}); */
});
</script>  


</head>
<body id="page-top">
	<!-- SideBar -->
	<%@ include file="sideBar.jsp"%>
	
	<!-- Header-->
	<!-- <header class="masthead d-flex align-items-center">
		<div class="container px-4 px-lg-5 text-center"></div>
	</header> -->

	<!-- content -->
	<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h2 class="mb-3">로그인</h2>
        <form action="./login.do" method="post" class="validation-form" novalidate >
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">아이디</label>
              <input type="text" class="form-control" id="name" name="id" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">비밀번호</label>
              <input type="password" class="form-control" id="nickname" name="pw" placeholder="" value="" required >
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
          </div>
          <div class="mb-4"></div>       
          <button id="login" class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
          <a href="./join.do" class="btn btn-primary btn-lg btn-block" type="submit">회원가입</a>
          <c:if test="${param.error ne null }">
          	<h2 style="color: red; font-size: 22px; margin-top: 10px;">아이디와 비밀번호가 일치하지 않습니다.</h2>
          </c:if> 
          <c:if test="${param.grade ne null }">
          	<script type="text/javascript">alert("이미 탈퇴한 회원입니다.");</script>
          </c:if> 
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; JUMJIN 2017-2022</p>
    </footer>
  </div>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>

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
