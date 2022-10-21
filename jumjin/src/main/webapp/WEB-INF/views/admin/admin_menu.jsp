<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<style>
body {
   margin: 0;
   padding: 0;
}

#adminMenu {
   margin: 0;
   height: 50px;
   width: 100%;
   background-color: gray;
   line-height: 50px;
   position: fixed;
   top: 0px;
   font-weight: bold;
}

#adminMenu ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
}

li {
   float: left;
   display: block;
   margin: 0 20px;
   padding: 0 20px;
}

li:hover {
   background-color: blue;
   color: white;
}

#blank {
   display: block;
   height: 60px;
}
</style>
<div id="adminMenu">
   <ul>
      <li onclick="location.href='../index.do'">웹사이트로 돌아가기</li>
      <li onclick="location.href='./admin_board.do'">게시글관리</li>
      <li onclick="location.href='./admin_user.do'">사용자관리</li>
   </ul>
</div>
<div id="blank">&emsp;</div>