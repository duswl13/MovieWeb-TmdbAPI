<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VOSHU</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<%

	
	boolean open = false;
	if (request.getParameter("open") != null) {
		open = Boolean.parseBoolean(request.getParameter("open"));
	}
	
%>
<style>
.all {
	margin-top: 22vh;
	color: white;
}



a{
color:white;
}
a:hover{
color:#27AE60;}
.col-xs-4 {
	text-align: center;
	background: #ccc;
	height: 500px;
}



.movie_info {
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 1), rgba(0, 0, 0, 1), rgba(0, 0, 0, 1), rgba(0, 0, 0, 1),
		rgba(0, 0, 0, 1), rgba(0, 0, 0, 1), rgba(0, 0, 0, 1), rgba(0, 0, 0, 1));
}

.pickgradient {
	position: relative;
	display: inline-block;
}

.pickgradient:after {
	content: '';
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	display: inline-block;
	background: linear-gradient(to left, #000, rgba(0, 0, 0, 0.4),
		rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.4), #000); /* W3C */
}

img {
	display: block;
}

.user_mv {
	padding: 16px;
	background: #333;
}

.top_margin {
	margin-top: 5em;
}

.col-xs-4 {
padding:16px;
width:32%;
margin: 0.5%;
	height:18em;
	background: #141414;
}



.detail_content {
	color: white;
}

.review_id {
	float: left;
}

.review_star {
	float: right;
}
.review_face {
	float: right;
}

.col-xs-2:hover>.centered {
	display: block;
}

.col-xs-3:hover>.centered {
	display: block;
}

.centered p {
	color: white;
}
/* Centered text */
.centered {
	display: none;
	color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

@keyframes leaves {
0% {
	transform: scale(1.0);
	opacity: 1.0;
}

100%{
transform:scale(1.05);

          
opacity:0.4;  }
}
.col-xs-3:hover img {
	animation: leaves 0.5s;
	animation-fill-mode: forwards;
}

.col-xs-2:hover img {
	animation: leaves 0.5s;
	animation-fill-mode: forwards;
}

/*유투브 백그라운드*/
.video-background {
	background: #000;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -99;
}

/*유투브 백그라운드*/
.video-foreground, .video-background iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;
}

/*유투브 백그라운드*/
@media ( min-aspect-ratio : 16/9) {
	.video-foreground {
		height: 100vh;
		top: -10vh;
		/*height: 300%;
		top: -100%; */ /*상단 유투브 제목 안보이게하려고*/
	}
}

@media ( max-aspect-ratio : 16/9) {
	.video-foreground {
		width: 100vh;
		left: -10vh;
	}
}

/*유투브 백그라운드*/
@media ( min-aspect-ratio : 1/1) {
	.video-foreground {
		height: 100vh;
		top: -10vh;
		/*height: 300%;
		top: -100%; /*상단 유투브 제목 안보이게하려고*/
	}
}

@media ( max-aspect-ratio : 1/1) {
	.video-foreground {
		width: 100vh;
		left: -10vh;
	}
}

/*유투브 백그라운드 불투명도*/
iframe {
	opacity: 0.8;
}

.detail_similar {
	padding-bottom: 3em;
}

/* Centered text */
.centered {
	cursor: pointer;
	display: none;
	color: white;
	width: 80%;
	height: 80%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.rating span {
	cursor: pointer;
	font-size: 26px;
}

.user_mv img {
	cursor: pointer;
	display: inline-block;
	margin-left: 1em;
	width: 30px;
	float: right;
}

.user_mv table {
	width: 100%;
}
.more {
float:right;
font-size:15px;
	cursor:pointer;

}


.user_mv td {
	width: 50%;
}


</style>
</head>
<body>

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

		<div class="video-background">
			<div class="video-foreground">
			<c:choose>
			<c:when test="${empty movieurl}">
				<iframe id="detailVideo" src="video/aurora.mp4" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen> </iframe>
			</c:when>
			<c:otherwise>
			<iframe id="detailVideo" src="https://www.youtube.com/embed/${movieurl }?version=3&mute=1&loop=1&autoplay=1&rel=0&controls=0&showinfo=0&playlist=${movieurl }" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen> </iframe>
	
			</c:otherwise>
			</c:choose>
			
		
			
			</div>


		</div>


		<div class="all">

			<div class="row"></div>

			<div class="row movie_info">
				<div class="container">
					<div class="col-xs-2">
						<img class="img-responsive" id="detail_poster" src="https://image.tmdb.org/t/p/w500${list.poster_path }">
					</div>
					<div class="col-xs-10">
						<h2>
							<b id="detail_title">${list.title}</b>
							<b style="text-align: right; float: right;">
							
							<c:forEach var="test" begin="1" end="${list.star }">
																<span class="fa fa-star"></span>
															</c:forEach>
							
							</b>
						</h2>
						
						<h5 id="detail_genre_and_date">
						<c:forEach items="${list.genre_ids}" var="item">
						${item}&nbps;
						</c:forEach>
						${list.release_date}
						</h5>
						<h5 id="homepage"><a href="${list.homepage}">${list.homepage}</a></h5>
						<h5><b id="tag_line">${list.tagline}</b></h5>
						
						<p id="detail_content">${list.overview}</p>

						<div class="user_mv">
							<table>
								<tr>
									<td><h4>
										<c:choose>
											<c:when test="${star == -2}">
												<b>이 영화 에 대해 평가해주세요.</b>
											</c:when>
											<c:otherwise>
												<b>이미 이 영화에 대해 평가하셨습니다.</b>
											</c:otherwise>
										</c:choose>
									</h4></td>
									<td><c:choose>
											<c:when test="${face == 1 }">
												<img src="Png/happy1.svg">
												<img src="Png/neutral1.svg">
											</c:when>
											<c:when test="${face == 2 }">
												<img src="Png/happy.svg">
												<img src="Png/neutral.svg">
											</c:when>
											<c:otherwise>
												<img src="Png/happy.svg">
												<img src="Png/neutral1.svg">
											</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<td>

										<div class="rating">
											<c:choose>
												<c:when test="${star == 1 }">
													<span>★</span>
													<span>☆</span>
													<span>☆</span>
													<span>☆</span>
													<span>☆</span>
												</c:when>
												<c:when test="${star == 2 }">
													<span>★</span>
													<span>★</span>
													<span>☆</span>
													<span>☆</span>
													<span>☆</span>
												</c:when>
												<c:when test="${star == 3 }">
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>☆</span>
													<span>☆</span>
												</c:when>
												<c:when test="${star == 4 }">
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>☆</span>
												</c:when>
												<c:when test="${star == 5 }">
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
												</c:when>
												<c:otherwise>
													<span>☆</span>
													<span>☆</span>
													<span>☆</span>
													<span>☆</span>
													<span>☆</span>
												</c:otherwise>
											</c:choose>
										</div>

									</td>
									<td></td>
								</tr>
							</table>
						</div>


						<h4 class="top_margin">
							<b>출연진</b>
						</h4>
						<div class="mv_guest row">
						</div>



						<h4 class="top_margin">
							<b>평가 분포</b>
						</h4>
						<div class="row">
							<div class="col-xs-6">

								<canvas id="myChart" height="60vh" width="80vw"></canvas>

							</div>

							<div class="col-xs-6">

								<canvas id="myChart2" height="60vh" width="80vw"></canvas>

							</div>

						</div>


						<h4 class="top_margin">
							<b>리뷰</b><span class="more">더보기</span>
						</h4>

						<div class="row">
							<c:choose>
							<c:when test="${!empty bestreview}">
							
							<c:forEach var="p_review" items="${bestreview}">
							
							<div class="col-xs-4">
								
										<div style="height:10%;">
										<span class="review_id">${ p_review.USER_ID}</span> 
									
									
										
										<span class="review_face">
										
										<c:forEach var="i" begin="1" end="${p_review.REVIEW_STAR}" step="1">
										<span class="fa fa-star"></span>
										</c:forEach>
										
										</span>
										<span class="review_face">
										
										<c:choose>
										<c:when test="${ p_review.REVIEW_FACE == 1}">
										<!-- 좋아요 -->
										<img src="Png/happy1.svg" style="width:20px; margin-right:5px">
										</c:when>
										<c:otherwise>
										<!-- 싫어요 -->
										<img src="Png/neutral.svg" style="width:20px; margin-right:5px">
										</c:otherwise>
										</c:choose>
										
										
										</span>
										</div>
									
									
									<div style="height:80%;justify-content: center; display: flex;align-items: center;">
									
									<p><font size=3><b>${p_review.REVIEW_TITLE } </b></font><br> ${p_review.REVIEW_CONTENT }</p>
									</div>
									
									<div style="height:10%;">	
									
										<span class="review_face">
										
  										${p_review.REVIEW_LIKE } like
		
										
									</span>
									</div>
						
							</div>
							
							</c:forEach>
							</c:when>
							<c:otherwise>
							<div class="col-xs-12" style="padding:16px; background:#333;">
							<h4>등록된 리뷰가 없습니다.</h4>
							</div>
							</c:otherwise>
							</c:choose>
						</div>



						<h4 class="top_margin" id="div_similar">
							<b>비슷한 영화</b>
						</h4>

						<div class="detail_similar row"></div>







						<div></div>

					</div>
				</div>

			</div>

		</div>
	</div>
</body>

<script>



if(<%=open%>)
document.getElementById("main").style.marginLeft = "250px";
	

	
	var creditlist = new Array();
	
	<c:forEach items="${credit}" var="item2">
	
	creditlist.push({
		id : "${item2.id}",
		name : "${item2.name}",
		profile_path : "${item2.profile_path}"
	});
	
	</c:forEach>
	

	var similarlist = new Array();
	
	<c:forEach items="${similar}" var="item2">
	
	similarlist.push({
		poster_path : "${item2.poster_path}",
		id : "${item2.id}",
		original_title : "${item2.original_title}",
		title : "${item2.title}",
		Star : "${item2.star}"
	});
	
	</c:forEach>
	
	printCredits(creditlist);
	printSimilar(similarlist);

	
	
	var rating = false;
	var rating_value = ${star};
	var rating_face = ${face};
	
	if(rating_value != -2)
		Change_star(rating_value);
	
	//표정 점수이미지를 클릭할경우 변화
	$('.user_mv img').click(function(){
		
		
		var id = "${id}";
		
		if(id == null || id==""){
			alert(id+'로그인 먼저 해주세요.');
			location.href='<%=request.getContextPath()%>/Page/Login/login.jsp';
			return;
		}
		
		var check = $(".user_mv img").index(this); 
		
		
		
		if(check == 0){
			//좋아요
			$('.user_mv img:eq(0)').prop('src',"<%=request.getContextPath()%>/Png/happy1.svg");
			$('.user_mv img:eq(1)').prop('src',"<%=request.getContextPath()%>/Png/neutral1.svg");
		
			
		}else{
			//싫어요
			$('.user_mv img:eq(0)').prop('src',"<%=request.getContextPath()%>/Png/happy.svg");
			$('.user_mv img:eq(1)').prop('src',"<%=request.getContextPath()%>/Png/neutral.svg");
				}

				if(rating_face != -2) //표정점수 갱신
				UpdateFaceRating(++check);
				else	//표정점수 등록
				InsertFaceRating(++check);

			});

	//별점 클릭 시 해당 점수 고정시키기
	$(".rating span").click(function() {
		
		
		var id = "${id}";
		
		if(id == null || id==""){
			alert(id+'로그인 먼저 해주세요.');
			location.href='<%=request.getContextPath()%>/Page/Login/login.jsp';
			return;
		}
		
		if(rating_value > -2){
			rating_value = -3; //별점 바꾸겠다.
			rating = false;
			$(".user_mv b").text('영화에 대해 다시 평가를 하세요.');
			return;
		}
		
		rating = !rating;
		
		
		var check = ($(".rating span").index(this))+1;
		//별점 클릭 시 해당 점수 고정시키기
		if (rating) {

			
			if(rating_value == -3){
				//별점 갱신
				UpdateStarRating(check);
			}else{
				//별점 등록
				InsertStarRating(check);
			}
		
			rating_value = check;
			return false;

		}
	});

	
	
	$(".user_mv").mouseleave(function(){
		
		
		//별점을 매기지 않고 마우스가 변경되었을 경우 텍스트 원상복귀
		if(rating_value <= -2){
			
			var checkText = '이 영화 에 대해 평가해주세요.'
			$('.user_mv b').text(checkText);
			Change_star(-1);
			
		}
		
	});
	$(".rating span").hover(function() {
		
		if(rating_value > -2){
			return;
		}
		var check = $(".rating span").index(this);
		//hover 된 요소가 몇번쨰 요소인지 확인

		var checkText = '';
		switch (check) {
		case 0:
			checkText = '영화의 완성도가 너무 없어요.';
			break;
		case 1:
			checkText = '영화의 완성도가 별로에요.';
			break;
		case 2:
			checkText = '영화의 완성도가 보통이에요.';
			break;
		case 3:
			checkText = '영화의 완성도가 괜찮아요.';
			break;
		case 4:
			checkText = '영화의 완성도가 높아요.';
			break;
		}

		$('.user_mv b').text(checkText);

		Change_star(check);

	});
	
	function Change_star(check){
		
		//별점 변화
		for (var i = 0; i < 5; i++) {
			if (i <= check) {
				$('.rating span:eq(' + i + ')').text('★');
				$('.rating span:eq(' + i + ')').css('color', 'orange');

			} else {
				$('.rating span:eq(' + i + ')').css('color', 'white');
				$('.rating span:eq(' + i + ')').text('☆');
			}
		}
	}

	function InsertStarRating(value) {

		
		$.ajax({

			url : 'InsertStarRating.ml',
			data : {
				"movieId" :"${movieId}",
				"movieStar" : value
			},
			dataType : 'json',
			success : function(rdata) {

				if (rdata != 1) {
					alert('별점 등록에 실패했습니다.');
				}else if(rdata == 5){
					alert("로그인 먼저 해주세요.");
				}

			}

		});

	}

	
	
	function UpdateStarRating(value) {
		
		
		$.ajax({

			url : 'UpdateStarRating.ml',
			data : {
				"movieId" : "${movieId}",
				"movieStar" : value
			},
			dataType : 'json',
			success : function(rdata) {

				if (rdata != 1) {
					alert('별점 점수 갱신 실패!');
				}

			}

		});

	}
	
	function UpdateFaceRating(value) {

	
		$.ajax({

			url : 'UpdateFaceRating.ml',
			data : {
				"movieId" :"${movieId}",
				"movieFace" : value
			},
			dataType : 'json',
			success : function(rdata) {

				if (rdata != 1) {
					alert('표정 점수 갱신 실패!');
				}

			}

		});

	}
	
	function InsertFaceRating(value) {

		//alert($('#detail_title').text());
		$.ajax({

			url : 'InsertFaceRating.ml',
			data : {
				"movieId" :"${movieId}",
				"movieFace" : value
			},
			dataType : 'json',
			success : function(rdata) {

				if (rdata != 1) {
					alert('표정 점수 등록 실패!');
				}

			}

		});

	}

	
	function SelectFaceRating(value) {

		//alert($('#detail_title').text());
		$.ajax({

			url : 'SelectFaceRating.ml',
			data : {
				"movieId" :"${movieId}",
				"movieTitle" : $('#detail_title').text(),
			},
			dataType : 'json',
			success : function(rdata) {

				if (rdata == 1) {
					alert('표정 점수 등록 성공!');

				} else {
					alert('표정 점수 등록 실패!');
				}

			},
			error : function() {
				alert('에러');
			},
			complete : function() {
				alert('완료');
			}

		});

	}

	function printCredits(list) {

		var tag = '';
		console.log("list:" + list.length);

		var check = 0;
		
		
		if(list != null && list.length != 0){
		for (var i = 0; i < 6; i++) {
			if (check >= list.length) {
				break;
			}
				console.log("이름:" + list[check].name);
				console.log("포스터:" + list[check].profile_path);
				
				if (!list[check].profile_path || list[check].profile_path == null) {
					check++;
					i--;
					continue;
				}

				
				tag += '<div class="col-xs-2">';
				//tag += '<a href="PersonDetail.ml?id=' + list[check].id + '&name='+list[check].name+'">
				tag += '<img class="img-responsive"';
				tag += ' src="https://image.tmdb.org/t/p/w500'+list[check].profile_path+'">';

				tag += '<div class="centered" Onclick="location.href=\'PersonDetail.ml?id='
						+ list[check].id + '&name=' + list[check].name + '\'">';
				tag += '<h3>' + list[check].name + '</h3></div>\n';

				tag += '<p>' + list[check].name + '</p>';
				tag += '</div>';
				check++;
				
				//console.log("TEst>>>>"+list[check].profile_path);
			
		}

		console.log("tag : " + tag);
		$('.mv_guest').html(tag);
		
		}
	}

	function printSimilar(list) {

		if (list.length == 0) {
			$('#div_similar ').remove();
			return;
		}

		var text = '';

		var check = 0;

		for (var i = 0; i < 4; i++) {
			if (check < list.length) {


				text += '<div class="col-xs-3">';
				
				text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';

				list[check].original_title = list[check].original_title.replace(/\"/gi, "");
				list[check].original_title = list[check].original_title.replace(/\'/gi, "");
				
				
				text += '<div class="centered" Onclick="location.href=\'moviedetail.ml?open=false&id='
						+ list[check].id +'&title='+list[check].original_title
						+ '&poster_path='+list[check].poster_path+'\'">';
				text += '<h3 style="clear:right;" class="centeredText"><b>'
						+ list[check].original_title + '</b></h3>\n';

				text += ' <div>';
				for(var k =0; k < list[check].Star; k++)
					text += '<span class="fa fa-star"></span>';
				
				text += ' </div>';
				text += '</div>\n';
				text += '<h5>' + list[check].original_title + '</h5>';

				text += '</div>';

				check++;
			}
			text += '</div>';
		}

		$('.detail_similar').html(text);
	}

	// 우선 컨텍스트를 가져옵니다. 
	var ctx = document.getElementById("myChart").getContext('2d');
	var ctx2 = document.getElementById("myChart2").getContext('2d');
	/*
	 - Chart를 생성하면서, 
	 - ctx를 첫번째 argument로 넘겨주고, 
	 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
	 */

	Chart.defaults.global.defaultFontColor = 'white';

	
	
	
	
	var allst = new Array();
	
	allst[0] = ${allstar[0]};
	allst[1] = ${allstar[1]};
	allst[2] = ${allstar[2]};
	allst[3] = ${allstar[3]};
	allst[4] = ${allstar[4]};

	
	var allfa = new Array();

	allfa[0] = ${allface[0]};
	allfa[1] = ${allface[1]};
	
	
	
	
	var myPieChart = new Chart(ctx,
			{
				type : 'doughnut',

				data : {
				
					labels : [ "1점", "2점", "3점", "4점", "5점" ],
					datasets : [ {
						label : '# of Votes',
						data : [ allst[0], allst[1], allst[2], allst[3], allst[4] ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.8)',
								'rgba(54, 162, 235, 0.8)',
								'rgba(255, 206, 86, 0.8)',
								'rgba(75, 192, 192, 0.8)',
								'rgba(153, 102, 255, 0.8)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
				     cutoutPercentage: 50,
					maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					scales : {
						yAxes : [ {
							ticks : {
								display : false
							}
						} ]
					}
				}
			});

	var myPieChart2 = new Chart(ctx2,
			{
				type : 'doughnut',
				data : {
					labels : [ "좋아요", "싫어요" ],
					datasets : [ {
						label : '# of Votes',
						data : [ allfa[0], allfa[1] ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.8)',
								'rgba(54, 162, 235, 0.8)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					scales : {
						yAxes : [ {
							ticks : {
								display : false
							}
						} ]
					}
				}
			});
</script>
</html>