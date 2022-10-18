<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="head.jsp"%>
<script type="text/javascript">
   
</script>
<link href="./resources/assets/css/board.css" rel="stylesheet" />
<style type="text/css">
body{
   height : 1200px;
   border:1px solid;
   
}

.container {
   height : 800px;
   background-color: white;
   border-radius: 5px;
   border: 1px solid black;
   margin-top: 50px;
}

#title_wrap {
   margin: 0 auto;
   margin: 10px;
   width: 100%;
   font-size: large;
}

#title_detail {
   background-color: #c0c0c0;
   border-radius: 3px;
   padding-left: 10px;
}

#title {
   padding-left: 10px;
}

#content_wrap {
   width: 700px;
   height: 500px;
   
}

#content {
   width: 80%;
   height: 100%;
   margin: 0 auto;
   
}
#text_wrap{
   border:1xp solid red;
}

#comments{
   margin:10px 0;
   width: 100%;
   height: auto; 
   
}
#commentWriteForm{
   width: 90%;
   height: 100px;   
}
#commentWriteForm textarea {
   margin:0px;
   width: calc(100% - 100px);
   height: 100px;
   right: -4px;
   float: left;
}
#commentWriteForm button {
   width: 100px;
   height: 100px;
   float: left;
}


</style>
</head>
<body id="page-top">
   <div class="container">
      <%@ include file="sideBar.jsp"%>
      <div id="title_wrap">
         <div></div>
         <div id="title">${detail.board_title }</div>
         <div id="title_detail">${detail.b_name }${detail.board_date }</div>
         <div id="content_wrap">
            <div id="content">         
                  ${detail.board_content }
            </div>
         </div>
      </div>

      <div>
         <div id="comments">      
               <div id="commentWriteForm">
                  <form action="./commentWrite.do" method="post">
                     <input type="hidden" name="bno" value="${detail.board_no }">
                     <button type="submit" class="btn btn-primary">글쓰기</button>
                     <textarea name="comment"></textarea>
                  </form>
               </div>
         </div>


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