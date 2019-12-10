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
<title>관리자페이지:게시판관리</title>
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
h1{
	font-size: 1.5rem;
	text-align: center;
	color: #27AE60;
}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	$("button").click(function(){
		location.href="NoticeWrite.bo";
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
<h1><strong>공지사항 게시글 목록</strong></h1><br><br>

	<%--게시글이 있는 경우 --%>
	<c:if test="${listcount>0 }">
		<table class="table table-striped">
			<tr>
				<th width="8%"><div>번호</div></th>
				<th width="50%"><div>제목</div></th>
				<th width="14%"><div>작성자</div></th>
				<th width="17%"><div>날짜</div></th>
			</tr>
			<c:set var="num" value="${listcount-(page-1)*10 }"/>
			<c:forEach var="b" items="${noticelist }">
			<tr>
				<td>
				<c:out value="${num }"/><%--num 출력 --%>
				<c:set var="num" value="${num-1 }"/><%--num=num-1;의미 --%>
				</td>
				<td>
					<div>
			
						<a href="NoticeDetailAction.bo?num=${b.NOTICE_NUMBER }">
							${b.NOTICE_SUBJECT }
						</a>
					</div>
					</td>
					<td>
						<div>${b.NOTICE_NAME }</div>
					</td>
					<td>
						<div>${b.NOTICE_DATE }</div>
					</td>
					
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
								<a href="NoticeList.bo?page=${page-1 }"
									class="page-link">이전</a>&nbsp;
							</li>
						</c:if>
						<c:forEach var="a" begin="${startpage }" end="${endpage }">
							<c:if test="${a==page }">
								<li class="page-item">
									<a class="page-link" href="#">${a }</a>
								</li>
							</c:if>
							<c:if test="${a!=page }">
								<li class="page-item">
									<a href="NoticeList.bo?page=${a }"
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
								<a href="NoticeList.bo?page=${page+1 }"
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
	<button type="button" class="btn btn-info float-right">글쓰기</button>
	</div>
</div>
</body>
</html>