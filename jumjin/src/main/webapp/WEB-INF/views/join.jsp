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

  margin-top: 60px;
  padding: 32px;

  background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.custom-control{
	text-align: center;
}
#resultMsg{
	width: 100%;
	margin-top: 0.25rem;
	font-size: 80%;
	color: #dc3545;
}
.btn-primary{
	background-color: #EB2524; 
	border-color: #EB2524;
}
.btn-primary:hover{
	background-color: #1F1D1E;
	border-color: #1F1D1E;
}
.was-validated .form-control:invalid, .form-control.is-invalid {
  border-color: #dc3545;
  padding-right: calc(1.5em + 0.75rem);
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: right calc(0.375em + 0.1875rem) center;
  background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}
.was-validated .form-control:invalid:focus, .form-control.is-invalid:focus {
  border-color: #dc3545;
  box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
}  
.was-validated .form-control:valid, .form-control.is-valid {
  border-color: #198754;
  padding-right: calc(1.5em + 0.75rem);
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: right calc(0.375em + 0.1875rem) center;
  background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}
</style>

<script>
	$(function(){
		//alert("!");
		$("#id").on("change", function(){
			var id = $("#id").val();
			if (id.length < 5) {
				//alert("아이디는 5글자 이상으로 입력하세요.");
				$("#resultMsg").text("아이디는 5글자 이상으로 입력하세요.");
				$("#resultMsg").css("color", "#dc3545");
				$("#id").focus();
			}else{	
				//alert("입력한 값은 : " + id);
				//$("#resultMsg").text("입력한 값은 : " + id);
					$.ajax({
					url : "./idCheck.do",
					data : {"id" : id},
					type : "POST",
					dataType : "html"
				}).done(function(data){//통신 성공
					//$("#resultMsg").text("통신에 성공했습니다." + data);
					if (data == 1) {
						$("#resultMsg").text("이미 가입된 아이디입니다.");
						//$("#resultMsg").append("<br>");
						//$("#resultMsg").append("다른 아이디를 입력하세요.");
						$("#resultMsg").css("color", "#dc3545");
					} else {
						$("#resultMsg").text("가입 가능한 아이디입니다.");
						$("#resultMsg").css("color", "#198754");
					}
				}).fail(function(xhr){//통신 실패
					$("#resultMsg").text("문제가 발생했습니다." + xhr.status);
				});
			}
			
		});//ajax끝
		
		
		
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
        <h2 class="mb-3">회원가입</h2>
        <form class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="id" placeholder="5글자 이상 입력하세요." required maxlength="20">
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
	              <p id="resultMsg"></p>
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" placeholder="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div> 
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="6자리 이상 입력해주세요." required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호 확인</label>
            <input type="password" class="form-control" id="password" placeholder="한번 더 입력해주세요." required>
            <div class="invalid-feedback">
              한번 더 입력해 주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="phoneNumber">휴대폰<span class="text-muted">&nbsp;</span></label>
            <input type="text" class="form-control" id="phoneNumber" placeholder="010-1234-5678 ">
          </div>
          
          <div class="mb-3">
            <label for="email">이메일<span class="text-muted">&nbsp;</span></label>
            <input type="email" class="form-control" id="email" placeholder="you@example.com">
          </div>

          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
          <button class="btn btn-primary btn-lg btn-block" type="reset">취소</button>
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
        	var id = $("#id").val();
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
