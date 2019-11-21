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
<link rel="stylesheet" href="<%=request.getContextPath()%>/Page/Main/Mainstyle.css">

</head>
<body>

	<div class="wrapper">
		<!-- Sidebar Holder -->
		<!-- active : 사이드 바의 너비를 사용하여 필요하지 않은 요소를 화면 밖으로 밀어냅니다.  -->
		<nav id="sidebar" class="active">
		<div class="sidebar-header">
			<h3>
				<a href="#">VOSHU</a>

			</h3>
		
		</div>
		<input type="text" id="search-form"
			class="btn-search" placeholder="Search">
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
			<li><a href="#">추천</a></li>
			<li><a href="javascript:load();">게시판</a></li>

			<li class="active"><a href="#pageSubmenu" data-toggle="collapse"
				aria-expanded="false" class="dropdown-item">마이페이지</a>
				<ul class="collapse list-unstyled" id="pageSubmenu">
					<li><a href="#">내 정보</a></li>
					<li><a href="#">관심</a></li>
					<li><a href="#">리뷰</a></li>
					<li><a href="#">숨김</a></li>
				</ul></li>
			<li><a href="#">공지사항</a></li>



		</ul>


		<button type="button" class="btn-search" id="login">Login</button>
		<!-- Search bar -->  </nav>

		<!-- Page Content Holder -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container-fluid">

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
		$(document).ready(function() {

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});

			$('#field').load("<%=request.getContextPath()%>/Page/MainPage/MainPage.html");
		
			function load(){
		
					$('#field').load("<%=request.getContextPath()%>/Page/Board/NewFile.html");
				
			}
		
		});
	</script>
</body>
</html>