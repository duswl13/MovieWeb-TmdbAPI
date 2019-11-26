<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<style>

* {
	margin: 0 auto
}

body {
	background: #141414;
	color: white;
}

tr.center-block {
	text-align: center
}

h1 {
	font-size: 1.5rem;
	color: CadetBlue
}

.container {
	width: 60%
}

label {
	font-weight: bold
}

#upfile {
	display: none
}

img {
	width: 200px;
}

button {
	width: 100px;
	height: 40px;
	background: CadetBlue;
	border: 0px;
	border-radius: 10px;
	font-size: 10pt;
	color: white;
}

button:hover {
	opacity: 60%
}

span {
	font-size: 8pt;
}

input {
	background: #141414;
	border: 1.5px dotted gray;
	border-radius: 10px;
	color: white;
	padding: 5px;
	margin: 5px;
}

textarea {
	background: #141414;
	border: 1.5px dotted white;
	border-radius: 10px;
	font-color: white;
	padding: 5px;
	margin: 5px;
}
</style>


</head>
<body>

<div class=container>
<table class="table table-striped">
<tr>
	<th colspan=2><h1>내가 쓴 리뷰 하나만 선택해서 보는 페이지</h1></th>
	<br>
</tr>	
<tr>
	<td><div>글쓴이</div></td> 
	<td><div> ${boarddata.BOARD_NAME }</div></td>
</tr>	
<tr>
	<td><div>제목</div></td> 
	<td><div> ${boarddata.BOARD_SUBJECT }</div></td>
</tr>	
<tr>
	<td><div>내용</div></td> 
	<td><textarea class=form-control rows=5 readOnly style=width:100%> ${boarddata.BOARD_CONTENT }</textarea>
</tr>	

<c:if test="${!empty boarddata.BOARD_FILE }">
<tr>
	<td><a href="BoardFileDown.bo?filename=${boarddata.BOARD_FILE }">${boarddata.BOARD_FILE}</a>
	</td>
</tr>
</c:if>	

<tr>
	<td colspan=2 class=center>
		<a href="BoardReplyView.bo?num${boarddata.BOARD_NUM }">
		<button>댓글</button></a>
	<c:if test="${boarddata.BOARD_NAME == id || id == 'admin'}">
		<a href="BoardModifyView.bo?num${boarddata.BOARD_NUM }">
		<button>수정</button></a>
		
		<a href="BoardDelete.bo?num${boarddata.BOARD_NUM }">
		<button>삭제</button></a>
	</c:if>
		<a href="BoardList.bo">
		<button>전체목록</button></a>	
	</td>	
</tr>
</table>
</div>

</body>
</html>