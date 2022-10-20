<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="../resources/css/adminBoard.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$(".detail").click(function(){
		var bno = $(this).val();
			window.open("../detail2.do?bno=" + bno,"child","width=900, height=600");			

	});
});
function del(no){
	if(confirm(no + "번을 삭제합니다")){
		location.href="./postDel.do?bno="+no;
	}
}               
function re(no){
	if(confirm(no + "번을 복원합니다")){
		location.href="./postRemove.do?bno="+no;
	}	
}

function linkPage(pageNo){
	location.href="./admin_board.do?pageNo="+pageNo;
	
	}
</script>
</head>
<%@ include file="admin_menu.jsp" %>
<body>
	<h1>게시글 관리</h1>
	<!-- 로그 찍어줄겁니다. jstl -->
	<table>
		<thead>
		<tr>
			<td>번</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>삭제여부</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="b">
		<tr>
			<td>${b.board_no }</td>
			<td id="title">
				<button class="detail" value="${b.board_no }">상세보기</button>
				${b.board_title }<small>${b.commentCount }</small>
			</td>
			<td>${b.b_no } / ${b.b_id } / ${b.b_name }</td>
			<td>${b.board_date }</td>
			<td>
			<c:choose>
				<c:when test="${b.board_del eq '0'}"><button onclick="del(${b.board_no })">삭제</button></c:when>
				<c:otherwise><button onclick="re(${b.board_no })">복원</button></c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
           	<div id="paging" style="text-decoration:none;">
           		<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
           	</div>
</body>
</html>