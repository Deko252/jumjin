<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

<style>

.sidebar-nav > .sidebar-brand a {
	font-family: 'Gugi', cursive;
	letter-spacing: 5px;
}

.sidebar-nav > .sidebar-brand a > span {
	color: #F4AE34;
}

</style>

<a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
<nav id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="./index.do">점<span>.</span>진<span>.</span>사</a></li>
        <c:if test="${sessionScope.id ne null }">
			<li class="sidebar-nav-item"><a href="./info.do">
          		<span>${sessionScope.name } 님</span>
        	</a></li>
        </c:if>
		<li class="sidebar-nav-item"><a href="./roulette.do">룰렛돌리기</a></li>
		<li class="sidebar-nav-item"><a href="./ghostLeg.do">사다리타기</a></li>
		<li class="sidebar-nav-item"><a href="./map.do">음식점 검색</a></li>
		<li class="sidebar-nav-item"><a href="./board.do">게시판</a></li>
		
		<c:choose>
			<c:when test="${sessionScope.id eq null }">
			<li class="sidebar-nav-item"><a href="./login.do">로그인</a></li>
			<li class="sidebar-nav-item"><a href="./join.do">회원가입</a></li>
			</c:when>
			<c:otherwise>
			<li class="sidebar-nav-item"><a href="./logout.do">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
		
	</ul>
</nav>