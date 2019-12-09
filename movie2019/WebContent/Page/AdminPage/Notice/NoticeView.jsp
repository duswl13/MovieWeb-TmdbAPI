<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
.center-block{
	display:flex;
	justify-content:center;	/* 가운데 정렬 */
}
body{
	background:white;
}

tr{
	width:100%;
}
td{
	padding:4px;
	background:white;
}
th{
	background:white;
}

#replace{
	padding-bottom:50px;
}

table, td {
	border-bottom: 1px solid black;
	border-collapse: collapse;
}

.table-striped tbody tr:nth-of-type(odd){
	background : white;
	color : black;
}
div, td, a, .page-link{
	color:black;
}
table, td {
	border-bottom : none;
}


</style>
<title>공지사항 게시판</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	if(<%=open%>)
		document.getElementById("main").style.marginLeft = "250px";

});

</script>
</head>
<body>
<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>
<div id="main">
      <span style="font-size: 30px; cursor: pointer; color: #27AE60;"
         onclick="openNav()">&#9776;</span>
<div class="container">
	<table class="table table-striped">
		<tr><th colspan="2"><strong>공지사항 게시글 상세보기</strong></th></tr>
		<tr><td>글쓴이</td>
			<td>${noticedata.NOTICE_NAME }</td></tr>
		<tr><td>제목</td>
			<td>${noticedata.NOTICE_SUBJECT }</td></tr>
		<tr><td>내용</td>
			<td><textarea  class="form-control" rows="5" readOnly style="width:102%">${noticedata.NOTICE_CONTENT }</textarea></td></tr>	
		<tr>
			<td colspan="2" class="center">
				<a href="NoticeModifyView.bo?num=${noticedata.NOTICE_NUMBER}" style="text-decoration:none;">
					<button class="btn btn-info" style="background:#27AE60;">수정</button>
				</a>
				<a href="NoticeDeleteAction.bo?num=${noticedata.NOTICE_NUMBER}" style="text-decoration:none;">
					<button class="btn btn-danger">삭제</button>
				</a>
				<a href="NoticeList.bo?">
					<button class="btn btn-primary">목록</button>
				</a>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>