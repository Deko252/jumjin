<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>
<script type="text/javascript">
	
</script>
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
		var form = "<div id='commentWriteForm'>"; 
		form += "<form action='./commentWrite.do' method='post'><textarea name='comment'>"+comment+"</textarea>";
		form += "<input type='hidden' name='bno' value=${detail.board_no }>";
		form += "<input type='hidden' name='cno' value="+cno+">";
		form += "<button type='submit' class='btn btn-primary'>수정하기</button>"; 
		form += "</form>";
		form += "</div>";
		$(this).parents(".comment_row").html(form);
		$(".edit").remove();//수정버튼 사라지기
		$(".delete").remove();//삭제버튼 사라지기		
	});	
	$(".delete").click(function(){
		alert("삭제를 눌렀습니다.");
		var cno = $(this).parent(".post_contact").children().text();
		location.href="./commentDel.do?cate=${param.cate}&bno=${detail.board_no }&cno="+cno;
	});	
	
});
</script>

<style type="text/css">

body{
	height : 1200px;
}

.container {
  margin-top : 50px;
  max-width: 1200px;
  padding: 32px;
  padding-top: 15px;
  background: white;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
#head_info{
	width: 100%;
	height: 300px;
	border: 1px solid red;
	display: flex;
	margin-top: 20px;
	
}
#head_info img{
	width: 100%;
	height: 100%;
	border: 1px solid red;
}
#info{		
	border: 1px solid red;
}
#text_wrap{
	margin-top:10px;
	margin-left:10px;
	border: 1px solid red;	
	height: 80%;
	color: gray;
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
	width: 100%;
	height: 100%;
}
.food_info{
	width: 100%;
	height: 30px;
	border: 1px solid red;
}

#comments{
	margin:50px 0;
	width: 100%;
	
}
#commentWriteForm{
	width: 100%;
	height: 100px; 	
	
	
	
}
#star_place{
	height: 30px;
}

#commentWriteForm textarea {
	margin:0px;
	width: calc(100% - 100px);
	height: 70px;
	left: -5px;

}
#commentWriteForm button {
	width: 100px;
	height: 100px;
	float: left;
	
}
.comment_row{
	margin: 30px 0px;
	padding: 5px;
	width: 100%;
	min-height:50px;
	height:auto;
	background-color: #c0c0c0;
}
.comment_info{
	width:100%;
	height:30px;
	line-height:30px;
	color:white;
	background-color: gray;
}
.post_contact{
	float: left;
	width: 300px;
	padding-left: 10px;	
}
.comment_button{
	float: right;
	width: 400px;
	text-align: right;
	padding-right: 10px;	
}
.comment_content{
	height:20px;
	width: 100%;
}


span{
	display: none;
}
#star{
	border: 1px solid red;
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
}

</style>
</head>
<body id="page-top">
	<div class="container">
		<%@ include file="sideBar.jsp"%>
		<div id="head_info">
			<div><img alt="음식점 사진" src="./resources/img/gugong.jpg"></div>
				<div id="text_wrap">
					<div><h4>${detail.board_title }</h4></div>
					<div><i class="fa-solid fa-location-dot"></i> 경기도 부천시 중동로262번길 102</div>
					<div><i class="fa-solid fa-phone"></i> 032-323-4007 </div>
					<div><i class="fa-regular fa-clock"></i> 매일 11:00 ~ 22:00</div>		
					<div><c:forEach begin="1" end="${detail.avg_star }">⭐</c:forEach></div>
				</div>	
		</div>
		<div>
			<h5>대표메뉴</h5>
			<div id="food_wrap">
				<div><img alt="음식사진1" src="./resources/img/food1.jpg"> 
					<div class="food_info">음식설명</div>
				</div>
				<div><img alt="음식사진2" src="./resources/img/food2.jpg">
				<div class="food_info">음식설명</div>
				</div>
				<div><img alt="음식사진3" src="./resources/img/food3.jpg">
				<div class="food_info">음식설명</div>
				</div>
			</div>	
		</div>
		
			<div id="comments">		
					<div id="commentWriteForm">
						<form action="./commentWrite.do" method="post" id="myform">
						<button type="submit" class="btn btn-primary" id="write_btn">글쓰기</button>
							<input type="hidden" name="bno" value="${detail.board_no }">
							<div id="star_place">
							 <fieldset>
      						  		 <input type="radio" name="star" value="5" id="rate1"><label for="rate1">⭐</label><!-- name sql java / id js css jq -->
      							  	 <input type="radio" name="star" value="4" id="rate2"><label for="rate2">⭐</label>
      								 <input type="radio" name="star" value="3" id="rate3"><label for="rate3">⭐</label>
       								 <input type="radio" name="star" value="2" id="rate4"><label for="rate4">⭐</label>
      							  	 <input type="radio" name="star" value="1" id="rate5"><label for="rate5">⭐</label>
  							  </fieldset>
  							  </div>
							<textarea name="comment"></textarea>
						</form>
					</div>
						<c:forEach items="${commentsList }" var="co">
						<div class="comment_row">
							<div class="comment_info">
								<div class="post_contact">
									<span id="cno">${co.c_no }</span>
									${co.b_id }/${co.b_name }
									<c:if test="${sessionScope.id eq co.b_id }">
									<a class="edit" style="color: #fff; cursor: pointer;"><i class="fa-solid fa-pen"></i></a>
									<a class="delete" style="color: #fff; cursor: pointer;"><i class="fa-solid fa-trash"></i></a>
									</c:if>
								</div>
								<div class="comment_button">
								<c:forEach begin="1" end="${co.c_star }">⭐</c:forEach> / ${co.c_date }
								</div>
							</div>
							<div class="comment_content">${co.c_comment }</div>
						</div>					
						</c:forEach>						

			<div id="button_wrap">
				<button class="btn btn-primary" id="updateBtn">수정</button>
				<button class="btn btn-danger" id="delBtn">삭제</button>
				<button class="btn btn-success" onclick="location.href='./board.do'">보드</button>
			</div>
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