<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>
<title>마이페이지:숨긴 컨텐츠</title>
<style>
b {
	color: black;
	padding-right:50px;
	font-size: 15px;
}
tr{
	width:100%;
}

table, td {
	border-bottom: 1px solid #dee2e6;
	border-collapse: collapse;
}

.center-block{
	display:flex;
	justify-content:center;	/* 가운데 정렬 */
}

.table-striped tbody tr:nth-of-type(odd){
	background : black;
	color : white;
}
div, td, a, .page-link{
	color:white;
}
table, td {
	border-bottom : none;
}
.btn-info {
	background-color:#27AE60;
	margin-bottom : 50px;
	boder-color:#27AE60;
}

font{
	color:white;
}
#detail{
	background : #27AE60;
	border : 1px solid green;
	border-radius:10px;
	font-size: 9px;
    margin-left: 10px;
}
h1{
	font-size: 1.5rem;
	text-align: center;
	color: #27AE60;
}
#left{
	width:55%;
	padding-left:50px;
}

#right{
	width:40%;
	text-align: center;
}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

$(function(){
	if(<%=open%>)
		document.getElementById("main").style.marginLeft = "250px";

});

</script>
</head>
<body>
<body style="background-color:black;">
<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>

<div id="main">
      <span style="font-size: 30px; cursor: pointer; color: #27AE60;"
         onclick="openNav()">&#9776;</span>
         
<c:if test="${empty id}">       
	<script>
		location.href = "<%=request.getContextPath()%>/Page/Login/login.jsp";
	</script>
</c:if>

<div class="container">
<h1><strong>숨긴 영화 목록</strong></h1><br><br>
<c:if test="${listcount>0 }">
	<table class="table table-striped">	
		<tr>
				<td id="left"><strong>숨긴 영화 목록</strong></td>
				<td id="right"><strong>다시 보이기</strong></td>
		</tr>	
		<c:forEach var="m" items="${totallist }">
			<tr>
				<td id="left">${m.MOVIE_NAME }<span id="detail"><a href="moviedetail.ml?open=false&id=${m.MOVIE_ID}">상세보기</a></span></td>
				<td id="right"><a href="hidden_delete.mh?user_id=${m.USER_ID }&movie_id=${m.MOVIE_ID}">해제</a></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
		
	<!--게시글이 없는 경우 -->
	<c:if test="${listcount==0 }">
		<font size=5>숨긴 영화가 없습니다.</font>
	</c:if><br>
	</div>
</div>
</body>
</html>