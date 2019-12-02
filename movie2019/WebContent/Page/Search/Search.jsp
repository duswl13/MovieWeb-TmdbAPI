<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--    <script type="text/javascript"
      src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/MovieList.css">

<style>

#myBtn {
  display: none; /* Hidden by default */
  position: fixed; /* Fixed/sticky position */
  bottom: 20px; /* Place the button at the bottom of the page */
  right: 30px; /* Place the button 30px from the right */
  z-index: 99; /* Make sure it does not overlap */
  border: none; /* Remove borders */
  outline: none; /* Remove outline */
  background-color: red; /* Set a background color */
  color: white; /* Text color */
  cursor: pointer; /* Add a mouse pointer on hover */
  padding: 15px; /* Some padding */
  border-radius: 10px; /* Rounded corners */
  font-size: 18px; /* Increase font size */
}

#myBtn:hover {
  background-color: #555; /* Add a dark-grey background on hover */
}
</style>


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
			
		<div class="container all">
		
		<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
		<div class="movieList"></div>

		<div class="row">
		<div class="col-xs-6 col-centered text-center">
			<button class="more">더보기</button>
		</div>
		</div>
		
	</div>
	
	
	
	</div>
	
	
</body>

<script>


if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";
		

	var page = 0;
	
	
	searchList();
	
	
	function searchList(){
		page++;
	var link = 'https://api.themoviedb.org/3/search/movie?api_key=<%=apikey%>&language=ko-KO&query=<%=request.getParameter("key")%>&page='+page+'&include_adult=false&region=KR';

	
	
	console.log('이동할 페이지 :'+ page+","+link);

	$.ajax({
				url : link, //요청 전송 url
				dataType : 'json',
				cache : false,
				success : function(data) {
					
					var list = data.results;
					allpages = data.total_pages;
					console.log('list.length:'+list.length);
					printMore(list.length);				
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
	
	
	var listsize = 0; //필터링으로 인한 영화 빈거 채우려고
	
	//api 결과가 20개가 아닌 경우 결과의 끝이라고 보고 더보기 숨김
	function printMore(size){
		if(size != 20)
			$('.more').css('visibility','hidden');
		else
			$('.more').css('visibility','visible');
	}
	
	
	function printMovie(list){
		
		var text = '';
		var check = 0;
		
	
		
		if(listsize == 0 || listsize % 4 == 0)
			outer :	for (var i = 0; i < 5; i++) {
			
		
			text += '<div class="row">';
			
			for(var j=0; j < 4; j++){
				
				if(check < list.length){
				if(list[check].poster_path == null || list[check].overview == null || list[check].genre_ids == null || list[check].overview == ""
						|| list[check].genre_ids == "" || list[check].overview.includes('섹스')){
					j--;
					check++;
					console.log('이상한 거니까 넘김'+check);
					
					continue ;
				}
			
				
			
			list[check].overview = list[check].overview.substring(0,100)+'...';
			text += '<div class="col-xs-3">';
		
			text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
		
			text += '<div class="centered" Onclick="location.href=\'moviedetail.ml?open=false&id='+list[check].id +'\'"><a href="#" class="btn btn-danger" id="hiddenMovie" style="float:right; margin-bottom:8px;">숨김</a>';
			text += '<h3 style="clear:right;" class="centeredText"><b>' + list[check].original_title + '</b></h3>\n';
			
			text += ' <div>';
			text += '<span class="fa fa-star"></span>';
			text += '<span class="fa fa-star"></span>';
			text += '<span class="fa fa-star"></span>';
			text += '<span class="fa fa-star"></span>';
			text += '<span class="fa fa-star"></span>';
			text += ' </div>';
			text +='</div>\n';
			text += '<h5>' + list[check].original_title + '</h5>';
		
			text += '</div>';
			listsize ++;
			check++;
			}else{
				break outer;
			}
				
			}
			text += '</div>';
			
		}
		else{
			//listsize 가 4로 나누어 떨어지지 않았을 경우 빈 영화아이템이 있다는 뜻임
			//4 - (listsize % 4) 로 몇개의 공간이 비어있는지 체크
			var add = 4 - (listsize % 4);
			//alert(add+"개의 공간이 비어있습니다.");

			
			
			//빈 공간만큼 추가하기
			for (var j = 0; j < add; j++) {

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
							50)
							+ '...';
					text += '<div class="col-xs-3">';
					
					text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
					text += '<div class="centered" Onclick="location.href=\'moviedetail.ml?open=false&id='+list[check].id +'\'"><a href="#" class="btn btn-danger" id="hiddenMovie" style="float:right; margin-bottom:8px;">숨김</a>';
					text += '<h3 style="clear:right;" class="centeredText"><b>' + list[check].original_title + '</b></h3>\n';
		
					text += ' <div>';
					text += '<span class="fa fa-star"></span>';
					text += '<span class="fa fa-star"></span>';
					text += '<span class="fa fa-star"></span>';
					text += '<span class="fa fa-star"></span>';
					text += '<span class="fa fa-star"></span>';
					text += ' </div>';
					text +='</div>\n';
					text += '<h5>' + list[check].original_title + '</h5>';
				
					text += '</div>';
					listsize ++;
					check++;
				}
				
			}
			
		
			//빈 공간만큼 추가하기
			$('.movieList > .row:last').html($('.movieList > .row:last').html()+text);
			
			//채운만큼 리스트삭제하기
			 list.splice(0, check);
			
			//빈 공간이 채워졌으면 다시 printMovie이동
			printMovie(list);
			return; 
		}

		console.log('check : '+ check);
		
		if(page == 1)
		$('.movieList').html(text);
		else
		$('.movieList').html($('.movieList').html()+text);	
		
	}
	
	
	$('.more').click(function(){
		searchList();
	});
	
	
	mybutton = document.getElementById("myBtn");

	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	    mybutton.style.display = "block";
	  } else {
	    mybutton.style.display = "none";
	  }
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	  document.body.scrollTop = 0; // For Safari
	  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	}
	
</script>
</html>