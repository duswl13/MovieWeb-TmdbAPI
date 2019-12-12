<!-- 회원 아이디 클릭 시 리뷰 모아보기 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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

a {
	color: #1dc8cc;
	text-decoration: none;
}

a:hover {
	color: #2cdd9b;
	text-decoration: none;
}

.readme {
	color: #edf1f2;
	margin-left: 150px;
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
	margin-bottom: 35;
}

/*표정 위치*/
.prvlist .col .icon-space {
	margin: -55px 560 30px;
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
.mb-4, .my-4, .p-4 {
	width: 650px;
	height: 340;
	padding: 15px;
}

.content {
	width: 580px;
	height: 200px;
	margin: 20px;
}

/*폰트*/
.prvlist .mvtitle {
	font-weight: bold;
	color: #2cdd9b;
	text-align: right;
	margin-bottom: 3;
}

.prvtitle {
	font-size: 10pt;
	font-weight: bold;
}

.prvcontent {
	width: 510;
	height: 75px;
	font-size: 9pt;
	clear: both;
}

#rvModal tr .rvtr {
	text-align: center
}

#rvModal td .rvtd {
	padding: 10px;
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

button {
	width: 100px;
	height: 35px;
	line-height: 35px;
	padding: 0px;
	font-size: 12pt;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 3px;
	cursor: pointer;
	margin: 10px 5px;
}

/*버튼*/
.rvdetailbtn {
	padding: 0px;
	margin: 0px;
}

.morebtn {
	width: 300px;
	padding: 15px 45px;
	font-size: 16px;
	font-weight: bold;
}

.likescore {
	font-size: 10pt;
}

.content {
	width: 500px;
	height: 220px;
	margin-top: 20px;
	margin-left: 42px;
}

.floatright {
	float: right
}

.star .floatright {
	color: #141414
}

.prvdate {
	font-size: 10pt;
}

.float {
	float: left
}

.smaller {
	font-size: 10pt;
}

.userid {font-size: 10pt; font-weight:bold; color:#1dc8cc;}

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

<c:forEach var="r" items="${reviewlist}" varStatus="status">
<c:if test = "${status.count==1}" >
		<h2 class=readme>VOSHU 회원  <b class=titlebold>${r.USER_ID}</b>님이 남긴 리뷰 리스트</h2>
		<p class=readme style="font-size:11pt;">영화 제목을 클릭하면 상세 정보를 볼 수 있어요.</p>
</c:if>
</c:forEach>


		<br>
<!-- 글이 있는 경우 -->
		<c:if test="${listcount > 0 }">


			<div class="prvlist">
				<div class="container">
					<div class="modal" id="rvModal"></div>
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
											<input id="PriRvContent" class="PriRvContent"
												name="PriRvContent" type="hidden" value="${item.MOVIE_ID }">
											<h6 class="mvtitle">
												<a href="moviedetail.ml?open=false&id=${item.MOVIE_ID}">${item.MOVIE_NAME}</a>
											</h6>
											<c:choose>
												<c:when test="${item.STAR == 1}">
													<p class="star floatright">★☆☆☆☆</p>
												</c:when>
												<c:when test="${item.STAR == 2}">
													<p class="star floatright">★★☆☆☆</p>
												</c:when>
												<c:when test="${item.STAR == 3}">
													<p class="star floatright">★★★☆☆</p>
												</c:when>
												<c:when test="${item.STAR == 4}">
													<p class="star floatright">★★★★☆</p>
												</c:when>
												<c:when test="${item.STAR == 5}">
													<p class="star floatright">★★★★★</p>
												</c:when>
											</c:choose>

											<p class="prvtitle float">${item.REVIEW_TITLE}</p>
											<p class=prvcontent>${item.REVIEW_CONTENT}</p>
											<p class="prvdate floatright">${item.REVIEW_DATE}</p>
											

											<br> <br>

											<p class="like float"
													Onclick='addLike("${item.USER_ID}","${item.MOVIE_ID}")'> <c:choose>
														<c:when test="${item.LIKECHECK == 1 }">
															<img class="like_img" 
																src="<%=request.getContextPath()%>/Png/like_up.svg"
																style="width: 15px; height: 15px;">
														</c:when>
														<c:otherwise>
															<img class="like_img"
																src="<%=request.getContextPath()%>/Png/like_default.svg"
																style="width: 15px; height: 15px;">
														</c:otherwise>
													</c:choose><span class="like_count" style="font-size:8pt">${item.LIKE }</span>
												</p>
											<p class="rvbottom1 floatright userid">
													${item.USER_ID}
											</p>
										</div>
										<!-- content end -->
									</div>
								</div>
							</div>
							<br>
							<br>
							<br>
						</c:forEach>

					</div>

					<br>
					<div class="col-md-12 mt-3 text-center">
						<a
							class="btn btn-success-gradiant text-white border-0 btn-md morebtn"><span>더보기</span></a>
					</div>
					<br> <br> <br>
				</div>

			</div>
		</c:if>

		<!-- 게시글이 없는 경우 -->
		<c:if test="${listcount == 0 }">
			<h3 class=readme>등록된 리뷰가 없습니다.</h3>
		</c:if>
</div>
	<!-- 추가... -->

<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


var click = 0;
$('.like').click(function(){
	click = $('.like').index(this);
});

function addLike(userID,movieID){
	
	$.ajax({
		url : "LikeAction.rv",
		data : {"likeId": userID,
				"movieId": movieID},
		success : function(data){
				if(data == 0){
				alert("좋아요 실패");
				}else if(data == 1){
				$('.like_img:eq('+click+')').prop('src',"<%=request.getContextPath()%>/Png/like_up.svg");
				$('.like_count:eq('+click+')').text(Number($('.like_count:eq('+click+')').text())+1);
				}else if(data == -1){
				alert("좋아요는 한 번만 누를 수 있습니다.");
				}else{
				alert("로그인한 회원만 좋아요 할 수 있습니다.");
				location.href='<%=request.getContextPath()%>/Page/Login/login.jsp';
							}
						},
						error : function() {
							alert("error");
						}
					});
		}
		
var userId= "${userId}";

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
		url : "ReviewUserList.rv",
		data : {
			"userId" : userId,
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

function print(list){
	   
	   var text = "";
	   
	   for(var i = 0; i < list.length; i++){
	      text += '<div class="col-md-4 col">';
	      text += '<div class="card card-shadow border-0 mb-4">';
	      text += '<div class="p-4">';
	      text +=  '<div class="icon-space">';
	      
	      if(list[i].FACE == 1)
	        text += '<img src="<%=request.getContextPath()%>/Png/happy1.svg" class="icon-round bg-white display-5 rounded-circle">';
	        else
	        text += '<img src="<%=request.getContextPath()%>/Png/neutral.svg" class="icon-round bg-white display-5 rounded-circle">';

					text += '</div>';
					text += ' <div class=content>';
					text += ' <input id="PriRvContent" class="PriRvContent" name="PriRvContent" type="hidden" value='+list[i].MOVIE_ID+'>';
					text += ' <h6 class="mvtitle">' + list[i].MOVIE_NAME + '</h6>';
					
					switch (list[i].STAR) {
					case 1:
						text += '  <p class="star floatright">★☆☆☆☆</p>';
						break;
					case 2:
						text += '  <p class="star floatright">★★☆☆☆</p>';
						break;
					case 3:
						text += '  <p class="star floatright">★★★☆☆</p>';
						break;
					case 4:
						text += '  <p class="star floatright">★★★★☆</p>';
						break;
					case 5:
						text += '  <p class="star floatright">★★★★★</p>';
						break;

					}
							
					text += ' <p class="prvtitle float">' + list[i].REVIEW_TITLE + '</p>';
					text += ' <p class=prvcontent>' + list[i].REVIEW_CONTENT
							+ '</p>';
					text += ' <p class="prvdate floatright">' + list[i].REVIEW_DATE + '</p>'+ '<br> <br>';
        			text += '<h5>'+ list[i].LIKE +'</h5>';

        			
					text += '<p class="rvbottom1 floatright userid">' + list[i].USER_ID + '</p>';
        			
					text +='</div></div></div></div><br><br><br>';
	}
	
	$('.row').append( text);
	
}
</script>
</body>
</html>