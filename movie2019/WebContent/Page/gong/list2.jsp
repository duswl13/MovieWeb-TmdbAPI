<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@include file="header.jsp" %>
<script type="text/javascript">
$(function() {
	list("1"); //페이지로딩되고 1페이지부터시작임
	
})
function list(curPage) {
	$.ajax({
		type:"post",
		url:"gonglist.gong",
		data:{"curPage":curPage},
		success:function(result){
			$("#result").html(result);
			
		},error:function(err){
			alert("통신X");
		}
		
	});
	
}

</script>
<title>Insert title here</title>
</head>
<body>
<div><h3 style="color: blue;">되나</h3></div>

<h3>되나</h3>
<h3>되나</h3>
<h3>되나</h3>
<div id="result"></div>

</body>
</html>