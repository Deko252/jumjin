<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/assets/css/board.css" rel="stylesheet" />
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
   
 <script type="text/javascript">
$(function(){
		var check = 0;
		<c:if test="${sessionScope.id ne null}">check = 1;</c:if>
		if(check == 0){
			alert("로그인 하세요.");
			location.href="./login.do";
		}
		const target = document.getElementById("btn");
		  target.disabled = true		
		  
		$("#pw1").on("change", function(){
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();

			if (pw1 == "" || pw1.length < 6) {
				$("#resultMsg").text("6글자 이상 입력해주세요.");
				$("#resultMsg").css("color", "#dc3545");
				$("#pw1").focus();
				const target = document.getElementById("btn");
				  target.disabled = true
			} else if (pw1 != pw2) {
				$("#resultMsg").text("두 암호가 일치하지 않습니다.");
				$("#resultMsg").css("color", "#dc3545");
				$("#pw1").focus();
				const target = document.getElementById("btn");
				  target.disabled = true
			} else if(pw1 == pw2){
				$("#resultMsg").text("암호가 일치합니다.");
				$("#resultMsg").css("color", "#6ddd65");  
				const target = document.getElementById("btn");
				  target.disabled = false
			}	
		});	
		$("#pw2").on("change", function(){
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			
			if (pw2 == "" || pw2.length < 6) {
				$("#resultMsg").text("6글자 이상 입력해주세요.");
				$("#resultMsg").css("color", "#dc3545");
				$("#pw1").focus();
				const target = document.getElementById("btn");
				  target.disabled = true
			} else if (pw2 != pw1) {
				$("#resultMsg").text("두 암호가 일치하지 않습니다.");
				$("#resultMsg").css("color", "#dc3545");
				$("#pw2").focus();
				const target = document.getElementById("btn");
				  target.disabled = true
			}else if(pw2 == pw1) {
				$("#resultMsg").text("암호가 일치합니다.");
				$("#resultMsg").css("color", "#6ddd65");    
				const target = document.getElementById("btn");
				  target.disabled = false
			}	
		});		
		$("#btn").click(function(){	
			if(confirm("비밀번호를 변경하시겠습니까?")){
			  var form = document.createElement("form");
		         form.setAttribute("charset", "UTF-8");
		         form.setAttribute("method", "post");  //Post 방식
		         form.setAttribute("action", "./password.do"); //요청 보낼 주소
		         var pass = document.createElement("input");
		         pass.setAttribute("type", "password");
		         pass.setAttribute("name", "npw");
		         pass.setAttribute("value", $("#pass").val());
		         form.appendChild(pass);
		          
		         document.body.appendChild(form);
		         form.submit();
		         alert("변경 되었습니다. 다시 로그인 해주세요.");			         		         
			}
	});
});
</script>  

<style>
body {
   min-height: 100vh;
   background-color: #F4AE34;
}
h2 {
   text-align: center;
   margin-top: 30px;
   margin-bottom: 20px;
}
.input-form {
   margin-top: 180px;
   max-width: 880px;
   height: 650px;
   padding: 32px;
   background: #fff;
   -webkit-border-radius: 10px;
   -moz-border-radius: 10px;
   border-radius: 10px;
   -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
   -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
   box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.input-form>h2 {
   font-family: 'Jua', sans-serif;
   font-size: 50px;
   font-weight: 400;
}

.custom-control {
   text-align: center;
}

#resultMsg {
   width: 100%;
   margin-top: 0.25rem;
   font-size: 80%;
   color: #dc3545;
}

.btn-primary {
   background-color: #EB2524;
   border-color: #EB2524;
}

.btn-primary:hover {
   background-color: #1F1D1E;
   border-color: #1F1D1E;
}

.was-validated .form-control:invalid, .form-control.is-invalid {
   border-color: #dc3545;
   padding-right: calc(1.5em + 0.75rem);
   background-image:
      url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
   background-repeat: no-repeat;
   background-position: right calc(0.375em + 0.1875rem) center;
   background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.was-validated .form-control:invalid:focus, .form-control.is-invalid:focus
   {
   border-color: #dc3545;
   box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
}

.was-validated .form-control:valid, .form-control.is-valid {
   border-color: #198754;
   padding-right: calc(1.5em + 0.75rem);
   background-image:
      url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
   background-repeat: no-repeat;
   background-position: right calc(0.375em + 0.1875rem) center;
   background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.mt-4 {
   margin-top: 15px !important;
}
tr{
   height: 90px;
   border-bottom: 1px solid #cccccc;
}
tr > td:first-child {
   width: 500px;
}
table {
   margin-left: 70px;
}
#info_wrap{
	display: flex;
	height: 150px;
}
#pw_wrap{
	width: 200px;
}
#pw1{
	margin-top: 22px;
}
#pw2{
	margin-top: 10px;
}
#btn_wrap{
	margin-right: 20px;
	margin-left: 10px;
}
#btn{
	height: 80px;
	width: 100px;
	margin-top: 15px;
}

</style>


</head>
   <body id="page-top">
   <!-- SideBar -->
   <%@ include file="sideBar.jsp"%>
   <div class="container">
   <div class="input-form-backgroud row">
   <div class="input-form col-md-12 mx-auto">
   <h2>회원 정보</h2>
   
   <table>
   
      <tr>
            <td style="font-weight: bold; font-size: 20px;">아이디</td>
            <td>${info.b_id }</td>
        </tr>
        <tr>
            <td style="font-weight: bold; font-size: 20px;">닉네임</td>
            <td>${info.b_name }</td>
        </tr>
        <tr>
            <td style="font-weight: bold; font-size: 20px;">비밀번호</td>
          		 <td id="info_wrap">
          		 	<div id="pw_wrap">
						<input type="password" name="pw1" id="pw1" placeholder="변경할 암호를 입력하세요" required="required">
						<input type="password" name="pw2" id="pw2" placeholder="한번 더 입력해주세요" required="required">
						<p id="resultMsg"></p>
						<p id="resultMsg1"></p>	
					</div>	
					<div id="btn_wrap">
							<button id="btn" type="submit" class="btn btn-danger">변경하기</button>
					</div>		
				</td>
        </tr>
        <tr>
         <td style="font-weight: bold; font-size: 20px;">이메일</td>
         <td>${info.b_email }</td>
        </tr>
         
   </table>
   </div>
   </div>
   </div>
   <!-- Footer -->
   <%@ include file="footer.jsp"%>
   
   <!-- Bootstrap core JS-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   
   <!-- Core theme JS-->
   <script src="./resources/assets/js/scripts.js"></script>            
</body>
</html>