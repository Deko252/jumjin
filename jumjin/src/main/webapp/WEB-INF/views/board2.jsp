<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

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
function linkPage(pageNo){location.href="./board2.do?pageNo="+pageNo;}
</script>


<style type="text/css">
body {
  min-height: 100vh;
  background-color: #F4AE34;
}
table {
	text-align: center;
}
thead > tr {
	height: 40px;
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

.startRadio {
	display: inline-block;
	overflow: hidden;
	height: 40px;
}

.startRadio:after {
	content: "";
	display: block;
	position: relative;
	z-index: 10;
	height: 40px;
	background:
		url("data:image/png;base64,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")
		repeat-x 0 0;
	background-size: contain;
	pointer-events: none;
}

.startRadio__box {
	position: relative;
	z-index: 1;
	float: left;
	width: 20px;
	height: 40px;
	cursor: pointer;
}

.startRadio__box input {
	opacity: 0 !important;
	height: 0 !important;
	width: 0 !important;
	position: absolute !important;
}

.startRadio__box input:checked+.startRadio__img {
	background-color: #0084ff;
}

.startRadio__img {
	display: block;
	position: absolute;
	right: 0;
	width: 500px;
	height: 40px;
	pointer-events: none;
}

.input-form {
  margin-top: 50px;
  max-width: 1200px;
  padding: 32px;
  padding-top: 20px;
  background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
.input-form > h2 {
	font-family: 'Jua', sans-serif;
    font-size: 50px;
	font-weight: 400;
}
h2{
	text-align: center;
	margin-top: 50px;
	margin-bottom: 20px;
}
#writeBtn {
	position: relative;
	left: 90%;
	margin-top: 10px;
}
.btn-primary {
	width: 80px;
	height: 40px;
	border: none;
	background-color: #EB2524;
		
}
.btn-primary:hover {
	background-color: #1F1D1E;
}
.table-striped td {
	height: 40px;
	padding-top: 7px;
}
#top > th{
	padding-bottom: 10px;
	height: 50px;
}
#paging {
	margin: 0 auto;
	font-size: 18px;
	letter-spacing: 2px;
	text-decoration: none;
	width: 600px;
	height: 30px; 
	text-align: center;
	padding-top: 5px;
    text-decoration: none;
}
.table-responsive {
	border-bottom: 1px solid gray;
}
tbody > tr:hover > * {
  --bs-table-accent-bg: var(--bs-table-hover-bg);
  color: var(--bs-table-hover-color);
}
tbody > tr:nth-of-type(2n+1):hover > * {
	--bs-table-accent-bg: var(--bs-table-hover-bg);
  	color: var(--bs-table-hover-color);
}
#top > th:first-child { width: 10%;}
#top > th:first-child + th { width: 40%;}
#top > th:first-child + th + th{ width: 15%;}
#top > th:first-child + th + th + th{ width: 20%;}
/* #top > th:first-child + th + th + th +th{ width: 15%;} */
</style>


<style type="text/css">
@media (max-width: 349px) {
 .footer{
 	display: none;
 }
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
		<div class="table-responsive">
        	<table class="table table-striped table-sm">
          		<thead>
	            	<tr id="top">
	              		<th scope="col">번호</th>
	              		<th scope="col">제목</th>
	              		<th scope="col">글쓴이</th>
	              		<th scope="col">날짜</th>
	              		<th scope="col">조회수</th>
	              		<th scope="col">추천</th>
	            	</tr>
          		</thead>
          		<tbody>
          		<c:forEach items="${list  }" var="s">
            		<tr>
              			<td>${s.board_no }</td>
              			<td><a href="./detail2.do?bno=${s.board_no }">${s.board_title } <c:if test="${s.commentCount >= 1 }"><small>[${s.commentCount }]</small></c:if></a></td>
              			<td>${s.b_name }</td>
              			<td>${s.board_date }</td>
              			<td>${s.VIEW_COUNT }</td>
              			<td>${s.b_like - s.b_dislike }</td>
            		</tr>
          		</c:forEach>
            		
          		</tbody>
        	</table>
		    </div>
		    <!-- 페이징 -->
           	<div id="paging" style="text-decoration:none;">
           		<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
           	</div>
		    
                    	<!-- 글쓰기 -->
              			<button id="writeBtn" class="btn btn-primary">글쓰기</button>
	</div>
</div>

	<%-- <c:choose>
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
						<td><a
							href="./detail.do?cate=${param.cate }&bno=${l.board_no }">
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
	</c:choose> --%>
	
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
