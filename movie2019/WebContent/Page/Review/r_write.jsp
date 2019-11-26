<%--https://cloudstudying.kr/lectures/236 별점 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="js/writeform.js" charset="UTF-8"></script>

<style>
tr.center-block {text-align:center}
h1 {font-size:1.5rem; text-align:center; color:CadetBlue}
.container {width:60%}
label {font-weight:bold}
#upfile {display:none}
button { width:100px; height:30px; background:thistle; 
	border:0px; border-radius:10px; font-size:10pt; color:white;}
span {font-size:8pt;}
</style>

</head>
<body>

<div class=container>
<form action=BoardAddAction.bo method=post 
		enctype=multipart/form-data name=boardform>

<h1>내가 본 영화 리뷰 쓰기</h1>

<div class=form-group>
<label for=board_name>글쓴이</label>
<input name=BOARD_NAME id=board_name value="${id}" readOnly
		type=text size=10 maxlength=30 class=form-control
		placeholder="Enter board_name">
</div>

<div class=form-group>
<label for=board_pass>비밀번호</label>
<input name=BOARD_PASS id=board_pass value=""
		type=password size=10 maxlength=30 class=form-control
		placeholder="Enter board_pass">
</div>

<div class=form-group>
<label for=board_subject>제목</label>
<input name=BOARD_SUBJECT id=board_subject value=""
		type=text size=10 maxlength=100 class=form-control
		placeholder="Enter board_subject">
</div>

<div class=form-group>
<label for=board_content>리뷰</label><br>
<textarea name=BOARD_CONTENT id=board_content 
		cols=50 rows=10 class=form-control></textarea>
</div>

<div class=form-group>
<label for=upfile><button>추억도 같이 첨부하기</button></label>
<input name=BOARD_FILE id=upfile type=file>
<span>티켓사진 같은 거... 아련...☆</span>
</div><br>

<div class=form-group>
<button type=submit>등록</button>
<button type=reset>취소</button>
</div>

</form>
</div>
</body>
</html>