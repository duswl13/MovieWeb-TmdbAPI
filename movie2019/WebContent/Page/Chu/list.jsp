<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
#slidemenu {
	background: black;
	position: absolute;
	width: 250px;
	top: 0px;
	right: 10px;
	height: 20%;
}

.title1{
 text-shadow: 2px 2px 2px black;
 color: white;
 
}
/* * {
	margin: 0;
	padding: 0;
}
 */
/* body {
	text-align: center;
	background: linear-gradient(#dec8f0, #90b7bd);
} */
.youtube {
	width: 50%;
	height: 360px;
	border: 1px solid gray;
	margin: 20px 10px;
}
 
.boxOfficeList {
	width: 100%;
	padding: 8px;
	list-style-position: inside;
	text-align: left;
	list-style-type: none;
}

.boxOfficeList li {
	width: 92%;
	margin: 5px 0px;
	background: rgb(189, 235, 212, 0.2);
	padding: 5px;
	cursor: pointer;
	background-repeat: no-repeat;
	background-position-x: right;
	background-position-y: 30%;
	background-size: cover;
	border: 1px solid rgb(161, 161, 161);
	height: 60px;
	
}

.boxOfficeList li:hover {
	background: rgb(240, 232, 128, .5);
	background-repeat: no-repeat;
	background-position-x: right;
	background-position-y: 30%;
	background-size: cover;
	border: 1px solid rgb(241, 159, 5);
} 
.rank {
	width: 85px;
	height: 50px;
	font-size: 23px;
	font-weight: bold;
	color: rgb(240, 232, 128);
	float: left;
	text-align: center;
	line-height: 23px;
	background: seagreen;
	margin-right: 7px;
	padding-top: 25px;
	border-radius: 50%;
}

/* * {
	margin: 0;
	padding: 0;
} */


/* 오버레이 실행시 뒷 배경 스크롤 방지 */
.stop-scrolling {
	/* height: 100%; */
	overflow: hidden;
}

h1 {
	width: 360px;
	margin: 0 auto;
	text-align: center;
	color: blueviolet;
	padding-top: 20px;
}

.subsubject {
	text-align: center;
}


.buttonWrapper {
	width: 100vs;
	text-align: center;
}

.more {
	width: 120px;
	padding: 8px 15px;
	margin: 10px auto;
}


/* 오버레이 설정 */
#overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: 999;
	/* 시작시 보이지 않게 처리 */
	visibility: hidden;
	opacity: 0;
	transition: all 0.5s;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

/* 오버레이를 보여 줄때 사용 */
#overlay.show {
	visibility: visible;
	opacity: 1;
}

.close {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 36px;
	margin: 0;
	padding: 0;
	cursor: pointer;
	margin: 8px auto;
}

/* 이건 테스크탑 기준 - 모바일은 따로 설정할 필요가 있다. */
.youtube {
	width: 60%;
	height: 60%;
}

iframe {
	display: block;
	width: 100%;
}

.noVideo {
	color: white;
}

/* 모바일 전용 */
@media ( max-width : 768px) {
	.youtube {
		width: 100%;
		height: 100%;
	}
	

}
/* 슬라이더 */
.accordian{
  width: 80%;
  height: 333px;
  overflow:hidden;
  
  margin: 100px auto;
  -webkit-box-shadow: 0 8px 6px -6px black;
  -moz-box-shadow: 0 8px 6px -6px black;
  box-shadow: 0px 8px 6px -6px black;
}


.accordian li{
  position: relative;
  display:block;
  width:140px;
  float: left;
  
  border-left: 1px solid #888;
  -webkit-box-shadow: 0 0 25px 10px rgba(0,0,0,0.5);
  -moz-box-shadow: 0 0 25px 10px rgba(0,0,0,0.5);
  
  transition: all 0.5s;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
}


.accordian ul:hover li{
  width: 50px;
}

.accordian ul li:hover{
  width:500px;
}

.accordian li img{
  display: block;
}

.image_title{
  background: rgba(0,0,0,0.5);
  position:absolute;
  left:0;
  bottom:0;
  width:500px;
}

.image_title a{
  display: block;
  color: #fff;
  text-decoration: none;
  padding:20px;
  font-size:16px;
}
/* 자동슬라이더 */
.slick-slide {
    margin: 0px 20px;
}

.slick-slide img {
    width: 100%;
}

.slick-slider
{
    position: relative;
    display: block;
    
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
            user-select: none;
    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
        touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.slick-list
{
    position: relative;
    display: block;
    overflow: hidden;
    margin: 0;
    padding: 0;
}
.slick-list:focus
{
    outline: none;
}
.slick-list.dragging
{
    cursor: pointer;
    cursor: hand;
}

.slick-slider .slick-track,
.slick-slider .slick-list
{
    -webkit-transform: translate3d(0, 0, 0);
       -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
         -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}

.slick-track
{
    position: relative;
    top: 0;
    left: 0;
    display: block;
}
.slick-track:before,
.slick-track:after
{
    display: table;
    content: '';
}
.slick-track:after
{
    clear: both;
}
.slick-loading .slick-track
{
    visibility: hidden;
}

.slick-slide
{
    display: none;
    float: left;
    height: 100%;
    min-height: 1px;
}
[dir='rtl'] .slick-slide
{
    float: right;
}
.slick-slide img
{
    display: block;
}
.slick-slide.slick-loading img
{
    display: none;
}
.slick-slide.dragging img
{
    pointer-events: none;
}
.slick-initialized .slick-slide
{
    display: block;
}
.slick-loading .slick-slide
{
    visibility: hidden;
}
.slick-vertical .slick-slide
{
    display: block;
    height: auto;
    border: 1px solid transparent;
}
.slick-arrow.slick-hidden {
    display: none;
}

.uc{
	padding-left: 250px;
	margin-right: 10px;
}

</style>
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
     <img src="http://farm3.staticflickr.com/2812/10121061143_e05f1619d7.jpg">
			</a>
    </li>
       <li>
      <div class="image_title">
        <a href="#">Wedding 2</a>
      </div>
      <a href="#">
     <img src="http://farm8.staticflickr.com/7435/10067483716_2b6a593ca8.jpg">
			</a>
    </li>
          <li>
      <div class="image_title">
        <a href="#">Wedding 3</a>
      </div>
      <a href="#">
     <img src="http://farm8.staticflickr.com/7310/10065811936_8debcccb71.jpg">
			</a>
    </li>
             <li>
      <div class="image_title">
        <a href="#">Wedding 4</a>
      </div>
      <a href="#">
     <img src="http://farm4.staticflickr.com/3715/10065692306_705364fa01.jpg">
			</a>
    </li>
                <li>
      <div class="image_title">
        <a href="#">Wedding 5</a>
      </div>
      <a href="#">
     <img src="http://farm4.staticflickr.com/3667/9759830873_7474bd9fc2.jpg">
			</a>
    </li>
  </ul>
</div>

<!-- 자동슬라이더 -->
<div class="container">
  <h2>Our  Partners/ Our Clients</h2>
   <section class="customer-logos slider">
      <div class="slide"><img src="https://image.freepik.com/free-vector/luxury-letter-e-logo-design_1017-8903.jpg"></div>
      <div class="slide"><img src="http://www.webcoderskull.com/img/logo.png"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/3d-box-logo_1103-876.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/blue-tech-logo_1103-822.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/colors-curl-logo-template_23-2147536125.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/abstract-cross-logo_23-2147536124.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/football-logo-background_1195-244.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/background-of-spots-halftone_1035-3847.jpg"></div>
      <div class="slide"><img src="https://image.freepik.com/free-vector/retro-label-on-rustic-background_82147503374.jpg"></div>
   </section>
   
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">zzzf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>
<h3 style="color: white;">wefwefafwesf</h3>


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
		
		
		
		<script>
const api_key = "4b3aa211760fe451c0edcb032c99f6b2";
const youtube = document.querySelector(".youtube");
    window.addEventListener('load', () => {
        const key= "aa66c5868406af2e316790e9ab3eadb7";
        //어제 날짜 구하기
        var newDate = new Date();
    	var year = newDate.getFullYear();
    	var mon = newDate.getMonth()+1;
    	if(mon<10){
    		mon = "0"+mon;
    	};
    	var day = newDate.getDate()-1;
    	if(day<10){
    		day = "0"+day;
    	};
    	//어제날짜
    	const y = year+""+mon+""+day;
        const apiUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="+key+"&targetDt="+y;
        const myUl = document.querySelector('.boxOfficeList');
        const overlay = document.querySelector("#overlay");
        const photoCon = document.querySelector(".photo");
        const closeButton = document.querySelector(".close");
        const xhr = new XMLHttpRequest(); //리퀘스트 객체를 만든다.
        
        closeButton.addEventListener('click', () => {
            overlay.classList.remove("show");
            youtube.innerHTML = "";
            //스크롤 방지 해제
            document.body.classList.remove("stop-scrolling");
        });
        
        
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                const jsonObj = JSON.parse(xhr.response);        
                const boxOfficeResult = jsonObj['boxOfficeResult'];                       
                const movieList = boxOfficeResult['dailyBoxOfficeList'];
                movieList.forEach(element => {
                	const base_url = "https://image.tmdb.org/t/p/w300/";
                    const searchUrl = "https://api.themoviedb.org/3/search/movie?api_key="+api_key+"&language=ko-Kr&page=1&include_adult=false&query="+element['movieNm'];
                    //console.log(searchUrl);
                    fetch(searchUrl).then(res=>res.json()).then(function(res){
                    //console.log(res);
                    //화면 디자인에 따라 필요한 DOM 요소들을 생성해 준다.
                    const myLi = document.createElement('li');
                    const output = "<div><h2 style='font-size: 1em;' class='title1'>"+element['movieNm']+"</h2></div>";
                    myLi.innerHTML = output;
                   // console.log(res.results[0].id);
                    //myLi.setAttribute("onClick","viewTrailer("+res.results[0].id+','+base_url+""+res.results[0].poster_path+")");
                    myLi.setAttribute("onClick","viewTrailer("+"'"+res.results[0].id+"'"+","+"'"+base_url+""+res.results[0].poster_path+"'"+")");
                    myLi.style.backgroundImage = "url("+"'"+base_url+""+res.results[0].poster_path+"'"+")";
                    myUl.appendChild(myLi);
        
                }).catch(e=>console.log(e));
                //console.log(movieList);

            });
            }
        }
        xhr.open('GET', apiUrl, true);
        xhr.send();
        
       
    });

    function viewTrailer(movieId,poster) {
    	console.log(poster);
		console.log(movieId);
    	const movieUrl= "https://api.themoviedb.org/3/movie/"+movieId+"/videos?api_key="+api_key
    	fetch(movieUrl).then(res=>res.json()).then(function(res){
    		//console.log(res.results[0].key);
    		
    		let output="";
    		if(res.results.length>0){
    			const youtubeId = res.results[0].key;
    			//console.log(res.results[0].key);
    			output="<iframe width='100%' height='100%' src='https://www.youtube.com/embed/"+youtubeId+"?autoplay=1'></iframe>";
    			//console.log(output);
    		}else{
    			output="<h3 class='noVideo'>재생할 예고편이 없습니다.</h3>";
    		}
    		youtube.innerHTML = output;    		
    	}).catch(e=>console.log(e));
    	
    	  overlay.classList.add("show");
         
         overlay.setAttribute("style", "background-image: url('"+poster+"'); background-size: auto; background-repeat: no-repeat;");
         //배경 body 스크롤 중지
         document.body.classList.add("stop-scrolling"); 
	};
</script>


	</div>
</body>
</html>
