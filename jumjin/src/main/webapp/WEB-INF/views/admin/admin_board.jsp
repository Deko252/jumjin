<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="" rel="stylesheet">
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

<style type="text/css">

body {
	margin: 0 auto;
}
h1 {
	text-align: center;
}
#list{
	position:absolute; 
    top:50%; left:50%;
    transform: translate(-50%, -50%);
    
}
table {
	border: 1px solid gray;
	width: 1200px;
	height: 500px;
}
#list td {
	font-size: 17px;
	border: 1px solid gray;
}
#list tr {
}
#list .td1 {
	text-align: center;
	width: 70px;
}
#list .td2 {
	padding-left:10px;
	text-align: left;
	width: 400px;
}
#list .td3 {
	text-align: center;
	width: 300px;
}
#list .td4 {
	text-align: center;
	width: 230px;
}
#list .td5 {
	text-align: center;
	width: 120px;
}
#list .td5 button, .detail {
	width: 100px;
	height: 30px;
	font-size: 15px;
}

body > div {
}
#list .tr1 {
	text-align: center;
	font-weight: bold;
	height: 50px;
}
#list .tr2 {
	height: 40px;
}
#paging {
	text-align: center;
	padding-top: 30px;
	font-size: 18px;
	text-decoration: none;
	letter-spacing: 10px;
}
a {
	text-decoration: none;
}

</style>

<%@ include file="admin_menu.jsp" %>

</head>
<body>
	<div id="list">
	<!-- 로그 찍어줄겁니다. jstl -->
	<h1>게시글 관리</h1>
	<table>
		<thead>
		<tr class="tr1">
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>삭제여부</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="b">
		<tr class="tr2">
			<td class="td1">${b.board_no }</td>
			<td class="td2" id="title">
				<button class="detail" value="${b.board_no }">상세보기</button>
				${b.board_title }<small>${b.commentCount }</small>
			</td>
			<td class="td3">${b.b_no } / ${b.b_id } / ${b.b_name }</td>
			<td class="td4">${b.board_date }</td>
			<td class="td5">
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
      	<div id="paging">
      		<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
      	</div>
    </div>       	
</body>
</html>