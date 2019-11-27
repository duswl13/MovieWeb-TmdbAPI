<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Our Custom CSS -->


<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--    <script type="text/javascript"
      src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="css/MovieList.css">
<%
	boolean open = Boolean.parseBoolean(request.getParameter("open"));
	String apikey = application.getInitParameter("APIKEY");
%>
<title>Insert title here</title>
</head>
<body>


<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>


<div id="main">

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>
			
	<div class="all">

		<div class="row">
			<div class="form-group col-xs-2">
				<select class="form-control" id="sel1">
					<option selected value=1>인기순</option>
					<option value=2>최신순</option>
					<option value=3>개봉예정순</option>
				</select>
			</div>

			<div class="form-group col-xs-2">
				<select class="form-control" id="sel2">
					<option selected value="0">모든 장르</option>
					<option value="28">액션</option>
					<option value="12">모험</option>
					<option value="16">애니메이션</option>
					<option value="35">코미디</option>
					<option value="80">범죄</option>
					<option value="99">다큐멘터리</option>
					<option value="18">드라마</option>
					<option value="10751">가족</option>
					<option value="14">판타지</option>
					<option value="36">역사</option>
					<option value="27">공포</option>
					<option value="10402">음악</option>
					<option value="9648">미스터리</option>
					<option value="10749">로맨스</option>
					<option value="878">SF</option>
					<option value="10770">TV 영화</option>
					<option value="53">스릴러</option>
					<option value="10752">전쟁</option>
					<option value="37">서부</option>
				</select>
			</div>



		</div>


		<div class="movieList"></div>


		<div class="row">
			<div class="text-center">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">이전</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
</body>

<script>

if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";
		
		

	var sort1 = 1;
	var sort2 = 0;
	
	var allpages = 0;
	
	readyList(1);
	
	
	
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
	
	function readyList(page){
	//api 접근해서 목록 만들기
	
	
	
	var link ='';
	//인기, 최신, 개봉예정 필터
	//alert('sort1 :' + sort1);
	switch(parseInt(sort1)){
	case 1:
		link = 'https://api.themoviedb.org/3/movie/popular?api_key=<%=apikey%>&language=ko-KO&page='+page+'&region=KR';
		break;
	case 2:
		
		link = 'https://api.themoviedb.org/3/discover/movie?api_key=<%=apikey%>&language=ko-KO&page='+page+'&region=KR&sort_by=release_date.desc&release_date.lte='+getDt3(0);
		break;
	case 3:
		link = 'https://api.themoviedb.org/3/discover/movie?api_key=<%=apikey%>&language=ko-KO&page='
					+ page
					+ '&region=KR&sort_by=release_date.asc&include_adult=false&release_date.gte='
					+ getDt3(0) + '&release_date.lte=' + getDt3(5);
			break;
		}

		//장르 필터
		var option = '';
		if (sort2 != 0) {
			option = '&with_genres=' + sort2;
		}

		console.log('이동할 페이지 :' + page + "," + link);

		$.ajax({
			url : link + option, //요청 전송 url
			dataType : 'json',
			cache : false,
			success : function(data) {

				var list = data.results;
				allpages = data.total_pages;
				printMovie(list);

			}, //HTTP 요청이 성공한 경우 실행
			error : function(request, status, error) {
				console.log('목록 error');

			},
			complete : function() {
				console.log('목록완료');

			}
		});

	}

	$('#sel1').change(function() {
		var value = $(this).val();
		sort1 = value;
		//alert('바뀜'+sort1);
		readyList(1);
		$('.page-link:eq(1)').text(1);
		$('.page-link:eq(2)').text(2);
		$('.page-link:eq(3)').text(3);
	});

	$('#sel2').change(function() {
		var value = $(this).val();
		sort2 = value;
		//alert('바뀜'+sort2);
		readyList(1);
	});

	$('.pagination > li').click(function() {

		var page1 = $(this).text();
		var select1 = $('#sel1').val();
		var select2 = $('#sel2').val();
		var select3 = $('#sel3').val();

		if (page1 != '다음' && page1 != '이전') {
			readyList(page1);
		} else {

			var start = $('.page-link:eq(1)').text();
			var end = $('.page-link:eq(3)').text();

			if (page1 == '다음') {
				end++;
				if (end < allpages) {
					readyList(end);
					$('.page-link:eq(1)').text(end++);
				}
				if (end < allpages)
					$('.page-link:eq(2)').text(end++);
				if (end < allpages)
					$('.page-link:eq(3)').text(end);

			} else {
				start--;

				if (start > 0)
					$('.page-link:eq(3)').text(start--);
				if (start > 0)
					$('.page-link:eq(2)').text(start--);
				if (start > 0)
					$('.page-link:eq(1)').text(start);
				readyList(start);

			}

		}

	});

	function printMovie(list) {

		var text = '';
		var check = 0;

		for (var i = 0; i < 5; i++) {

			text += '<div class="row">';

			for (var j = 0; j < 4; j++) {

				if (check < list.length) {
					if (list[check].poster_path == null
							|| list[check].overview == null
							|| list[check].genre_ids == null
							|| list[check].overview == ""
							|| list[check].genre_ids == ""
							|| list[check].overview.includes('섹스')) {
						j--;
						check++;
						console.log('이상한 거니까 넘김' + check);

						continue;
					}

					list[check].overview = list[check].overview.substring(0,
							100)
							+ '...';
					text += '<div class="col-xs-3">';
					text += '<a href="moviedetail.ml?open=false&id=' + list[check].id
							+ '">\n';
					text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
					text += '</a>';
					text += '<div class="centered">\n';
					text += '<h5>' + list[check].original_title + '</h5>\n';
					text += '<p>' + list[check].overview + '</p></div>\n';
					text += '<h5>' + list[check].original_title + '</h5>';

					text += '</div>';

					check++;
				}
			}
			text += '</div>';

		}

		console.log('check : ' + check);
		$('.movieList').html(text);

	}
</script>
</html>