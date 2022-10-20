<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="../resources/css/adminBoard.css" rel="stylesheet">

</head>
	<%@ include file="admin_menu.jsp" %>
<body>
	<h1>사용자</h1>
	<!-- 로그 찍어줄겁니다. jstl -->
	<table>
		<thead>
		<tr>
			<td>번</td>
			<td>아이디</td>
			<td>닉네임</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td>회원등급</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${userList }" var="u">
		<tr>
			<td>${u.b_no }</td>
			<td>${u.b_id }</td>
			<td>${u.b_name }</td>
			<td>${u.b_email }</td>
			<td>${u.b_num }</td>
			<td>
				<select>
					<optgroup label="사용자">
						<option value="5" <c:if test="${u.b_grade eq 5}">selected="selected"</c:if>>사용자</option>
						<option value="0" <c:if test="${u.b_grade eq 0}">selected="selected"</c:if>>탈퇴</option>
					</optgroup>
					<optgroup label="관리자">
						<option value="6" <c:if test="${u.b_grade eq 6}">selected="selected"</c:if>>관리자</option>
					</optgroup>
				</select>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>