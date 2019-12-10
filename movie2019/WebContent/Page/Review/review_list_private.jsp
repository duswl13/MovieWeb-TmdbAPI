<!-- 내 리뷰 모아 보기 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
* {
	margin: 0px auto;
	padding: 0px;
}

body {
	background: #141414;
	font-family: montserrat, arial, verdana;
	color: #141414;
}

.prvlist {
	font-family: "Montserrat", sans-serif;
	font-weight: 300;
}

.prvlist h1, .prvlist h2, .prvlist h3, .prvlist h4, .prvlist h5,
	.prvlist h6 {
	color: #3e4555;
}

.prvlist .bg-white {
	background-color: white !important;
}

.prvlist .subtitle {
	color: #8d97ad;
	line-height: 24px;
}

/*칼럼 위치*/
.prvlist .col {
	margin-top: 60px;
	margin-left: 250px;
}

/*표정 위치*/
.prvlist .col .icon-space {
	margin: -55px 620 20px;
}

.prvlist .col .icon-space .icon-round {
	font-size: 45px;
	color: #ffffff;
}

.prvlist .bg-success-gradiant {
	background: #2cdd9b;
	background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b
		0%, #1dc8cc 100%);
	background: -webkit-gradient(linear, left top, right top, from(#2cdd9b),
		to(#1dc8cc));
	background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

/*표정 크기*/
.prvlist .icon-round {
	width: 35px;
	line-height: 35px;
}

.prvlist .btn-success-gradiant {
	background: #2cdd9b;
	background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b
		0%, #1dc8cc 100%);
	background: -webkit-gradient(linear, left top, right top, from(#2cdd9b),
		to(#1dc8cc));
	background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.prvlist .btn-success-gradiant:hover {
	background: #1dc8cc;
	background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc
		0%, #2cdd9b 100%);
	background: -webkit-gradient(linear, left top, right top, from(#1dc8cc),
		to(#2cdd9b));
	background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);
}

.prvlist .btn-md {
	padding: 15px 45px;
	font-size: 16px;
}

/*칼럼크기*/
.mb-4, .my-4 {
	margin-bottom: 1.5rem !important;
	width: 700px;
	height: 250px;
	padding: 10px;
}

.content {
	width: 580px;
	height: 200px;
	margin: 15px;
}

/*폰트*/
.prvlist .mvtitle {
	font-weight: bold;
	color: #2cdd9b;
	text-align: right;
}

.prvtitle {
	font-size: 10pt;
	font-weight: bold;
}

.prvcontent {
	font-size: 9pt;
}

#rvModal tr .rvtr {
	text-align: center
}

#rvModal td .rvtd {
	padding: 10px;
}

button {
	width: 150px;
	height: 40px;
	line-height: 40px;
	padding: 0px;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 3px;
	cursor: pointer;
	margin: 10px 5px;
}

#rvModal .btn-gradiant {
	background: #2cdd9b;
	background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b
		0%, #1dc8cc 100%);
	background: -webkit-gradient(linear, left top, right top, from(#2cdd9b),
		to(#1dc8cc));
	background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

#rvModal .btn-gradiant:hover {
	background: #1dc8cc;
	background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc
		0%, #2cdd9b 100%);
	background: -webkit-gradient(linear, left top, right top, from(#1dc8cc),
		to(#2cdd9b));
	background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);
}

#rvModal span {
	font-size: 8pt;
}

#rvModal input {
	background: #edf1f2;
	border: 0px solid SteelBlue;
	border-radius: 0px;
	color: #141414;
	font-size: 9pt;
	padding: 5px;
	margin: 5px;
}

#rvModal textarea {
	width: 90%;
	background: #edf1f2;
	border: 0px solid SteelBlue;
	border-radius: 0px;
	color: #141414;
	font-size: 10pt;
	padding: 5px;
	margin: 5px;
}

#rvModal .title {
	color: #27AE60
} /**/
#rvModal .bg-gradiant {
	background: #1dc8cc;
	background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc
		0%, #2cdd9b 100%);
	background: -webkit-gradient(linear, left top, right top, from(#1dc8cc),
		to(#2cdd9b));
	background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);
}

#rvModal .bg-gradiant:hover {
	background: #2cdd9b;
	background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b
		0%, #1dc8cc 100%);
	background: -webkit-gradient(linear, left top, right top, from(#2cdd9b),
		to(#1dc8cc));
	background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.button-gradiant {
	color: white;
	background: #1dc8cc;
	background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc
		0%, #2cdd9b 100%);
	background: -webkit-gradient(linear, left top, right top, from(#1dc8cc),
		to(#2cdd9b));
	background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
	background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);
}

.button-gradiant:hover {
	background: #2cdd9b;
	background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b
		0%, #1dc8cc 100%);
	background: -webkit-gradient(linear, left top, right top, from(#2cdd9b),
		to(#1dc8cc));
	background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
	background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

button {
	width: 100px;
	font-size: 12pt;
}

#rvModal .floatright {
	float: right;
	padding: 0px;
	margin-top: -20px;
}

#rvModal .reviewarea {
	right: clear;
}

div .rvsubmit {
	text-align: center;
}

/* modal position(center)*/
.modal {
	text-align: center;
}

@
@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

#rvModal .modal-content {
	margin-top: 160px;
	margin-left: auto;
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

		<h2></h2>

		<br>
		<div class="prvlist">
			<div class="container">

				<!-- Row  -->
				<div class="row">


					<c:forEach items="${reviewlist }" var="item">
						<!-- Column -->
						<div class="col-md-4 col">
							<div class="card card-shadow border-0 mb-4">
								<div class="p-4">
									<div class="icon-space">
										<c:choose>
											<c:when test="${item.FACE == 1}">
												<img src="<%=request.getContextPath()%>/Png/happy1.svg"
													class="icon-round bg-white display-5 rounded-circle">
											</c:when>
											<c:otherwise>
												<img src="<%=request.getContextPath()%>/Png/neutral.svg"
													class="icon-round bg-white display-5 rounded-circle">
											</c:otherwise>
										</c:choose>

									</div>
									<div class=content>
										<input id="Movie_h" type="hidden" value="${item.MOVIE_ID }">
										<h6 class="mvtitle">${item.MOVIE_NAME}</h6>
										<p class="prvtitle">${item.REVIEW_TITLE}</p>
										<p class=prvcontent>${item.REVIEW_CONTENT}</p>
										<p class=prvdate>${item.REVIEW_DATE}</p>

										<c:choose>
											<c:when test="${item.STAR == 1}">
												<p>★☆☆☆☆</p>
											</c:when>
											<c:when test="${item.STAR == 2}">
												<p>★★☆☆☆</p>
											</c:when>
											<c:when test="${item.STAR == 3}">
												<p>★★★☆☆</p>
											</c:when>
											<c:when test="${item.STAR == 4}">
												<p>★★★★☆</p>
											</c:when>
											<c:when test="${item.STAR == 5}">
												<p>★★★★★</p>
											</c:when>

										</c:choose>


										<a href="#"> <!-- 이 부분 #으로 해야 모달 뒤에 깔리는 배경이 나옴 -->

											<button class="button-gradiant" data-toggle="modal"
												data-target="#rvModal">수정 / 삭제</button> <%-- 	<button type="submit" class="button-gradiant" value="modify" data-toggle="modal" data-target="#rvModal"
                   						 onclick="javascript: action='<%=request.getContextPath() %>/Reviewdetail.rv?movieId=${vo.movie_id}';">	
                    
												수정 · 삭제</button> --%>

										</a>
										<!-- 여기까지 모달 뜨는 버튼 -->


									</div>
									<!-- content end -->
								</div>
							</div>
						</div>
						<br>
						<br>
						<br>
					</c:forEach>



					<div class="col-md-12 mt-3 text-center">
						<a class="btn btn-success-gradiant text-white border-0 btn-md"><span>더보기</span></a>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- 추가... -->

	<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";

var page = ${page};
var maxpage = ${maxpage};

more();

function more(){
if(page == maxpage){
	$('.btn-success-gradiant').css('display','none');
}else{
	$('.btn-success-gradiant').css('display','block');
}
}

$('.btn-success-gradiant').click(function(){
	console.log('aa');
	$.ajax({
		url : "ReviewPrivateList.rv",
		data : {
			"page" :++page,
			"state" : "ajax"
		},
		success : function(data) {
			var obj = JSON.parse(data);
			
			page = obj.page;
			maxpage = obj.maxpage;
			var list = obj.reviewlist;
			
			print(list);
			more();
		
		},
		error : function(err) {
			console.log("페이지가 더이상없습니다");
		}

	});//ajax
});

//내리뷰 수정삭제 모달
$(".button-gradiant").click(function () {
	console.log($("#Movie_h").val());
	$.ajax({
		url : "Reviewdetail.rv",
		type: 'POST',
		data : {
			"Movie_h" :$("#Movie_h").val(),		
		},
		success : function(data) {
			$("#rvModal").html("");
			$("#rvModal").html(data);
		
		},
		error : function(err) {
			console.log("오류");
		}

	});
	
})


function print(list){
	
	var text = "";
	
	for(var i = 0; i < list.length; i++){
		text += '<div class="col-md-4 col">';
		text += '<div class="card card-shadow border-0 mb-4">';
		text += '<div class="p-4">';
		text +=  '<div class="icon-space">';
		
		if(list[i].face == 1)
        text += '<img src="<%=request.getContextPath()%>/Png/happy1.svg" class="icon-round bg-white display-5 rounded-circle">';
        else
        text += '<img src="<%=request.getContextPath()%>
		/Png/neutral.svg" class="icon-round bg-white display-5 rounded-circle">';

				text += '</div>';
				text += ' <div class=content>';
				text += ' <h6 class="mvtitle">' + list[i].MOVIE_NAME + '</h6>';
				text += ' <p class="prvtitle">' + list[i].REVIEW_TITLE + '</p>';
				text += ' <p class=prvcontent>' + list[i].REVIEW_CONTENT
						+ '</p>';
				text += ' <p class=prvdate>' + list[i].REVIEW_DATE + '</p>';

				switch (list[i].STAR) {
				case 1:
					text += '  <p>★☆☆☆☆</p>';
					break;
				case 2:
					text += '  <p>★★☆☆☆</p>';
					break;
				case 3:
					text += '  <p>★★★☆☆</p>';
					break;
				case 4:
					text += '  <p>★★★★☆</p>';
					break;
				case 5:
					text += '  <p>★★★★★</p>';
					break;

				}

				text += '</div></div></div></div><br><br><br>';
			}

			$('.row').append(text);

		}
	</script>

	<div class="modal" id="rvModal"></div>
</body>
</html>