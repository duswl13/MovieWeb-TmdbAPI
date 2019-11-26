<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
.navi ul{
	list-style: none;
	height: 40px;
	padding-top: 10px;
	padding-bottom: 5px;
}
.navi ul li {
	display: inline;
	float: left;
	font-size: 15px;
	padding: 10px;
	
	
}
body {
	background-color:white; 
}

</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {

	});//funtion
</script>
</head>
<body>
	<h3>공지</h3>
	<%-- 	<sql:setDataSource url="jdbc:oracle:thin:@localhost:1521/xe"
		driver="oracle.jdbc.OracleDriver" user="SCOTT" password="TIGER"
		var="ds1" scope="page" />
	<sql:query var="rs" dataSource="${ds1 }">
select title,content,date from gong
</sql:query> --%>
	<nav class="navi">
		<ul>
			<li><a href="#">★공지</a></li>
			<li><a href="#">★QNA?</a></li>
			<li><a href="#">★mail</a></li>
		</ul>
	</nav>
	<input id="search" value="${search }">
<input type="button" id="btnSearch" value="조회">
	
	

	<div class="gong">
		<%-- <table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>등록일</th>
			
		<tr>
			<c:forEach var="row" items="${rs.rows}" varStatus="status">
				<tr>
					<td>${status.count }</td>					
					<td>${row.title }</td>
					<td>${row.content }</td>
					<td>${row.date }</td>
				</tr>
			</c:forEach>
	</table> --%>
	</div>
</body>
</html>