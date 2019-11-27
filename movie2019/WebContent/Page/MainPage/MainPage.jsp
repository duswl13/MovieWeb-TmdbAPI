<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="css/MainPagestyle.css">

<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--    <script type="text/javascript"
      src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<%
	String apikey = application.getInitParameter("APIKEY");
%>
</head>
<body>
<jsp:include page="/Page/Navi/Navi.jsp" />

<div id="main">

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>


	<div class="video-background">
		<div class="video-foreground">

			<iframe id="mainVideo"
				src="https://www.youtube.com/embed/Zi4LMpSDccc?version=3&mute=1&loop=1&autoplay=1&rel=0&controls=0&showinfo=0&playlist=Zi4LMpSDccc"
				frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen> </iframe>
		</div>


	</div>



	<div class="main_box">

		<div class="main_box2">
			<h1 id="m_head"></h1>

			<div class="starRev">
				<span class="starR on">별1</span> <span class="starR">별2</span> <span
					class="starR">별3</span> <span class="starR">별4</span> <span
					class="starR">별5</span>
			</div>
			<p id="m_reviews" class="gray"></p>
			<p id="m_content"></p>

		</div>
	</div>






	<div class="container-fluid main-list-padding">

		<div class="row">

			<div class="col-md-12">
				<h3>인기 영화</h3>
				<span class="more">더보기</span>
				<div class="carousel slide multi-item-carousel" id="theCarousel1">
					<div class="carousel-inner">


					
						<!--  Example item end -->
					</div>
					<a class="left carousel-control" href="#theCarousel1"
						data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
					<a class="right carousel-control" href="#theCarousel1"
						data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</div>
		</div>
	</div>








		<div class="container-fluid main-list-padding">

			<div class="row">

				<div class="col-md-12">
					<h3>최신 영화</h3>
					<span class="more">더보기</span>
					<div class="carousel slide multi-item-carousel" id="theCarousel2">
						<div class="carousel-inner">
							

							<!--  Example item end -->
						</div>
						<a class="left carousel-control" href="#theCarousel2"
							data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
						<a class="right carousel-control" href="#theCarousel2"
							data-slide="next"><i
							class="glyphicon glyphicon-chevron-right"></i></a>
					</div>
				</div>
			</div>
		</div>






		<div class="container-fluid main-list-padding">

			<div class="row">

				<div class="col-md-12">
					<h3>개봉 예정 영화</h3>
					<span class="more">더보기</span>
					<div class="carousel slide multi-item-carousel" id="theCarousel3">
						<div class="carousel-inner">
							

							<!--  Example item end -->
						</div>
						<a class="left carousel-control" href="#theCarousel3"
							data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
						<a class="right carousel-control" href="#theCarousel3"
							data-slide="next"><i
							class="glyphicon glyphicon-chevron-right"></i></a>
					</div>
				</div>
			</div>
		</div>



			
</div>


		<script>
	
	
		//api 접근해서 목록 만들기
		$.ajax({
					url : 'https://api.themoviedb.org/3/movie/popular?api_key=<%=apikey%>&language=ko-KO&page=1&region=KR', //요청 전송 url
					dataType : 'json',
					cache : false,
					success : function(data) {
						console.log('인기목록 성공');
						var list = data.results;
						loadVideo(list[randomRange(0,5)]);
						printMovie(list,0);
						

					}, //HTTP 요청이 성공한 경우 실행
					error : function(request, status, error) {
						console.log('인기목록 error');

					},
					complete : function() {
						console.log('인기목록완료');

					} 
				});
		
		
		
		var today = new Date();
		//이전달 첫날 
		
		
		function getDt3(month){
			
			var today = new Date();
			today.setMonth( today.getMonth() + month );
			
			var year = today.getFullYear();
			var mon = today.getMonth()+1;
		
			if(mon<10){
				mon = "0"+mon;
			};
			
			var day = today.getDate();
			if(day<10){
				day = "-0"+day;
			}
			
			return year+"-"+mon+"-"+day;		
			}

	
		
		
		$.ajax({
					url : 'https://api.themoviedb.org/3/discover/movie?api_key=<%=apikey%>&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte='+getDt3(-1)+'&release_date.lte='+getDt3(0), //요청 전송 url
					dataType : 'json',
					cache : false,
					success : function(data) {
						console.log('최신목록 성공');
						var list = data.results;

						printMovie(list,1);
						

					}, //HTTP 요청이 성공한 경우 실행
					error : function(request, status, error) {
						console.log('최신목록 error');

					},
					complete : function() {
						console.log('최신목록 완료');

					} 
				});
		

		
		$.ajax({
			url : 'https://api.themoviedb.org/3/discover/movie?api_key=<%=apikey%>&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte='+getDt3(0)+'&release_date.lte='+getDt3(3), //요청 전송 url
			dataType : 'json',
			cache : false,
			success : function(data) {
				console.log('예정목록 성공');
				var list = data.results;

				printMovie(list,2);
				

			}, //HTTP 요청이 성공한 경우 실행
			error : function(request, status, error) {
				console.log('예정목록 error');

			},
			complete : function() {
				console.log('예정목록 완료');

			} 
		});
		
		function loadVideo(listData){
			
			var id = listData.id;
			console.log('id:'+id+', title:'+listData.title);
			
			$.ajax({
				//id:474350, titleIt Chapter Two
				url : 'http://api.themoviedb.org/3/movie/'
				+id+'/videos?api_key=<%=apikey%>',
				dataType : 'json',
				cache : false,
				success : function(data) {

					console.log('비디오 셋팅 성공');
					var list = data.results;

					printVideo(list[0].key);
					printTitleVideo(listData);
				},
				error : function(request, status, error) {
					console.log('비디오 error');
				},
				complete : function() {
					console.log('비디오 완료');

				}
			});

		}

		function printVideo(videokey) {

			$('#mainVideo')
					.prop(
							'src',
							'https://www.youtube.com/embed/'
									+ videokey
									+ '?version=3&mute=1&loop=1&autoplay=1&rel=0&controls=0&showinfo=0&playlist='
									+ videokey);
		}

		function printTitleVideo(listData) {

			var title = listData.original_title;
			var content = listData.overview;
			var date = listData.release_date;

			$('#m_head').text(title);
			$('#m_reviews').text('147 Reviews ' + date);
			$('#m_content').text(content);

		}

		function printMovie(list,count) {

			var print = '';
			var i = 0;
			for (var check = 0; check < 5; check++) {
				
				if(list[i].poster_path == null || list[i].overview == null || list[i].genre_ids == null || list[i].overview == ""
					|| list[i].genre_ids == "" || list[i].overview.includes('섹스')){
					check--;
					i++;
					continue;
				}
				
				
				
				if (check == 0)
					print += '<div class="item active">\n';
				else
					print += '<div class="item">\n';

				print += '<div class="col-xs-4">\n';
				print += '<a href="moviedetail.ml?open=false&id=' + list[i].id + '">\n';
				print += '<img src="https://image.tmdb.org/t/p/w500'+list[i].poster_path+'" class="img-responsive">\n';
				print += '</a>\n<div class="centered">\n';
				print += '<h1>' + list[i].original_title + '</h1>\n';
				print += '<h5>' + list[i].overview.substring(0,100)+'...' + '</h5>\n';
				print += '<a href="#"><img src="Png/view.png"></a>\n';
				print += '<a href="#"><img src="Png/delete.png"></a>\n</div></div></div>\n';
				i++;
			}

			//console.log(print);
			$('.carousel-inner:eq('+count+')').html(print);
			carouselSetting(count);
			
			

		}

		function randomRange(n1, n2) {
			return Math.floor((Math.random() * (n2 - n1 + 1)) + n1);
		}

		//부트스트랩 carousel 옵션
		$('.multi-item-carousel').carousel({
			interval : 5000
		//자동 슬라이드 여부, 5초마다 다음걸로 자동 슬라이드
		});

		// 슬라이드 쇼의 슬라이드마다 슬라이드의 다음 슬라이드 항목을 복사합니다.
		// 다음, 다음 항목에 대해서도 동일하게 수행합니다.

		function carouselSetting(count){
			
			$('.multi-item-carousel:eq('+count+') .item').each(
					function(index) {

						var next = $(this).next();

						if (!next.length) {
							next = $(this).siblings(':first');
						}
						next.children(':first-child').clone().appendTo($(this));

						if (next.next().length > 0) {
							next.next().children(':first-child').clone().appendTo(
									$(this));
						} else {
							$(this).siblings(':first').children(':first-child')
									.clone().appendTo($(this));
						}
					});
			
		}

	
	</script>
</body>





</html>