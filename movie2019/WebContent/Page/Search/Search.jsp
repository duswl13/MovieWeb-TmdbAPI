<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String apikey = application.getInitParameter("APIKEY");
%>
<title>Insert title here</title>
<link rel="stylesheet" href="css/MovieList.css">
</head>
<body>

<div class="all">

		<div class="movieList"></div>


		
	</div>
</body>

<script>

	

	var allpages = 0;
	var page = 1;
	
	
	searchList(page);
	
	
	function searchList(page){
	var link = 'https://api.themoviedb.org/3/search/movie?api_key=<%=apikey%>&language=ko-KO&query=<%=request.getParameter("key")%>&page='+page+'&include_adult=false&region=KR';

	
	
	console.log('이동할 페이지 :'+ page+","+link);

	$.ajax({
				url : link, //요청 전송 url
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
	
	$('.pagination > li').click(function(){
		
		var page1 = $(this).text();
		var select1 = $('#sel1').val();
		var select2 = $('#sel2').val();
		var select3 = $('#sel3').val();
		
		if(page1 != '다음' && page1 != '이전'){
			searchList(page1);
		}else{
			
			var start = $('.page-link:eq(1)').text();
			var end = $('.page-link:eq(3)').text();
			
			if(page1 == '다음'){
				end++;
				if(end < allpages){
					searchList(end);
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
				searchList(start);
				
			}
			
			
		}

	});
	
	
	
	function printMovie(list){
		
		var text = '';
		var check = 0;
		
		
		
		
		for (var i = 0; i < 5; i++) {
			
			text += '<div class="row">';
			
			for(var j=0; j < 4; j++){
				
				if(check < list.length){
				if(list[check].poster_path == null || list[check].overview == null || list[check].genre_ids == null || list[check].overview == ""
						|| list[check].genre_ids == "" || list[check].overview.includes('섹스')){
					j--;
					check++;
					console.log('이상한 거니까 넘김'+check);
					
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
			}
			text += '</div>';
			
		}

		console.log('check : '+ check);
		$('.movieList').html(text);
		
	}
	
	
</script>
</html>