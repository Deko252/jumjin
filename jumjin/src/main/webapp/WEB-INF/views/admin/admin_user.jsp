<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="../resources/css/adminBoard.css" rel="stylesheet">

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
	max-height: 500px;
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
	text-align: left;
	padding-left:10px;
	width: 200px;
}
#list .td3 {
	text-align: left;
	padding-left:10px;
	width: 200px;
}
#list .td4 {
	text-align: center;
	width: 250px;
}
#list .td5 {
	text-align: center;
	width: 200px;
}
#list .td6 {
	text-align: center;
	width: 120px;
}
#list .td6 select {
	font-size: 14px;
	width: 80px;
	height: 25px;
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

<script type="text/javascript">
$(function(){
	$("select").on("change", function(){
		//alert(this.value);//선택된 value가 옵니다
		//var p = $(this).closest(".tp").find(".hd").val();
		//alert(p);
		if(confirm("등급을 변경합니까?")){
			var bno = $(this).closest("tr").children().first().text();
			var grade = this.value;
			//alert(bno + " : " + grade);
			$.ajax({
				url : "./userGradeAJAX.do",
				data : {"bno" : bno, "grade" : grade},
				type : "POST",
				dataType : "html"
			})
			.done(function(data){
				if(data == 1){					
					alert("수정했습니다." + data);			
				}else{
					alert("문제가 발생했습니다\n다시 시도하세요.");	
				}
			})
			.fail(function(xhr){
				alert("문제가 발생했습니다\n다시 시도하세요." + xhr.status);
			});
		}
	});
});

function linkPage(pageNo){
	location.href="./admin_user.do?pageNo="+pageNo;
	}	

</script>


</head>
	<%@ include file="admin_menu.jsp" %>
<body>
	<div id="list">
	<h1>사용자 관리</h1>
	<!-- 로그 찍어줄겁니다. jstl -->
	<table>
		<thead>
		<tr class="tr1">
			<td>회원번호</td>
			<td>아이디</td>
			<td>닉네임</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td>회원등급</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${userList }" var="u">
		<tr class="tr2">
			<td class="td1">${u.b_no }</td>
			<td class="td2">${u.b_id }</td>
			<td class="td3">${u.b_name }</td>
			<td class="td4">${u.b_email }</td>
			<td class="td5">${u.b_num }</td>
			<td class="td6">
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
		<div id="paging">
      		<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
      	</div>
</body>
</html>