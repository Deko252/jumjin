<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
body {
  min-height: 100vh;
  background-color: #F4AE34;
}
h2{
	text-align: center;
	margin-top: 50px;
}
#button_wrap{
	margin-top: 20px;
}


</style>


</head>
<body id="page-top">
	<div class="container">
	<!-- SideBar -->
	<%@ include file="sideBar.jsp"%>
	<div class="d-flex" id="wrapper">
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Page content-->
			<div class="container-fluid">
				<!-- 본문내용은 여기에 -->
				<div style="margin: 0 auto; margin:10px; width: 90%;">
					<div style="font-size:large; border-bottom: 1px solid gray;">${detail.board_title }</div>
					<div style="background-color: #c0c0c0; border-bottom: 1px solid gray;">${detail.b_name } ${detail.board_date }</div>
					<div>
						${detail.board_content }
					</div>
					<div id="button_wrap">
				<button class="btn btn-primary" id="updateBtn">수정</button>
				<button class="btn btn-danger" id="delBtn">삭제</button>
				<button class="btn btn-success" onclick="location.href='./board.do'">보드</button>
			</div>
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