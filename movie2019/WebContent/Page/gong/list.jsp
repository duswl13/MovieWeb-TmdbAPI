<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
color: white;
}
</style>
</head>
<body>


	<table border="1" width="500px">
		<tr>
			<th>타이틀</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.title }</td>
				<td>${row.content }</td>
				<td>${row.gong_date }</td>
			</tr>
		</c:forEach>
	</table>
	<table width="500px">
	<tr>
	<td colspan="2">
	<c:if test="${current_page>1 }"><a href="#" onclick="list('1')">[처음]</a></c:if>
	<c:if test="${current_block>1 }">
	<a href="#2" onclick="list('${prev_page}')">[이전]</a>
	</c:if>
	<c:forEach var="page" begin="${block_start }" end="${block_end }">
	<!-- 현재페이지 하이퍼링크 제거 -->
	<c:if test="${page==current_page }">
	<span style="color: red;">[${page}]</span>
	</c:if>
	<!-- 현재페이지가 아니면 하이퍼링크 표시 -->
	<c:if test="${page!=current_page }">
	<a href="#1" onclick="list('${page}')">[${page}]</a>
	</c:if>
	</c:forEach>
	<c:if test="${current_block<total_block }">
	<a href="#4" onclick="list('${next_page}')">[다음]</a>
	</c:if>
	<c:if test="${current_page<total_page }">
	<a href="#5" onclick="list('${total_page}')">[끝]</a>
	</c:if>
	</td>
	</tr>
	</table>
	
</body>
</html>