<!-- 리뷰 클릭 시 첫 화면 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<style>
* {
	margin: 0px auto;
	padding: 0px;
}

body {

	background: #141414;
	font-family: montserrat, arial, verdana;
}

.main {100px;}
.pagination_div {
	display: flex;
	justify-content: center; /*가운데정렬*/
}

h2, h3 {
	color: #edf1f2
}

button {
	width: 100px;
	height: 40px;
	line-height: 30px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 3px;
	cursor: pointer;
	margin: 10px 5px;
}

button:hover {
	opacity: 50%;
}
</style>


</head>
<body>

	<!-- 메뉴 부분  <script>는 body 아래에-->
	<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>

<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>


	<div id="main">

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>

		<h2>지금 이 순간,</h2>
		<h3>보슈의 다른 회원들은 어떤 영화를 보고, 또 평가하고 있을까요?</h3>
		<div class=container>

			<%--게시글이 있는 경우 --%>
			<c:if test="${listcount > 0 }">
				<table class="table table-striped">

					<tr>
						<th width=8%><div>번호</div></th>
						<th width=50%><div>제목</div></th>
						<th width=14%><div>작성자</div></th>
						<th width=17%><div>날짜</div></th>

					</tr>
					<c:set var="num" value="${listcount-(page-1)*10}" />
					<c:forEach var="b" items="${reviewlist}">
						<tr>
							<td><c:out value="${num}" /> <%--num출력 --%> <c:set
									var="num" value="${num-1}" /> <%-- num=num-1; 의미 --%></td>
							<td>
								<div>
								
									<a href="ReviewDetailAction.rv?num=${b.REVIEW_NUMBER}">${b.REVIEW_SUBJECT}</a>
								</div>
							</td>
							<td>
								<div>${b.REVIEW_NAME }</div>
							</td>
							<td>
								<div>${b.REVIEW_DATE }</div>
							</td>
						
						</tr>
					</c:forEach>
				</table>

				<div class="pagination_div">
					<div class=row>
						<div class=col>
							<ul class=pagination>

								<c:if test="${page <= 1 }">
									<li class=page-item><a class=page-link href=#>이전&nbsp;</a>
									</li>
								</c:if>
								<c:if test="${page > 1 }">
									<li class=page-item><a class=page-link
										href="ReviewList.rv?page=${page-1}">이전&nbsp;</a></li>
								</c:if>

								<c:forEach var="a" begin="${startpage }" end="${endpage }">
									<c:if test="${a == page }">
										<li class=page-item><a class=page-link href=#>${a }</a></li>
									</c:if>
									<c:if test="${a != page }">
										<li class=page-item><a class=page-link
											href="ReviewList.rv?page=${a }">${a }</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${page >= maxpage }">
									<li class=page-item><a class=page-link href=#>&nbsp;다음</a>
									</li>
								</c:if>
								<c:if test="${page < maxpage }">
									<li class=page-item><a class=page-link
										href="ReviewList.rv?page=${page+1 }">&nbsp;다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>

				</div>
			</c:if>
		
			<!-- 게시글이 없는 경우 -->
			<c:if test="${listcount == 0 }">
				<font size=5>등록된 리뷰가 없습니다.</font>
			</c:if>
			<br> <br> <br> <br> <a href="review_write.jsp"><button
					type=button>내 리뷰쓰기</button></a>

		</div>
	</div>
	<!-- 추가... -->

<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
</body>
</html>