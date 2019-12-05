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
<title>관리자페이지:회원관리</title>
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

</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	$("tr>td:nth-child(3)>a").click(function(event){
		var answer=confirm("정말 삭제하시겠습니까?");
		console.log(answer);//취소를 클릭할 경우 -false
		if(!answer){	//취소를 클릭한 경우
			event.preventDefault();
		}
	})
})
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
<c:if test="${listcount>0 }">
	<table class="table table-striped">
		<thead>
			<tr>
			<th>회원정보 LIST</th>
			<th><font size=3>회원 수 :${listcount }</font></th>	
			</tr>
		</thead>	
		<tr>
				<td>아이디</td>
				<td>삭제</td>
		</tr>	
		<c:forEach var="m" items="${totallist }">
			<tr>
				<td><a href="user_info.ul?user_id=${m.USER_ID }">${m.USER_ID }</a></td>
				<td><a href="user_delete.ul?user_id=${m.USER_ID }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<div class="center-block">
			<div class="row">
				<div class="col">
					<ul class="pagination">
						<c:if test="${page<=1 }">
							<li class="page-item">
								<a class="page-link" href="#">이전&nbsp;</a>
							</li>
						</c:if>
						<c:if test="${page>1 }">
							<li class="page-item">
								<a href="user_list.ul?page=${page-1 }"
									class="page-link">이전</a>&nbsp;
							</li>
						</c:if>
						<c:forEach var="a" begin="${startpage }" end="${endpage }">
							<c:if test="${a==page }">
								<li class="page-item">
									<a class="page-link current" href="#">${a }</a>
								</li>
							</c:if>
							<c:if test="${a!=page }">
								<li class="page-item">
									<a href="user_list.ul?page=${a }"
									class="page-link">${a }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${page>=maxpage }">
							<li class="page-item">
								<a class="page-link" href="#">&nbsp;다음</a>
							</li>
						</c:if>
						<c:if test="${page<maxpage }">
							<li class="page-item">
								<a href="user_list.ul?page=${page+1 }"
								class="page-link">&nbsp;다음</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		</c:if>
	
	<!--게시글이 없는 경우 -->
	<c:if test="${listcount==0 }">
		<font size=5>등록된 글이 없습니다.</font>
	</c:if><br>
	</div>
</div>
</body>
</html>