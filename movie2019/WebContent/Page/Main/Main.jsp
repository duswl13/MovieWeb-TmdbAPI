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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Page/Main/Mainstyle.css">

</head>
<body>

	<div class="wrapper">
		<!-- Sidebar Holder -->
		<!-- active : 사이드 바의 너비를 사용하여 필요하지 않은 요소를 화면 밖으로 밀어냅니다.  -->
		<nav id="sidebar" class="active">
		<div class="sidebar-header">
			<h3>
				<a href="#" onclick="load(0);">VOSHU</a>

			</h3>

		</div>
		<input type="text" id="search-form" class="btn-search"
			placeholder="Search">
		<ul class="list-unstyled components">


			<!--
					data-toggle="collapse" : 접을수 있는 toggle 효과 사용 
					dropdown-toggle : 접을수있다는 표시(삼각형 이미지 제공)
					href="#homeSubmenu" : 펼치면 homeSubmenu 아이디의 li를 보여줌
					드롭다운 메뉴homeSubmenu 에서도 collapse class가 적용되어있어야함 -->
			<li class="active"><a href="#homeSubmenu" data-toggle="collapse"
				aria-expanded="false" class="dropdown-item">영화</a>
				<ul class="collapse list-unstyled" id="homeSubmenu">
					<li><a href="#">인기</a></li>
					<li><a href="#">최신</a></li>
					<li><a href="#">평점</a></li>
				</ul></li>
			<li><a href="#" onclick="load(1);">추천</a></li>
			<li><a href="#" onclick="load(2);">게시판</a></li>

			<li class="active"><a href="#pageSubmenu" data-toggle="collapse"
				aria-expanded="false" class="dropdown-item">마이페이지</a>
				<ul class="collapse list-unstyled" id="pageSubmenu">
					<li><a href="#" onclick="load(3);">내 정보 수정</a></li>
					<li><a href="#" onclick="load(4);">관심 컨텐츠</a></li>
					<li><a href="#" onclick="load(5);">내 리뷰 관리</a></li>
					<li><a href="#" onclick="load(6);">숨김 컨텐츠 관리</a></li>
				</ul></li>
			<li><a href="#" onclick="load(7);">공지사항</a></li>



		</ul>


		<button type="button" class="btn-search" id="login">Login</button>
		<!-- Search bar --> </nav>

		<!-- Page Content Holder -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container-fluid" style="font-size: 50px;color: yellow">

				<!-- Menu button -->
				<button type="button" id="sidebarCollapse" class="navbar-btn active">
					<span></span> <span></span> <span></span>
				</button>





			</div>
			</nav>

			<div id="field"></div>

		</div>
	</div>


	<!-- jQuery CDN -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!-- 	<script type="text/javascript"
		src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
	<!-- Bootstrap Js CDN -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
			$('#field').load("<%=request.getContextPath()%>/Page/MainPage/MainPage.html");

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});

			
			$('#login').click(function(){
				
				location.href="<%=request.getContextPath()%>/Page/Login/login.html";
				
			});
		
			function load(index){
				
				var link = '';
				
				if(index == 0){
					$(".container-fluid").empty();
					link = '/Page/MainPage/Mainpage.html';
				}
				if(index == 1){
					$(".container-fluid").empty();
					link = "/list.ch";
				}
				if(index == 2){
					$(".container-fluid").empty();
					link = '/Page/Board/NewFile.html';
				}
				if(index == 3){
					$(".container-fluid").empty();
					link = '/Page/MyPage/MyInfo/MyInfo.jsp';	
					$('.container-fluid').html("내 정보 수정");
				}
				if(index == 4){
					$(".container-fluid").empty();
					link = '/Page/MyPage/MyInfo/MyInfo.jsp';
					$('.container-fluid').html("관심 컨텐츠");
				}
				if(index == 5){
					$(".container-fluid").empty();
					link = '/Page/MyPage/MyInfo/MyInfo.jsp';
					$('.container-fluid').html("내 리뷰 관리");
				}
				if(index == 6){
					$(".container-fluid").empty();
					link = '/Page/MyPage/MyInfo/MyInfo.jsp';
					$('.container-fluid').html("숨김 컨텐츠 관리");
				}
				if(index == 7){
					$(".container-fluid").empty();
				}
			$('#field').load("<%=request.getContextPath()%>" + link);

		}
	</script>
</body>
</html>