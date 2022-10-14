<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
<nav id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="./index.do">점.진.사</a></li>
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