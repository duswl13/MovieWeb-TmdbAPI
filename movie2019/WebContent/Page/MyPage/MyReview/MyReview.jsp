<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	boolean open = false;
	if (request.getParameter("open") != null) {
		open = Boolean.parseBoolean(request.getParameter("open"));
	}
%>
<title>마이페이지:내 리뷰 관리</title>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
b {
	color: yellow;
	padding-right: 50px;
}

font, h2, p {
	color: white;
}
</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/myreview.js" charset="UTF-8"></script>
<script>
$(function(){
	if(<%=open%>)
		document.getElementById("main").style.marginLeft = "250px";

});

</script>
</head>
<body style="background-color: black;">
	<%
		if (!open) {
	%>
	<jsp:include page="/Page/Navi/Navi.jsp" />
	<%
		} else {
	%>
	<jsp:include page="/Page/Navi/Navi3.jsp" />
	<%
		}
	%>
	<div id="main">
		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>
		<c:if test="${empty id}">
			<script>
		location.href = "<%=request.getContextPath()%>/Page/Login/login.jsp";
			</script>
		</c:if>


		<div class="container marketing">
			<c:if test="${listcount>0 }">
				<div class="row">
					<c:forEach var="m" items="${totallist }">
					<script>getPoster()</script>
					<input type="hidden" name="MOVIE_ID" value="${m.MOVIE_ID}">
						<div class="card mb-3" style="max-width: 31%;margin-right:20px;">
							<div class="row no-gutters" style="margin-left: 0px;">
								<div class="col-md-4">
									<img id="poster" src="" class="card-img">
								</div>
								<div class="col-md-7">
									<div class="card-body">
										<h5 class="card-title">${m.REVIEW_TITLE }</h5>
										<p class="card-text">
											<small class="text-muted">${m.REVIEW_CONTENT }</small>
										</p>
									</div>
								</div>
							</div>
							<a class="btn btn-default" href="moviedetail.ml?open=false&id=${m.MOVIE_ID}" role="button">영화정보보기
								&raquo;</a>
							<a class="btn btn-default" href="review_delete.mr?review_number=${m.REVIEW_NUMBER}" role="button">리뷰삭제
								&raquo;</a>
						</div>
						
					</c:forEach>

				</div>
			</c:if>


			<!--게시글이 없는 경우 -->
			<c:if test="${listcount==0 }">
				<font size=5>내가 작성한 리뷰가 없습니다.</font>
			</c:if>
			<br>

		</div>
	</div>
</body>
</html>