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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MainPagestyle.css">

<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--    <script type="text/javascript"
      src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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
				<span class="starR on"></span>
				<span class="starR"></span> 
				<span class="starR"></span>
				<span class="starR"></span>
				<span class="starR"></span>
			</div>
			<p id="m_reviews" class="gray"></p>
			<p id="m_content"></p>

		</div>
	</div>





	<div class="container-fluid main-list-padding">

		<div class="row">

			<div class="col-md-12">
				<h3>인기 영화</h3>
				<span class="more" onclick="location.href='<%=request.getContextPath()%>/MovieList.ml?option=1'">더보기</span>
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
					
					<span class="more" onclick="location.href='<%=request.getContextPath()%>/MovieList.ml?option=2'">더보기</span>
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
					<span class="more" onclick="location.href='<%=request.getContextPath()%>/MovieList.ml?option=3'">더보기</span>
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
	
	
		
		var hiddenlist = new Array();
		<c:forEach items="${hidden}" var="item">
		hiddenlist.push("${item}");
		</c:forEach>
		ToInteger();
		
		function ToInteger(){
		for(var j = 0;j < hiddenlist.length; j++)
			hiddenlist[j] = hiddenlist[j]*1;
		}
		function hiddenremove(list){
			for(var i = 0; i < list.length; i++){
				console.log('확인:'+list[i].id);
				if(hiddenlist.includes(list[i].id)){
					console.log('지움지움:'+list[i].id);
					list.splice(i,1);
					i--;
				}
			}
			return list;
		}
		
		//인기, 최신, 예정
		var p_list, l_list, y_list;
		
		//api 접근해서 목록 만들기
		$.ajax({
					url : 'https://api.themoviedb.org/3/movie/popular?api_key=<%=apikey%>&language=ko-KO&page=1&region=KR', //요청 전송 url
					dataType : 'json',
					cache : false,
					success : function(data) {
						console.log('인기목록 성공 :'+'https://api.themoviedb.org/3/movie/popular?api_key=<%=apikey%>&language=ko-KO&page=1&region=KR');
						
						
						
						p_list = hiddenremove(data.results);
						loadVideo(p_list[randomRange(0,5)]);
						printMovie(p_list,0);
						

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
				day = "0"+day;
			}
			
			return year+"-"+mon+"-"+day;		
			}

	
		
		
		$.ajax({
					url : 'https://api.themoviedb.org/3/discover/movie?api_key=<%=apikey%>&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte='+getDt3(-1)+'&release_date.lte='+getDt3(0), //요청 전송 url
					dataType : 'json',
					cache : false,
					success : function(data) {
						console.log('최신목록 성공 :' +'https://api.themoviedb.org/3/discover/movie?api_key=<%=apikey%>&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte='+getDt3(-1)+'&release_date.lte='+getDt3(0));
						l_list = hiddenremove(data.results);
						printMovie(l_list,1);
						

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
				console.log('예정목록 성공:'+'https://api.themoviedb.org/3/discover/movie?api_key=<%=apikey%>&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte='+getDt3(0)+'&release_date.lte='+getDt3(3));
			
				y_list = hiddenremove(data.results);
				printMovie(y_list,2);
				

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
					var list =data.results;
					
					if(list != null && list.length != 0)
					if(list[0].key != null)
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
			
			//별점 DB 가져오기
			

		}

		function printMovie(list,count) {
			console.log('printMovie:'+list.length);
			if(list == null && list.length == 0){
				//표시할 데이터없음
				return;
			}
			var print = '';
			var i = 0;
			
			
			for (var check = 0; check < 5; check++) {
				
				if (check == 0)
					print += '<div class="item active">\n';
				else
					print += '<div class="item">\n';
				print += '<div class="col-xs-4">\n';
				print += '<a href="moviedetail.ml?open=false&id=' + list[i].id + '&title='+list[i].original_title+'">\n';
				print += '<img src="https://image.tmdb.org/t/p/w500'+list[i].poster_path+'" class="img-responsive">\n';
				print += '\n<div class="centered">\n';
				print += '<a href="javascript:hidden('+list[i].id+',\''+list[i].original_title+'\','+count+','+check+')" class="btn btn-danger hiddenMovie" style="float:right; margin-bottom:8px;">숨김</a>';
				print += '<h1 style="clear:right; float:right;">' + list[i].original_title + '</h1>\n';

				print += ' <div style="clear:right; float:right;>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += ' </div>';
				
				print += '\n</div></a></div></div>\n';
				i++;
				}
			}

			//console.log(print);
			$('.carousel-inner:eq('+count+')').html(print);
			carouselSetting(count);
			
			

		}
		
						//몇번쨰 캐러셀의 몇번쨰 div인지...
		function hidden(movieId,movieTitle,ca){
			//숨김 버튼 눌렀을 경우 서블릿으로 숨김 영화 insert
			
			var restData = {
					"movieId" :movieId,
					"movieTitle": movieTitle
				};
			
			$.ajax({
				url : 'InsertHidden.ml',
				data : restData,
				dataType : 'json',
				success : function(rdata) {
					
					alert("숨김처리되었습니다.");
					hiddenlist = rdata;
					ToInteger();
					
					switch(ca){
					case 0:
						p_list = hiddenremove(p_list);
						printMovie(p_list,ca);
						break;
					case 1:
						l_list = hiddenremove(l_list);
						printMovie(l_list,ca);
						break;
					case 2:
						y_list = hiddenremove(y_list);
						printMovie(y_list,ca);
						break;
					
					}
				}

			});

			
			
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