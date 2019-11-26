<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
img {width:200px;}
button { width:150px; height:50px; background:thistle; 
	border:0px; border-radius:10px; font-size:10pt; color:white;}
</style>

</head>

<body>

<!-- 게시판 수정 -->

<div class=container>
<form action=BoardModifyAction.bo method=post name=modifyform>
<input type=hidden name=BOARD_NUM value="${boarddata.BOARD_NUM}">
<h1>리뷰 수정</h1>

<div class=form-group>
<label for=board_name>닉네임/ID</label>
<input type=text value="${boarddata.BOARD_NAME}" readOnly
		class=form-control>
</div>

<div class=form-group>
<label for=board_subject>제목</label>
<input type=text name=BOARD_SUBJECT id=board_subject 
	maxlength=100 class=form_control value="${boarddata.BOARD_SUBJECT }">
</div>

<div class=form-group>
<label for=board_content>내용</label>
<textarea name=BOARD_CONTENT id=board_content 
		cols=67 rows=10 class=form-control >${boarddata.BOARD_CONTENT }</textarea>
</div>

<!-- 파일이 첨부돼있으면 -->
<c:if test="${!empty boarddata.BOARD_FILE }">
<div class=form-group>
<label for=board_file>파일 첨부</label>
<div class=form-control>
	&nbsp;&nbsp;${boarddata.BOARD_FILE}</div>
</div>
</c:if>

<div class=form-group>
<label for=board_pass>비밀번호</label>
<input name=BOARD_PASS id=board_pass value=""
		type=password size=10 maxlength=30 class=form-control
		placeholder="Enter board_pass">
</div>

<div class=form-group>
<button type=submit>등록</button>
<button type=reset onClick="history.go(-1)">취소</button>
</div>

</form>
<!-- 게시판 수정 -->
</div>
</body>
</html>