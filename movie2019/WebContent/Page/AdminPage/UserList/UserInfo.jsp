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
<title>관리자페이지:회원상세보기</title>
<style>
body{
	background:white;
}
b {
	color: black;
	padding-right:50px;
	font-size: 15px;
}
tr{
	width:100%;
}
td{
	padding:4px;
}
button{
	width:100%;
}
#replace{
	padding-bottom:50px;
}
#btn3{
	width:50px;
}

table, td {
	border-bottom: 1px solid black;
	border-collapse: collapse;
}
.container-fluid{
	color:green;
    text-shadow:
    -1px -1px 0 grey,
    1px -1px 0 grey,
    -1px 1px 0 grey,
    1px 1px 0 grey;
}
.center-block{
	display:flex;
	justify-content:center;	/* 가운데 정렬 */
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
.btn-info {
	background-color:#27AE60;
	margin-bottom : 50px;
	boder-color:#27AE60;
}
#tbl caption{
	caption-side:top;
	font-size:14pt;font-weight:bold;margin:0.5em;
	text-align:center;
}
h1{
	font-size: 1.5rem;
	text-align: center;
	color: #27AE60;
}
#left{
	width:50%;
	text-align: center;
}

#right{
	width:50%;
	padding-left:100px;
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
<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>
<div id="main">
      <span style="font-size: 30px; cursor: pointer; color: #27AE60;"
         onclick="openNav()">&#9776;</span>
<div class="container">
<h1><strong>회원 정보 상세보기</strong></h1><br><br>

	<table id=tbl class="table table-striped">
		<c:set var="u" value="${userinfo }"/>		
			<tr><td id="left">아이디</td><td id="right">${u.USER_ID }</td></tr>
			<tr><td id="left">비밀번호</td><td id="right">${u.USER_PASS }</td></tr>
			<tr><td id="left">이메일주소</td><td id="right">${u.USER_EMAIL }</td></tr>
			<tr><td id="left">가입일자</td><td id="right">${u.USER_JOIN_DATE }</td></tr>
			<tr><td id="left">핸드폰번호</td><td id="right">${u.USER_PHONE }</td></tr>
			<tr><td id="left">관리자유무</td><td id="right">${u.USER_TYPE }</td></tr>
			<tr style="text-align: center;"><td colspan=2><a href="user_list.ul">리스트로 돌아가기</a></td></tr>
		</table>
</div>
</div>
</body>
</html>