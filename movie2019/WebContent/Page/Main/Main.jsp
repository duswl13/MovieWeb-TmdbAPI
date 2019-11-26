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
<link rel="stylesheet" href="css/Mainstyle.css">

<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--    <script type="text/javascript"
      src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
<script>
function enterkey() {
    if (window.event.keyCode == 13) {
    	var link ='/Search.ml?key='+$('#search-form').val().replace(/(\s*)/g, "");
		$('#field').load("<%=request.getContextPath()%>" + link);
    }
}

</script>


</head>


<body>


	<!-- header -->
	<div class="wrapper">
		<!-- Sidebar Holder -->
		<!-- active : 사이드 바의 너비를 사용하여 필요하지 않은 요소를 화면 밖으로 밀어냅니다.  -->
		<nav id="sidebar" class="active">
		<div class="sidebar-header">
			<h3>
				<a href="#" onclick="load(0);"><img
					src="<%=request.getContextPath()%>/Page/Main/logo2.gif" width="100"></a>
			</h3>


		</div>
		<input type="text" id="search-form" class="btn-search"
			placeholder="Search" onkeyup="enterkey();">
		<ul class="list-unstyled components">


			<!--
               data-toggle="collapse" : 접을수 있는 toggle 효과 사용 
               dropdown-toggle : 접을수있다는 표시(삼각형 이미지 제공)
               href="#homeSubmenu" : 펼치면 homeSubmenu 아이디의 li를 보여줌
               드롭다운 메뉴homeSubmenu 에서도 collapse class가 적용되어있어야함 -->
			<li><a href="#" onclick="load(-1);">영화</a></li>
			<li><a href="#" onclick="load(1);">추천</a></li>
			<li><a href="#" onclick="load(-3);">리뷰</a></li>
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



			<li class="active"><a href="#adminSubmenu"
				data-toggle="collapse" aria-expanded="false" class="dropdown-item">관리자페이지</a>
				<ul class="collapse list-unstyled" id="adminSubmenu">
					<li><a href="#" onclick="load(8);">공지사항 관리</a></li>
					<li><a href="#" onclick="load(9);">FAQ 관리</a></li>
					<li><a href="#" onclick="load(10);">회원 관리</a></li>
				</ul></li>

		</ul>






		<button type="button" class="btn-search" id="login">Login</button>
		<!-- Search bar --> </nav>

		<!-- Page Content Holder -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container-fluid" style="font-size: 50px; color: yellow">

				<!-- Menu button -->
				<button type="button" id="sidebarCollapse" class="navbar-btn active">
					<span></span> <span></span> <span></span>
				</button>



				<span class="title" style="font-size: 50px; color: yellow"> </span>


			</div>
			</nav>

			<div id="field"></div>

		</div>
	</div>

	<!-- Footer -->
	<footer class="page-footer main-footer1"> <!-- Copyright -->
	<div class="footer-copyright text-center py-3">
		© 2020 Copyright: 운명이조 김건수 손연수 이지연 장연지 홍찬미</a>
	</div>
	<!-- Copyright --> </footer>
	<!-- Footer -->
</body>






<script type="text/javascript">
   
   		<%
   			int load = 0;
			int option = 0;
			int id = 0;
			if (request.getParameter("load") != null)
				load = Integer.parseInt(request.getParameter("load"));

			if (load == -1) {
				if (request.getParameter("option") != null)
					option = Integer.parseInt(request.getParameter("option"));%>
   			load(-1);
   		<%}else if(load == -2){
   		if (request.getParameter("id") != null){
   			id = Integer.parseInt(request.getParameter("id"));%>
   			load(-2);
   		<%}
   		} else {%>
   		load(0);
   		<%}%>

         
         
         
         $('#sidebarCollapse').on('click', function() {
            $('#sidebar').toggleClass('active');
            $(this).toggleClass('active');
         });


         $('#login').click(function(){
            
            location.href="<%=request.getContextPath()%>/Page/Login/login.html";
            
         });
      
         
       
		
			function load(index){
				
				var link = '';
			
				 
			      if(index == -3){
		                $(".title").empty();
		                  link = '/Page/Review/r_list.jsp';         
		               }
			      if(index == -2){
		                $(".title").empty();
		                  link = '/MovieDetail.ml?id=<%=option%>';         
		               }
		             
		            if(index == -1){
		                $(".title").empty();
		               link = '/MovieList.ml?option=<%=option%>';
		               
		            }if(index == 0){
		                $(".title").empty();
		                  link = '/MainPage.ml';
		            }
		            if(index == 1){
		                $(".title").empty();
		               link = "/list.ch";
		            }
		            if(index == 2){
		                $(".title").empty();
		               link = '/Page/Board/NewFile.html';
		            }
		               if(index == 3){
		                $(".title").empty();
		                   link = '/Page/MyPage/MyInfo/MyInfo.jsp';   
		                   $('.title').html("내 정보 수정");
		                }
		                if(index == 4){
		                $(".title").empty();
		                   link = '/Page/MyPage/Like/Like.jsp';
		                   $('.title').html("관심 컨텐츠");
		                }
		                if(index == 5){
		                $(".title").empty();
		                   link = '/Page/MyPage/MyReview/MyReview.jsp';
		                   $('.title').html("내 리뷰 관리");
		                }
		                if(index == 6){
		                $(".title").empty();
		                   link = '/Page/MyPage/Hidden/Hidden.jsp';
		                   $('.title').html("숨김 컨텐츠 관리");
		                }
		            if(index == 7){
		            	link = "/list.gong";
		                $(".title").empty();
		            }
		            if(index == 8){
		                   $(".title").empty();
		                      link = '/Page/AdminPage/FAQ/FAQList.jsp';
		                      $('.title').html("공지사항 관리");
		                   }
		                  if(index == 9){
		                   $(".title").empty();
		                      link = '/Page/AdminPage/Notice/NoticeList.jsp';
		                      $('.title').html("FAQ 관리");
		                   }
		                  if(index == 10){
		                   $(".title").empty();
		                      link = '/Page/AdminPage/UserList/UserList.jsp';
		                      $('.title').html("회원 관리");
		                   }
		            
		      
		         $('#field').load("<%=request.getContextPath()%>" + link);

	}
</script>




</html>