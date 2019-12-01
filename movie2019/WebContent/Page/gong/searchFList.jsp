<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
 <jsp:include page="header.jsp"/>
<script type="text/javascript">
	$(function() {
		
		for(let a=1;a<11;a++)
		$("#oclick"+a).click(function(){
			$("#divresult"+a).slideToggle('midle');});		

	});
</script>
</head>
<body>


	<table border="1" width="500px">
		<tr>
			<th>제목</th>
			<th width="100px">날짜</th>
		</tr>
		<c:choose>
	<c:when test="${list eq '[]'}"><tr><td colspan="2" style="color: red;">검색결과가없습니다</td></tr></c:when>		
<c:otherwise>
		<c:forEach var="row" items="${list}" varStatus="status">
			<tr>
				<td id="oclick${status.count }">${row.FAQ_SUBJECT }</td>			
				<td>${row.FAQ_DATE }</td>
			</tr>
			<tr>
			<td colspan="2"><div id="divresult${status.count }" style="display: none; text-align: center;">${row.FAQ_CONTENT }</div></td>
			</tr>
			
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<table width="500px">
	<tr>
	<td colspan="2">
	<c:if test="${current_page>1 }"><a href="#" onclick="faqSearch('1')">[처음]</a></c:if>
	<c:if test="${current_block>1 }">
	<a href="#2" onclick="faqSearch('${prev_page}')">[이전]</a>
	</c:if>
	<c:forEach var="page" begin="${block_start }" end="${block_end }">
	<!-- 현재페이지 하이퍼링크 제거 -->
	<c:if test="${page==current_page }">
	<span style="color: red;">[${page}]</span>
	</c:if>
	<!-- 현재페이지가 아니면 하이퍼링크 표시 -->
	<c:if test="${page!=current_page }">
	<a href="#1" onclick="faqSearch('${page}')">[${page}]</a>
	</c:if>
	</c:forEach>
	<c:if test="${current_block<total_block }">
	<a href="#4" onclick="faqSearch('${next_page}')">[다음]</a>
	</c:if>
	<c:if test="${current_page<total_page }">
	<a href="#5" onclick="faqSearch('${total_page}')">[끝]</a>
	</c:if>
	</td>
	</tr>
	</table>
	
</body>
</html>