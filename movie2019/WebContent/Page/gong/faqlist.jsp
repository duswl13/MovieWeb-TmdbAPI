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
<script type="text/javascript">
	$(function() {
		$("#oclick1").click(function(){
			$("#divresult1").slideToggle('midle');});		
			$("#oclick2").click(function(){
				$("#divresult2").slideToggle('midle');});			
				$("#oclick3").click(function(){
					$("#divresult3").slideToggle('midle');});				
						$("#oclick4").click(function(){
							$("#divresult4").slideToggle('midle');});
							$("#oclick5").click(function(){
								$("#divresult5").slideToggle('midle');});
								$("#oclick6").click(function(){
									$("#divresult6").slideToggle('midle');});
									$("#oclick7").click(function(){
										$("#divresult7").slideToggle('midle');});
										$("#oclick8").click(function(){
											$("#divresult8").slideToggle('midle');});
											$("#oclick9").click(function(){
												$("#divresult9").slideToggle('midle');});
												$("#oclick10").click(function(){
													$("#divresult10").slideToggle('midle');});
		
	});
</script>
</head>
<body>


	<table border="1" width="500px">
		<tr>
			<th>타이틀</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="row" items="${list}" varStatus="status">
			<tr>
				<td id="oclick${status.count }">${row.FAQ_SUBJECT }</td>			
				<td>${row.FAQ_DATE }</td>
			</tr>
			<tr>
			<td colspan="2"><div id="divresult${status.count }" style="display: none; text-align: center;">${row.FAQ_CONTENT }</div></td>
			</tr>
			
		</c:forEach>
	</table>
	<table width="500px">
	<tr>
	<td colspan="2">
	<c:if test="${current_page>1 }"><a href="#" onclick="flist('1')">[처음]</a></c:if>
	<c:if test="${current_block>1 }">
	<a href="#2" onclick="flist('${prev_page}')">[이전]</a>
	</c:if>
	<c:forEach var="page" begin="${block_start }" end="${block_end }">
	<!-- 현재페이지 하이퍼링크 제거 -->
	<c:if test="${page==current_page }">
	<span style="color: red;">[${page}]</span>
	</c:if>
	<!-- 현재페이지가 아니면 하이퍼링크 표시 -->
	<c:if test="${page!=current_page }">
	<a href="#1" onclick="flist('${page}')">[${page}]</a>
	</c:if>
	</c:forEach>
	<c:if test="${current_block<total_block }">
	<a href="#4" onclick="flist('${next_page}')">[다음]</a>
	</c:if>
	<c:if test="${current_page<total_page }">
	<a href="#5" onclick="flist('${total_page}')">[끝]</a>
	</c:if>
	</td>
	</tr>
	</table>
	
</body>
</html>