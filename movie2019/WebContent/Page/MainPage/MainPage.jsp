<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Page/MainPage/MainPagestyle.css">
<%
	String apikey = application.getInitParameter("APIKEY");
%>
</head>
<body>


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

						<div class="item active">
							<div class="col-xs-4">
								<a href="#1"> <img
									src="https://image.tmdb.org/t/p/w500/wrCwH6WOvXQvVuqcKNUrLDCDxdw.jpg"
									class="img-responsive">

								</a>

								<div class="centered">
									<h1>Jocker</h1>
									<h5>홀어머니와 사는 아서 플렉(호아킨 피닉스)은 코미디언을 꿈꾸지만 그의 삶은 좌절과 절망으로 가득
										차 있다. 광대 아르바이트는 그에게...</h5>
									<!-- 메인으로 movieDetail id값을 parameter로 보내야 -->
									<a href="moviedatail"><img src="Page/Png/view.png"></a> <a
										href="#"><img src="Page/Png/delete.png"></a>

								</div>

							</div>

						</div>



						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/8S2AFd8DF539pxdn7TCIDqXlwRA.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/nIoDNiWWOtCFdJRi89aFI98cdj0.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/742vR63T1AcXzYwHypQpzZd89vh.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/wrCwH6WOvXQvVuqcKNUrLDCDxdw.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/qlBePshN1ujPwm27JzT6bP6XVeR.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<!-- add  more items here -->
						<!-- Example item start:  -->

						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/ePXuKdXZuJx8hHMNr2yM4jY2L7Z.jpg"
									class="img-responsive"></a>
							</div>
						</div>


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
						<div class="item active">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/wrCwH6WOvXQvVuqcKNUrLDCDxdw.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/8S2AFd8DF539pxdn7TCIDqXlwRA.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/nIoDNiWWOtCFdJRi89aFI98cdj0.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/742vR63T1AcXzYwHypQpzZd89vh.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/wrCwH6WOvXQvVuqcKNUrLDCDxdw.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/qlBePshN1ujPwm27JzT6bP6XVeR.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<!-- add  more items here -->
						<!-- Example item start:  -->

						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/ePXuKdXZuJx8hHMNr2yM4jY2L7Z.jpg"
									class="img-responsive"></a>
							</div>
						</div>


						<!--  Example item end -->
					</div>
					<a class="left carousel-control" href="#theCarousel2"
						data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
					<a class="right carousel-control" href="#theCarousel2"
						data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</div>
		</div>
	</div>






	<div class="container-fluid main-list-padding">

		<div class="row">

			<div class="col-md-12">
				<h3>평점 높은 영화</h3>
				<span class="more">더보기</span>
				<div class="carousel slide multi-item-carousel" id="theCarousel3">
					<div class="carousel-inner">
						<div class="item active">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/wrCwH6WOvXQvVuqcKNUrLDCDxdw.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/8S2AFd8DF539pxdn7TCIDqXlwRA.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/nIoDNiWWOtCFdJRi89aFI98cdj0.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/742vR63T1AcXzYwHypQpzZd89vh.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/wrCwH6WOvXQvVuqcKNUrLDCDxdw.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/qlBePshN1ujPwm27JzT6bP6XVeR.jpg"
									class="img-responsive"></a>
							</div>
						</div>
						<!-- add  more items here -->
						<!-- Example item start:  -->

						<div class="item">
							<div class="col-xs-4">
								<a href="#1"><img
									src="https://image.tmdb.org/t/p/w500/ePXuKdXZuJx8hHMNr2yM4jY2L7Z.jpg"
									class="img-responsive"></a>
							</div>
						</div>


						<!--  Example item end -->
					</div>
					<a class="left carousel-control" href="#theCarousel3"
						data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
					<a class="right carousel-control" href="#theCarousel3"
						data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
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
						loadVideo(list[randomRange(0,list.length-1)]);
						
						

					}, //HTTP 요청이 성공한 경우 실행
					error : function(request, status, error) {
						console.log('인기목록 error');

					},
					complete : function() {
						console.log('인기목록완료');

					} 
				});

		
		function loadVideo(listData){
			
			var id = listData.id;
			console.log('id:'+id+', title:'+listData.title);
			
			$.ajax({
				//id:474350, titleIt Chapter Two
				url : 'http://api.themoviedb.org/3/movie/'+id+'/videos?api_key=<%=apikey%>',
				dataType : 'json',
				cache : false,
				success : function(data) {
					
					console.log('비디오 셋팅 성공');
					var list = data.results;

					printVideo(list[0].key);
					printTitleVideo(listData);
				},
				error : function(request, status, error) {
					//alert("에러났습니다.");
				},
				complete : function() {
					//alert("완료했습니다.");

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

		$('.multi-item-carousel:eq(0) .item').each(
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

		$('.multi-item-carousel:eq(1) .item').each(
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

		$('.multi-item-carousel:eq(2) .item').each(
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
	</script>




</body>





</html>