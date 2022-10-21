<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <%@ include file="head.jsp" %>
        <!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
		<script type="text/javascript">
			$(function(){			
				$('#summernote').summernote(
						{height: 500}
				);
			});
		</script>
    </head>
    <body>      
          <div>
                    	<form action="./update2.do" method="post">
							<input type="text" name="title" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required value="${detail2.board_title }">
							<div class="form-group">
								<textarea class="form-control" rows="20" id="summernote" name="content" required>${detail2.board_content }</textarea>
							</div>
							<input type="hidden" name="board_no" value="${detail2.board_no }">
							<input type="hidden" name="cate" value="${detail2.board_cate }">
							<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
						</form>
                    </div>
    </body>
</html>