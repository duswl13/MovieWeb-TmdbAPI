<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>

<style>
tr.center-block{text-align:center}
h1{font-size:1.5rem;text-align:center;color:#1a92b9}
.container{width:60%}
label{font-weight:bold}
img{width:20px}

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
	<form action="FAQAddAction.fa" method="post" name="faqform">
		<h1>FAQ</h1>
		<div class="form-group">
			<label for="faq_name">글쓴이</label>
			<input name="FAQ_NAME" id="faq_name" value="${id }" readOnly type="text" size="10" maxlength="30"
					class="form-control" placeholder="Enter faq_name">
		</div>
		<div class="form-group">
			<label for="faq_subject">제목</label>
			<textarea name="FAQ_SUBJECT" id="faq_subject" cols="67" rows="1" class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="faq_content">내용</label>
			<textarea name="FAQ_CONTENT" id="faq_content" cols="67" rows="10" class="form-control"></textarea>
		</div>
		<div class="form-group">
			<button type=submit class="btn btn-primary">등록</button>
			<button type=reset class="btn btn-danger">취소</button>
		</div>
	</form>
</div>
</div>
</body>
</html>