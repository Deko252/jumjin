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

<style>
h2 {
	text-align: center;
}

body {
	min-height: 100vh;
	background-color: #F4AE34;
}

.input-form {
	max-width: 680px;
	margin-top: 50px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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
</style>


</head>
<body id="page-top">
<table>
		<tr>
            <td>아이디</td>
            <td>${info.b_id }</td>
            </tr>
            <tr>
            <td>닉네임</td>
            <td>${info.b_name }</td>
            </tr>
            <tr>
            <td>비밀번호</td>
            <td>
            <form action="./password.do" method="post">
            <input type="password" name="npw" maxlength="20" placeholder="변경할 비밀번호를 입력하세요.">
            <button type="submit" id="btn" class="btn btn-primary"><i class="bi bi-star-half"></i>변경하기<i class="bi bi-star-half"></i></button>
            </form>
            </td>
            </tr>
            <tr>
                    				<td>이메일</td>
                    				<td>${info.b_email }</td>
                    			</tr>
			
	</table>
					
</body>
</html>