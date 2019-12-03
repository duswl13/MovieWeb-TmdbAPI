<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
tr.center-block{text-align:center}
h1{font-size:1.5rem;text-align:center;color:#27AE60}
.container{width:60%}
label{font-weight:bold}
img{width:20px}

</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>
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
	<form action="FAQModifyAction.fa" method="post" 
	name="modifyform">
	<input type="hidden" name="FAQ_NUMBER" value="${faq.FAQ_NUMBER }">
		<h1>FAQ 수정</h1>
		<div class="form-group">
			<label for="faq_name">글쓴이</label>
			<input name="FAQ_NAME" id="faq_name" value="${faq.FAQ_NAME }" readOnly type="text"
					class="form-control">
		</div>
		<div class="form-group">
			<label for="faq_subject">제목</label>
			<input name="FAQ_SUBJECT" id="faq_subject" type="text" 
			value="${faq.FAQ_SUBJECT }" class="form-control" maxlength="100" value="${faq.FAQ_SUBJECT }">
		</div>
		<div class="form-group">
			<label for="faq_content">내용</label>
			<textarea name="FAQ_CONTENT" id="faq_content" rows="10" class="form-control">${faq.FAQ_CONTENT }</textarea>
		</div>
		
		<div class="form-group">
			<button type=submit class="btn btn-primary">수정</button>
			<button type=reset class="btn btn-danger"onClick="history.go(-1)">취소</button>
		</div>
	</form>
</div>
</div>
</body>
</html>