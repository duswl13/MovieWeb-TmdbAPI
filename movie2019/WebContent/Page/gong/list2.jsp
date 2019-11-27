<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@include file="header.jsp" %>
<script type="text/javascript">
$(function() {
	$("#gong").click(function() {
		$("#result").html("");
		list("1");
	})
	$("#faq").click(function() {
		$("#result").html("");
		flist("1");
	})
	
	
	
	
	
});
//list("1"); //페이지로딩되고 1페이지부터시작임
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

function flist(curPage) {
	$.ajax({
		type:"post",
		url:"faq.gong",
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
<div onclick="gong" id="gong"><h3 style="color: blue;">공지</h3></div>
<div onclick="faq" id ="faq"><h3 style="color: red;">FAQ</h3></div>

<div id="result"></div>

</body>
</html>