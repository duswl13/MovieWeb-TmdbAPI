<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	boolean open = false;
	if (request.getParameter("open") != null) {
		open = Boolean.parseBoolean(request.getParameter("open"));
	}
%>
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
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="Page/Chu/Chu.css" type="text/css">

<script type="text/javascript">
	$(function() {
		if (
<%=open%>
	)
			document.getElementById("main").style.marginLeft = "250px";
		var currentPosition = parseInt($("#slidemenu").css("top"));
		$(window).scroll(function() { //현재창에서 스크롤 이벤트
			var position = $(window).scrollTop(); //스크롤 바에 위에

			$("#slidemenu").stop().animate({
				"top" : position + currentPosition + "px"
			}, 500);
		});

		$('.customer-logos').slick({
			slidesToShow : 6,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 1500,
			arrows : false,
			dots : false,
			pauseOnHover : false,
			responsive : [ {
				breakpoint : 768,
				settings : {
					slidesToShow : 4
				}
			}, {
				breakpoint : 520,
				settings : {
					slidesToShow : 3
				}
			} ]
		});

		$("#genAdd").click(function() {
			var rowlength = $(".col-md-4").length/20;
			console.log(rowlength);
			
			$.ajax({
				url : "listAdd.ch",
				type : "post",
				data : {
					"p" : (($(".col-md-4").length/20)+1)
				},
				success : function(data) {
					console.log(data);
					$(".row:last").append(data);

				},
				error : function(err) {
					alert("페이지가 더이상없습니다");
				}

			});//ajax

		});
	});//load
</script>
<style type="text/css">
/* 네모 */
.cta-100 {
	margin-top: 100px;
	padding-left: 8%;
	/* padding-top: 7%; */
}

.col-md-4 {
	padding-bottom: 20px;
}

.white {
	color: #fff !important;
}

.mt {
	float: left;
	margin-top: -20px;
	padding-top: 20px;
}

.bg-blue-ui {
	background-color: #708198 !important;
}

figure img {
	width: 300px;
}

#blogCarousel {
	padding-bottom: 100px;
}

.blog .carousel-indicators {
	left: 0;
	top: -50px;
	height: 50%;
}

/* The colour of the indicators */
.blog .carousel-indicators li {
	background: #708198;
	border-radius: 50%;
	width: 8px;
	height: 8px;
}

.blog .carousel-indicators .active {
	background: #0fc9af;
}

.item-carousel-blog-block {
	outline: medium none;
	padding: 15px;
}

.item-box-blog {
	border: 1px solid #dadada;
	text-align: center;
	z-index: 4;
	padding: 20px;
}

.item-box-blog-image {
	position: relative;
}

.item-box-blog-image figure img {
	width: 100%;
	height: auto;
}

.item-box-blog-date {
	position: absolute;
	z-index: 5;
	padding: 4px 20px;
	top: -20px;
	right: 8px;
	background-color: #41cb52;
}

.item-box-blog-date span {
	color: #fff;
	display: block;
	text-align: center;
	line-height: 1.2;
}

.item-box-blog-date span.mon {
	font-size: 18px;
}

.item-box-blog-date span.day {
	font-size: 16px;
}

.item-box-blog-body {
	padding: 10px;
}

.item-heading-blog a h5 {
	margin: 0;
	line-height: 1;
	text-decoration: none;
	transition: color 0.3s;
}

.item-box-blog-heading a {
	text-decoration: none;
}

.item-box-blog-data p {
	color: #545b62;
	font-size: 13px;
}

.item-box-blog-data p i {
	color: #545b62;
	font-size: 12px;
}

.item-box-blog-text {
	max-height: 100px;
	overflow: hidden;
}

textarea {
	background-color: black;
	font-size: 14px;
	color: white;
}

.mt-10 {
	float: left;
	margin-top: -10px;
	padding-top: 10px;
}

.btn.bg-blue-ui.white.read {
	cursor: pointer;
	padding: 4px 20px;
	float: left;
	margin-top: 10px;
}

.btn.bg-blue-ui.white.read:hover {
	box-shadow: 0px 5px 15px inset #4d5f77;
}
</style>

</head>
<body style="background-color: black;">

	<h2 style="font-size: 1em;"></h2>
	<!-- 시작부분 -->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>

		<div class="accordian" style="height: 100%">
			<h3 style="color: white;">유저매칭</h3>
			<ul class="uc">
			<c:choose>
			<c:when test="${matching=='[]'}">
			<span style="color: red;">매칭된 결과가없어요</span>
			</c:when>
			<c:otherwise>
				<c:forEach var="matching" items="${matching}">
					<li>
						<div class="image_title">
							<a
								href="moviedetail.ml?open=false&id=${matching.id}&title=${matching.title}">${matching.title }</a>
						</div> <a
						href="moviedetail.ml?open=false&id=${matching.id}&title=${matching.title}">
							<img class="src1" src="${image}${matching.poster_path}"
							style="width: 300px; height: 400px">
					</a>
					</li>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- 슬라이더부분 -->
		<div class="container" style="height: 30%">
			<h2 style="color: gray;">영자추천</h2>
			<section class="customer-logos slider">
				<c:forEach var="result" items="${gen}" begin="0" end="8" step="1">
					<div class="slide">
						<a
							href="moviedetail.ml?open=false&id=${result.id}&title=${result.title}">
							<img src="${image}${result.poster_path}">
						</a>
					</div>
				</c:forEach>
			</section>

		</div>
		<!-- 장르분석부분 -->
		<div class="container cta-100 ">
			<h3>장르분석</h3>
			<div class="container">
				<div class="blog">
					<div class="col-md-12">
						<div id="blogCarousel" class="carousel slide container-blog"
							data-ride="carousel">
							<!-- Carousel items -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="row">
										<c:forEach var="result" items="${gen}">
											<div class="col-md-4">
												<div class="item-box-blog">
													<div class="item-box-blog-image">
														<!--Image-->
														<figure>
															<img alt="" src="${image}${result.poster_path}">
														</figure>
													</div>
													<div class="item-box-blog-body">
														<!--Heading-->
														<div class="item-box-blog-heading">
															<a tabindex="0">
																<h5>${result.title}</h5>
															</a>
															<%-- <textarea rows="5" cols="35">${result.overview }</textarea></p>  --%>
														</div>
														<div class="item-box-blog-data" style="padding: px 15px;">
															<p>
																<i class="fa fa-user-o"></i> 개봉일 : <i
																	class="fa fa-comments-o"></i> ${result.release_date }
															</p>
														</div>
														<!--Text-->
														<div class="item-box-blog-text">
															<textarea rows="5" cols="35">${result.overview }</textarea>
														</div>

														<div class="mt">
															<a
																href="moviedetail.ml?open=false&id=${result.id}&title=${result.title}"
																tabindex="0" class="btn bg-blue-ui white read">read
																more</a>
														</div>
														<!--Read More Button-->
													</div>
												</div>
											</div>
										</c:forEach>
										
									</div>

									<div class="row"></div>
								</div>

								<!--.item-->
							</div>
							<!--.carousel-inner-->
							<button style="margin: 0 auto; size: 15px" class="btn btn-primary"id="genAdd">더보기</button>
						</div>
						<!--.Carousel-->
					</div>
				</div>
				
			</div>
			
		</div>



		<div id="text"></div>
		<!-- 슬라이더 -->
		<div id="slidemenu">
			<div class="boxOffice">
				<p class="showRange" style="color: white; text-align: center;">전날
					날짜 순위</p>
				<ul class="boxOfficeList"></ul>
			</div>
			<div id="overlay">
				<div class="youtube"></div>
				<img class="close" src="Page/Chu/close_white.png">
			</div>
		</div>



		<script type="text/javascript" src="Page/Chu/chu.js"></script>


	</div>
</body>
</html>
