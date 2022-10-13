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

</head>
<body id="page-top">
	<!-- SideBar -->
	<%@ include file="sideBar.jsp"%>
	
	<!-- Header-->
	<!-- <header class="masthead d-flex align-items-center">
		<div class="container px-4 px-lg-5 text-center"></div>
	</header> -->

	<!-- content -->
	<h1>게시판</h1>
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
						<td><a href="./detail.do?cate=${param.cate }&bno=${l.board_no }">
							${l.board_title }
							<c:if test="${l.board_file ne null }"> <i class="xi-image-o"></i></c:if> 
							<c:if test="${l.commentCount gt 0 }">
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
