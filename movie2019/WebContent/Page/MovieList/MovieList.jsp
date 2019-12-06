<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">



<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="css/MovieList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



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

<!-- 
첫 로딩떄는 option 파라미터만 있으면 됨
option이 뭔지에 따라 인기/최신/예정이 다름
장르도 뒤에 붙음 -->
<%
	boolean open = Boolean.parseBoolean(request.getParameter("open"));
%>
<title>VOSHU</title>
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

		<div class="all container">

	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	
			<div class="row">
				<div class="form-group col-xs-2">
					<select class="form-control" id="sel1">
						<option value=1>인기순</option>
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
	

	var sort1 = ${option};
	
	$('#sel1').val(sort1).prop("selected", true); 
	var sort2 = 0;
	var page = 1;
	var listsize = 0; //필터링으로 인한 영화 빈거 채우려고
	var more = ${more};
	

	var list = new Array();

	<c:forEach items="${list}" var="item2">
	

	
	list.push({
		poster_path : "${item2.poster_path}",
		id : "${item2.id}",
		original_title : "${item2.original_title}",
		title : "${item2.title}",
		Star : "${item2.star}"
	});
	</c:forEach>
	
	
	printMore(more);				
	printMovie(list);
	
	
	function readyList(){
	//api 접근해서 목록 만들기
	
	page ++;
	var link ='<%=request.getContextPath()%>/MovieList.ml?re=true&option='+sort1;
		link += '&page='+page;

	

		//장르 필터
		if (sort2 != 0) {
			link += '&genre=' + sort2;
		}

		console.log('이동할 페이지 :' + page + "," + link+",sort2 확인"+sort2);

		$.ajax({
			url : link, 
			dataType : 'json',
			cache : false,
			success : function(data) {

				var list = data.results;
				allpages = data.total_pages;
				console.log('list.length:'+list.length);
				printMore(data.more);				
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
		listsize = 0;
		page = 0;
		readyList();
		$('.page-link:eq(1)').text(1);
		$('.page-link:eq(2)').text(2);
		$('.page-link:eq(3)').text(3);
	});

	$('#sel2').change(function() {
		var value = $(this).val();
		sort2 = value;
		page = 0;
		readyList();
	});
	
	
	$('.more').click(function(){
		readyList();
	});
	


	
	//api 결과가 20개가 아닌 경우 결과의 끝이라고 보고 더보기 숨김
	function printMore(size){
		if(!size)
			$('.more').css('visibility','hidden');
		else
			$('.more').css('visibility','visible');
	}
	
	function printMovie(list) {

		var text = '';
		var check = 0; //필터링으로 인한 list의 몇번쨰 아이템인지 아려고
		
	
		if(listsize == 0 || listsize % 4 == 0)
			outer : for (var i = 0; i < 5; i++) {

			text += '<div class="row">';

			for (var j = 0; j < 4; j++) {

				if (check < list.length) {
					
					text += '<div class="col-xs-3">';
					
					text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
					
					list[check].title = list[check].title.replace(/\"/gi, "");
					list[check].title = list[check].title.replace(/\'/gi, "");
					
					
					text += '<div class="centered" Onclick="location.href=\'moviedetail.ml?open=false&id='+list[check].id 
							+'&title='+list[check].title+'&poster_path='+list[check].poster_path+'\'">';
					text += '<h3 style="clear:right;" class="centeredText"><b>' + list[check].title + '</b></h3>\n';
		
					text += ' <div>';
					for(var k =0; k < list[check].Star; k++)
						text += '<span class="fa fa-star"></span>';
					
					text += ' </div>';
					text +='</div>\n';
					text += '<h5>' + list[check].title + '</h5>';
				
					text += '</div>';
					listsize ++;
					check++;
				}else{
					break 	outer;
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
				

					text += '<div class="col-xs-3">';
					
					
					list[check].title = list[check].title.replace(/\"/gi, "");
					list[check].title = list[check].title.replace(/\'/gi, "");
					
					
					text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
					text += '<div class="centered" Onclick="location.href=\'moviedetail.ml?open=false&id='
							+list[check].id +'&title='+list[check].title+"&poster_path="+list[check].poster_path+'\'">';
					text += '<h3 style="clear:right;" class="centeredText"><b>' + list[check].title + '</b></h3>\n';
		
					text += ' <div>';
					for(var k =0; k < list[check].Star; k++)
						text += '<span class="fa fa-star"></span>';
					
					text += ' </div>';	
					text +='</div>\n';
					text += '<h5>' + list[check].title + '</h5>';
				
					text += '</div>';
					listsize ++;
					check++;
				}
				
			}
			
			
			
			if(page == 1)
				$('.movieList').html(text);
			else
			$('.movieList > .row:last').html($('.movieList > .row:last').html()+text);
			
			//채운만큼 리스트삭제하기
			 list.splice(0, check);
			
			//빈 공간이 채워졌으면 다시 printMovie이동
			printMovie(list);
			return; 
		}
	
		
		if(page == 1)
			$('.movieList').html(text);
			else
			$('.movieList').html($('.movieList').html()+text);	
			
	
	}
	
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