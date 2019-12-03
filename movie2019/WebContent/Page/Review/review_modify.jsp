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
<form action=ReviewModifyAction.rv method=post name=modifyform>
<input type=hidden name=REVIEW_NUMBER value="${reveiwvo.REVIEW_NUMBER}">
<h1>리뷰 수정</h1>

<div class=form-group>
<label for=review_name>닉네임/ID</label>
<input type=text value="${reviewdata.review_NAME}" readOnly
		class=form-control>
</div>

<div class=form-group>
<label for=review_subject>제목</label>
<input type=text name=review_SUBJECT id=review_subject 
	maxlength=100 class=form_control value="${reviewvo.review_SUBJECT }">
</div>

<div class=form-group>
<label for=review_content>리뷰 내용</label>
<textarea name=review_CONTENT id=review_content 
		cols=67 rows=10 class=form-control >${reviewvo.review_CONTENT }</textarea>
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