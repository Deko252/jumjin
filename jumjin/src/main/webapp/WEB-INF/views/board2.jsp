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

<script type="text/javascript">
$(function(){
	<c:if test="${param.result eq '1'}">
		alert("정상 등록되었습니다.");
	</c:if>
	<c:if test="${param.result eq '0'}">
		alert("저장할 수 없습니다\n다시 작성해주세요.");
	</c:if>
	 
	$("#writeBtn").click(function(){
		var check = 0;
		<c:if test="${sessionScope.id ne null}">check = 1;</c:if>
		if(check == 0){   
			alert("글을 쓰려면 로그인 하셔야 합니다.");
			location.href="./login.do";
		} else {
			location.href="./write2.do";//카테고리도 보내기
		}
	});
});
function linkPage(pageNo){location.href="./board.do?pageNo="+pageNo;}
</script>

<style type="text/css">
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
h2{
	text-align: center;
	margin-top: 50px;
}

.input-form {
  max-width: 1200px;
  padding: 32px;
  padding-top: 15px;
  background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

</style>


</head>


<body id="page-top">
	<div class="container">
	<!-- SideBar -->
	<%@ include file="sideBar.jsp"%>
	<!-- Header-->
	<!-- <header class="masthead d-flex align-items-center">
		<div class="container px-4 px-lg-5 text-center"></div>
	</header> -->

	<!-- content -->
	<br>
	<div class="input-form col-md-12 mx-auto">
	<h2>자유 게시판</h2>
	<c:choose>
		<c:when test="${fn:length(list) > 0 }">
			<table class="table table-striped table-hover">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>쓴사람</td>
					<td>날짜</td>
				</tr>
				<c:forEach items="${list }" var="l">
					<tr>
						<td>${l.board_no }</td>
						<td><a href="./detail2.do?bno=${l.board_no }">
								${l.board_title } <c:if test="${l.board_file ne null }">
									<i class="xi-image-o"></i>
								</c:if> <c:if test="${l.commentCount gt 0 }">
									<span class="badge bg-secondary">${l.commentCount }</span>
								</c:if>
						</a></td>
						<td>${l.b_name }</td>
						<td>${l.board_date }</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h2>데이터가 없습니다.</h2>
		</c:otherwise>
	</c:choose>
	
	<!-- 글쓰기 -->
              			<button id="writeBtn" class="btn btn-primary">글쓰기</button>
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
