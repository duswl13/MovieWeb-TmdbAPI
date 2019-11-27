<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


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
boolean open = Boolean.parseBoolean(request.getParameter("open"));
	String apikey = application.getInitParameter("APIKEY");
%>
<title>Insert title here</title>
<link rel="stylesheet" href="css/MovieList.css">
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

		<div class="movieList"></div>


		
	</div>
	</div>
</body>

<script>


if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";
		

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
			
				
				console.log('검색 결과 :list[check].original_title : '+ list[check].original_title);
				console.log('검색 결과 :list[check].overview : '+ list[check].overview);
				
			list[check].overview = list[check].overview.substring(0,100)+'...';
			text += '<div class="col-xs-3">';
			text += '<a href="moviedetail.ml?open=false&id=' + list[check].id + '">\n';
			text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
			text += '</a>';
			text += '<div class="centered">\n';
			text += '<h5>' + list[check].original_title + '</h5>\n';
			text += '<p>' + list[check].overview.substring(0,50) + '...</p></div>\n';
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