<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>
<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Page/Chu/Chu.css" type="text/css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		if(<%=open%>)
			document.getElementById("main").style.marginLeft = "250px";
		var currentPosition = parseInt($("#slidemenu").css("top"));
		$(window).scroll(function() { //현재창에서 스크롤 이벤트
			var position = $(window).scrollTop(); //스크롤 바에 위에
			
			
			$("#slidemenu").stop().animate({
				"top" : position + currentPosition + "px"}, 500);
		});
		
		 $('.customer-logos').slick({
		        slidesToShow: 6,
		        slidesToScroll: 1,
		        autoplay: true,
		        autoplaySpeed: 1500,
		        arrows: false,
		        dots: false,
		        pauseOnHover: false,
		        responsive: [{
		            breakpoint: 768,
		            settings: {
		                slidesToShow: 4
		            }
		        }, {
		            breakpoint: 520,
		            settings: {
		                slidesToShow: 3
		            }
		        }]
		    });
	});
	</script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
</head>
<body style="background-color: black;">

<h2 style="font-size: 1em;"></h2>
<!-- 시작부분 -->
	<div id="main">	
		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>
			
			<div class="accordian">
  <ul class="uc">
    <li>
      <div class="image_title">
        <a href="#">Wedding 1</a>
      </div>
      <a href="#">
     <img class="src1" >
			</a>
    </li>
       <li>
      <div class="image_title">
        <a href="#">Wedding 2</a>
      </div>
      <a href="#">
     <img class="src1">
			</a>
    </li>
          <li>
      <div class="image_title">
        <a href="#">Wedding 3</a>
      </div>
      <a href="#">
     <img class="src1">
			</a>
    </li>
             <li>
      <div class="image_title">
        <a href="#">Wedding 4</a>
      </div>
      <a href="#">
     <img class="src1">
			</a>
    </li>
                <li>
      <div class="image_title">
        <a href="#">Wedding 5</a>
      </div>
      <a href="#">
     <img class="src1">
			</a>
    </li>
  </ul>
</div>

<!-- 자동슬라이더 -->
<!-- <div class="container" style="height: 30%">
  <h2>Our  Partners/ Our Clients</h2>
   <section class="customer-logos slider">
      <div class="slide"><a href="#5"><img src="https://image.freepik.com/free-vector/luxury-letter-e-logo-design_1017-8903.jpg"></a></div>
      <div class="slide"><img src="http://www.webcoderskull.com/img/logo.png"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/3d-box-logo_1103-876.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/blue-tech-logo_1103-822.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/colors-curl-logo-template_23-2147536125.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/abstract-cross-logo_23-2147536124.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/football-logo-background_1195-244.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/background-of-spots-halftone_1035-3847.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/retro-label-on-rustic-background_82147503374.jpg"></div>
      
   </section>
    -->
    <div class="container" style="height: 30%">
  <h2 style="color: gray;">당신의 장르분석</h2>
   <section class="customer-logos slider">
    <c:forEach var="result" items="${gen}" begin="0" end="8" step="1">
      <div class="slide"><a href="moviedetail.ml?open=false&id=${result.id}&title=${result.title}">
      <img src="${image}${result.poster_path}"></a></div>
  </c:forEach>
</section>
   <div style="padding-top: 100px">
   <h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">zzzf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
   </div>
   </div>


		<div id="text"></div>
		<!-- 슬라이더 -->
		<div id="slidemenu">			
				<div class="boxOffice">					
					<p class="showRange" style="color: white; text-align: center;">전날 날짜 순위</p>
					<ul class="boxOfficeList"></ul>
				</div>		
			<div id="overlay">
				<div class="youtube"></div>
				<img class="close" src="Page/Chu/close_white.png">
			</div>
		</div>
		
		
		
		<script type="text/javascript" src="Page/Chu/chu.js"></script>


	</div>
</body>
</html>
