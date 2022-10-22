<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>
<link href="./resources/assets/css/board.css" rel="stylesheet" />

<script type="text/javascript">
$(function(){//축약형
   //alert("!");
   $("#delBtn").click(function(){
      //alert("삭제버튼을 눌렀습니다");
      if(confirm("삭제하시겠습니까?")){
         alert("삭제합니다");
         location.href="./postDel.do?bno=${detail.board_no }";
      }
   });
   $("#updateBtn").click(function(){
      if(confirm("수정하시겠습니까?")){
         alert("수정합니다");
         location.href="./update.do?bno=${detail.board_no}";   
      }
   });
   
   $(".edit").click(function(){
      alert("수정을 눌렀습니다.");
      var cno = $(this).parent(".post_contact").children().text();
      //alert(cno);
      var comment = $(this).parents(".comment_row").children(".comment_content").text();
      $("#commentWriteForm").hide();//댓글창 사라지기
      //alert(comment);
      var  
      form = "<div class='CommentWriter' style='border: 2px solid #ffffff'>"; 
      form += "<form action='./commentWrite.do' method='post'><textarea name='comment'>"+comment+"</textarea>";
      form += "<input type='hidden' name='bno' value=${detail.board_no }>";
      form += "<input type='hidden' name='cno' value="+cno+">";
      form += "<div class='comment_attach'>";
      form += "<button type='submit' class='btn btn-primary'>수정하기</button>";
      form += "</div>"
      form += "</form>";
      form += "</div>";
      $(this).parents(".comment_row").html(form);
      $(".edit").remove();//수정버튼 사라지기
      $(".delete").remove();//삭제버튼 사라지기      
   });   
   $(".delete").click(function(){
      alert("삭제를 눌렀습니다.");
      var cno = $(this).parent(".post_contact").children().text();
      location.href="./commentDel.do?bno=${detail.board_no }&cno="+cno;
   });
   
   if(${sessionScope.id ne null }){
		$("#myform2").show();
	}else{
		$("#myform2").hide();
	};
   
});
</script>

<style type="text/css">

#sidebar-wrapper{
	position: fixed;
	top:0;
}
body{
	min-height : 100vh;
	background-color: #F4AE34;
}
.container{
	height: auto;
	min-height: 100%;
	width: 100%;
	padding-bottom: 70px;
}
.input-form {
	position:;
	margin-top: 50px;
	min-width: 1200px;
	padding: 70px;
	padding-top: 15px;
	padding-bottom: 50px;
	background: white;
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
	text-align: center;
	margin-top: 40px;
	margin-bottom: 40px;
}
#head_info{
   width: 100%;
   height: 300px;
   display: flex;
   margin-top: 30px;
}
#head_info img{
	margin-left: 40px;	
   width: 100%;
   height: 100%;
}
#info{
}
#text_wrap{
   margin-top: 30px;
   margin-left:100px; 
   height: 80%;
   color: gray;
}
h3 {
	color: #1F1D1E;
}
#avgStar{
	margin-top: 10px;
}
#foodPic_main {
	margin-left: 10px; 
	height: 300px;
	width: 500px;
}
#foodPic_menu > h3{
	margin-top: 50px;
	margin-left: 50px;
	margin-bottom: 20px;
}
#star_place{
   border: 1px solid red;
   }
#food_wrap{
   display: flex;
   justify-content: space-around;
   width: 100%;
   height: 300px;
   
}   
#food_wrap img {
   width: 300px;
   height: 100%;
}
.food_info{
	margin-top: 10px;
	text-align: center;
   width: 100%;
   height: 30px;
   font-size: 17px;
}

#comments{
   margin: 80px 0 50px;
   width: 100%;
   
}
#commentWriteForm{
   width: 100%;  
   
}
#star_place{
   height: 30px;
   padding-left: 15px;
   border: 0px;
   margin-top: 100px;
}

/* #commentWriteForm textarea {
   margin:0px;
   width: calc(70% - 100px);
   height: 70px;
   left: -5px;

} */
/* #commentWriteForm button {
   width: 100px;
   height: 100px;
   float: right;  
} */
.CommentWriter {
    margin: 5px 0 29px;
    padding: 16px 10px 35px 18px;
    border: 2px solid #dddddd;
    border-radius: 6px;
    box-sizing: border-box;
}
.CommentWriter textarea{
	overflow-x: hidden;
    overflow-y: auto;
    display: block;
    width: 100%;
    min-height: 17px;
    padding-right: 1px;
    border: 0;
    font-size: 13px;
    -webkit-appearance: none;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    color: var(--skinTextColor);
    outline: 0;
}
.comment_attach button {
	display: inline-block;
    min-width: 46px;
    height: 30px;
    font-size: 14px;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
    border: 0;
    background-color: white;
    color: #aaaaaa;
	float: right;
}
.comment_row{
   margin: 15px 0px;
   padding: 5px;
   width: 100%;
   min-height:80px;
   height:auto;
   background-color: #E6E6E6;
}
.comment_info{
   width:100%;
   height:30px;
   line-height:30px;
   color:white;
   background-color: #B5B5B5;
}
.post_contact{
   float: left;
   width: 300px;
   padding-left: 10px;
   font-size: 16px;   
}
.comment_button{
   float: right;
   width: 400px;
   text-align: right;
   padding-right: 10px;   
   font-size: 16px; 
}
.comment_content{
   height:20px;
   width: 100%;
   padding-left: 15px;
   padding-top: 10px;
}
.post_contact > span{
	display: none;
}
#star{
   height: 25px;
}

#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 1em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 gray; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #ffff00; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #ffff00; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #ffff00; /* 마우스 클릭 체크 */
}


#button_wrap{
   margin-top: 20px;
   position: relative;
	left: 78%;
	margin-top: 10px;
}
#write_btn {
	height: 32px;
	font-size: 15px;
}
#write_btn:hover {
	background-color: #1F1D1E;
}
#commentWriteBtn{
	float: right;
}
.btn-danger, .btn-success {
	margin-left: 5px;
}
#write_btn {
	height: 32px;
	font-size: 15px;
}
#write_btn:hover {
	background-color: #dddddd;
}
#myform2 > textarea {
	font-size: 14px;
}
.footer{
	position: relative;
	transform: translateY(-100%);
	padding-top: 1px;
	margin-top: 20px;
}

</style>
</head>
<body id="page-top">
   <div class="container">
      
      <!-- sidebar -->
      <%@ include file="sideBar.jsp"%>
      
      <div class="input-form col-md-12 mx-auto">
      
      <h2>음식점 소개</h2>
      <div id="head_info">
         <div id="foodPic_main"><img alt="restaurantPic" src="./resources/assets/img/${detail.board_main }"></div>
            <div id="text_wrap">
               <div><h3>${detail.board_title }</h3></div>
               <div><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp; ${detail.board_add }</div>
               <div><i class="fa-solid fa-phone"></i>&nbsp;&nbsp; ${detail.board_tel }</div>
               <div><i class="fa-regular fa-clock"></i>&nbsp;&nbsp; ${detail.board_time }</div>      
               <div id="avgStar"><c:forEach begin="1" end="${detail.avg_star }">⭐</c:forEach></div>
            </div>   
      </div>
      <div id="foodPic_menu">
         <h3>대표메뉴</h3>
         <div id="food_wrap">
            <div><img alt="음식사진1" src="./resources/assets/img/${detail.board_pic1 }"> 
               <div class="food_info">${detail.name_pic1 }</div>
            </div>
            <div><img alt="음식사진2" src="./resources/assets/img/${detail.board_pic2 }">
            <div class="food_info">${detail.name_pic2 }</div>
            </div>
            <div><img alt="음식사진3" src="./resources/assets/img/${detail.board_pic3 }">
            <div class="food_info">${detail.name_pic3 }</div>
            </div>
         </div>   
      </div>
      
		<div id="comments">
        	<form action="./commentWrite.do" method="post" onsubmit="submit();"	id="myform2">
			<div id="myform">
	            <div id="star_place">
	            	<fieldset>
						<input type="radio" name="star" value="5" id="rate1"><label for="rate1">⭐</label><!-- name sql java / id js css jq -->
						<input type="radio" name="star" value="4" id="rate2"><label for="rate2">⭐</label>
						<input type="radio" name="star" value="3" id="rate3"><label for="rate3">⭐</label>
						<input type="radio" name="star" value="2" id="rate4"><label for="rate4">⭐</label>
						<input type="radio" name="star" value="1" id="rate5" checked="checked"><label for="rate5">⭐</label>          
	            	</fieldset>
	            </div>
			</div> 
        <div id="commentWriteForm" class="CommentWriter">
	            <div class="comment_inbox_name">${sessionScope.name }</div>
	            <textarea name="comment" placeholder="댓글을 남겨보세요"></textarea>
	            <div class="comment_attach">
		            <button type="submit" class="btn btn-primary" id="write_btn">글쓰기</button>
	            </div>
	            <input type="hidden" name="bno" value="${detail.board_no }">
       	</div>
            </form>
        	<c:forEach items="${commentsList }" var="co">
            	<div class="comment_row">
                	<div class="comment_info">
                    	<div class="post_contact">
                        	<span id="cno">${co.c_no }</span>
                           	${co.b_id }&nbsp;/&nbsp;${co.b_name }
                           	<c:if test="${sessionScope.id eq co.b_id }">
                           	<a class="edit" style="color: #fff; cursor: pointer;"><i class="fa-solid fa-pen"></i></a>
                          	<a class="delete" style="color: #fff; cursor: pointer;"><i class="fa-solid fa-trash"></i></a>
                       		</c:if>
                        </div>
	                    <div class="comment_button">
	                        <c:forEach begin="1" end="${co.c_star }">⭐</c:forEach> &nbsp;/&nbsp; ${co.c_date }
	                    </div>
                 	</div>
                     	<div class="comment_content">${co.c_comment }</div>
                 </div>               
            </c:forEach> 
                                   
         <div id="commentWriteBtn">
            <button class="btn btn-success" onclick="location.href='./board.do'">돌아가기</button>
         </div>
         
      </div>
      </div>
   </div>
   <!-- Footer -->
   <%@ include file="footer.jsp"%>

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>

   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

   <!-- Core theme JS-->
   <script src="./resources/assets/js/scripts.js"></script>
</body>
</html>