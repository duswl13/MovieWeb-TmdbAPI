<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="writeform.js" charset="euc-kr"></script>
<style>
tr.center-block{text-align:center}
h1{font-size:1.5rem;text-align:center;color:#1a92b9}
.container{width:60%}
label{font-weight:bold}
#upfile{display:none}
img{width:20px}
</style>
</head>
<body>
<div class="container">
	<form action="BoardAddAction.bo" method="post" enctype="multipart/form-data" name="boardform">
		<h1>공지사항</h1>
		<div class="form-group">
			<label for="board_content">내용</label>
			<textarea name="BOARD_CONTENT" id="board_content" cols="67" rows="10" class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="board_file">파일 첨부</label>
			<label for="upfile">
				<img src="image/attach.png" alt="사막"></label>
		</div>
		<div class="form-group">
			<button type=submit class="btn btn-primary">등록</button>
			<button type=reset class="btn btn-danger">취소</button>
		</div>
	</form>
</div>
</body>
</html>