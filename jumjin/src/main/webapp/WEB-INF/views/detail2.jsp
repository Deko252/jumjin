<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			location.href="./postDel2.do?bno=${detail2.board_no }";
		}
	});
	$("#updateBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			alert("수정합니다");
			location.href="./update2.do?bno=${detail2.board_no}";	
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
		form += "<form action='./commentWrite2.do' method='post'><textarea name='comment'>"+comment+"</textarea>";
		form += "<input type='hidden' name='bno' value=${detail2.board_no }>";
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
		location.href="./commentDel2.do?bno=${detail2.board_no }&cno="+cno;
	});
	
	/* if(sessionScope.id ne null){
		$(".CommentWriter").show();
	}else{
		$(".CommentWriter").hide();
	}; */
		
});
</script>

<style type="text/css">
#sidebar-wrapper{
	position: fixed;
	top:0;
}
body {
  min-height: 100vh;
  background-color: #F4AE34;
  overflow: hidden;
}
h2{
	text-align: center;
}
.input-form {
	margin-top: 100px;
	max-width: 900px;
	padding: 40px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
#detailContent{
	margin: 0 auto;
}
#detailContentWriter{
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
	height: 30px;
	padding-top: 2px;
	margin-top: 10px;
	text-align: right;
}
#detailContentMain {
	margin-top: 20px;
}
#commentWriteBtn{
	margin-top: 10px;
	padding-left: 78%;
}
.CommentWriter {
    margin: 30px 0 29px;
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

/* .....못생긴거 */

.comment_row{
   margin: 30px 0px;
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


</style>


</head>
<body id="page-top">
	<div class="container">
	<!-- SideBar -->
	<%@ include file="sideBar.jsp"%>
	<div class="input-form col-md-12 mx-auto">
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
				<!-- 본문내용은 여기에 -->
				<div id="detailContent">
					<div style="margin-left: 20px;"><h3>${detail2.board_title }</h3></div>
					<div id="detailContentWriter">${detail2.b_name } / ${detail2.board_date }</div>
					<div id="detailContentMain">
						${detail2.board_content }
					</div>
					
				<%-- 	<c:if test="${sessionScope.id ne null }">
					<div class="CommentWriter">
 	                 <form action="./commentWrite.do" method="post" >
						<div class="comment_inbox_name">${sessionScope.name }</div>
						<textarea name="comment" placeholder="댓글을 남겨보세요"></textarea>
						<div class="comment_attach">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
						 <input type="hidden" name="bno" value="${detail.board_no }">
						</form>
						</div>
					</c:if> --%>
					

					  <div id="comments">      
               <div id="commentWriteForm">
                  <form action="./commentWrite2.do" method="post" id="myform">
                  <button type="submit" class="btn btn-primary" id="write_btn">글쓰기</button>
                     <input type="hidden" name="bno" value="${detail2.board_no }">
                     <textarea name="comment"></textarea>
                  </form>
               </div>
               
               <!-- 댓글 리스트를 출력 -->
                  <c:forEach items="${commentsList2 }" var="co">
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
                     </div>
                     <div class="comment_content">${co.c_comment }</div>
                  </div>               
                  </c:forEach>                  
	
					</div>
					
					<div id="commentWriteBtn">
					<c:if test="${detail2.b_id eq sessionScope.id}">
						<button class="btn btn-primary" id="updateBtn">수정</button>
						<button class="btn btn-danger" id="delBtn">삭제</button>
					</c:if>
						<button class="btn btn-success" onclick="location.href='./board2.do'">돌아가기</button>
					</div>
				</div>					
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