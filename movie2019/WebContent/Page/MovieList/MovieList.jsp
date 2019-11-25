<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/MovieList.css">
<%
	String apikey = application.getInitParameter("APIKEY");
%>
<title>Insert title here</title>
</head>
<body>
	<div class="all">

		<div class="row">
			<div class="form-group col-xs-2">
				<select class="form-control" id="sel1">
					<option selected value="popular.desc">인기순</option>
					<option value="release_date.desc">최신순</option>
					<option value="db.desc">평가순</option>
				</select>
			</div>

			<div class="form-group col-xs-2">
				<select class="form-control" id="sel2">
					<option selected value="1">모든 장르</option>
					<option value="2">액션</option>
					<option value="3">판타지</option>
				</select>
			</div>



			<div class="form-group col-xs-2">
				<select class="form-control" id="sel3">
					<option selected value="1">모든 키워드</option>
					<option value="2">모험</option>
					<option value="3">사랑</option>
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
</body>

<script>

	
	var page = 1;
	var sort1 = 0;
	var allpages = 0;
	
	readyList(page,sort1);
	
	
	function readyList(page, sort1){
	//api 접근해서 목록 만들기
	
	console.log('이동할 페이지 :'+ page);

	$.ajax({
				url : 'https://api.themoviedb.org/3/movie/popular?api_key=<%=apikey%>&language=ko-KO&page='+page+'&region=KR', //요청 전송 url
				dataType : 'json',
				cache : false,
				success : function(data) {
					console.log('인기목록 성공');
					var list = data.results;
					allpages = data.total_pages;
					printMovie(list);
					

				}, //HTTP 요청이 성공한 경우 실행
				error : function(request, status, error) {
					console.log('인기목록 error');

				},
				complete : function() {
					console.log('인기목록완료');

				} 
			});
	
	}
	
	$('.pagination > li').click(function(){
		
		var page1 = $(this).text();
		var select1 = $('#sel1').val();
		var select2 = $('#sel2').val();
		var select3 = $('#sel3').val();
		
		if(page1 != '다음' && page1 != '이전'){
			readyList(page1,0);
		}else{
			
			var start = $('.page-link:eq(1)').text();
			var end = $('.page-link:eq(3)').text();
			
			if(page1 == '다음'){
				end++;
				if(end < allpages){
				readyList(end,sort1);
				$('.page-link:eq(1)').text(end++);
				}
				if(end < allpages)
				$('.page-link:eq(2)').text(end++);
				if(end < allpages)
				$('.page-link:eq(3)').text(end);
				
				
				
			}else{
				start--;
				
				if(start > 0)
				$('.page-link:eq(3)').text(start--);
				if(start > 0)
				$('.page-link:eq(2)').text(start--);
				if(start > 0)
				$('.page-link:eq(1)').text(start);
				readyList(start,sort1);
				
			}
			
			
		}

	});
	
	
	
	function printMovie(list){
		
		var text = '';
		var check = 0;
		
		
		
		
		for (var i = 0; i < 4; i++) {
			
			text += '<div class="row">';
			
			for(var j=0; j < 4; j++){
				
				if(list[check].poster_path == null){
					j--;
					console.log('포스터가 없으므로 넘김');
					check++;
					continue;
				}
			
			list[check].overview = list[check].overview.substring(0,100)+'...';
			text += '<div class="col-xs-3">';
			text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
			text += '<div class="centered">\n';
			text += '<h5>' + list[check].original_title + '</h5>\n';
			text += '<p>' + list[check].overview + '</p></div>\n';
			text += '<h5>'+list[check].original_title+'</h5>';
			text += '</div>';
			
			check++;
			}
			text += '</div>';
			
		}

		console.log('check : '+ check);
		$('.movieList').html(text);
		
	}
	
	
</script>
</html>