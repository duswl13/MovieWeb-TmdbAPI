<!-- 리뷰 클릭 시 첫 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
* {
	margin: 0px auto;
	padding: 0px;
}

body {
	background: #141414;
	font-family: montserrat, arial, verdana;
	color:#141414;
}

.prvlist {
  font-family: "Montserrat", sans-serif;
  font-weight: 300;
}

.prvlist h1, .prvlist h2, .prvlist h3, .prvlist h4, .prvlist h5, .prvlist h6 {
  color: #3e4555;
}

.prvlist .bg-white {
    background-color: white !important;
}

.prvlist .subtitle {
    color: #8d97ad;
    line-height: 24px;
}

/*칼럼 위치*/
.prvlist .col {
  margin-top: 60px;
  margin-left: 250px;
}

/*표정 위치*/
.prvlist .col .icon-space {
  margin: -55px 620 20px;
}

.prvlist .col .icon-space .icon-round {
  font-size: 45px;
  color: #ffffff;
}

.prvlist .bg-success-gradiant {
    background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

/*표정 크기*/
.prvlist .icon-round {
		width: 35px;
    line-height: 35px;
}

.prvlist .btn-success-gradiant {
		background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.prvlist .btn-success-gradiant:hover {
		background: #1dc8cc;
    background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc 0%, #2cdd9b 100%);
    background: -webkit-gradient(linear, left top, right top, from(#1dc8cc), to(#2cdd9b));
    background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);	
}

.prvlist .btn-md {
    padding: 15px 45px;
    font-size: 16px;
}

/*칼럼크기*/
.mb-4, .my-4 {
    margin-bottom: 1.5rem!important;
    width: 700px;
    height: 250px;
    padding: 10px;
}

.content {
 	width: 580px;
    height: 200px;
    margin: 15px;
}


/*폰트*/
.prvlist .mvtitle {
	font-weight: bold;
	color: #2cdd9b;
	text-align: right;
	
}

.prvtitle {
    font-size: 10pt;
    font-weight: bold;
}

.prvcontent {font-size:9pt;}

</style>


</head>
<body>

	<!-- 메뉴 부분  <script>는 body 아래에-->
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

<div id="main">
	

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>

		<h2></h2>

		<br>
<div class="prvlist">
    <div class="container">
    
        <!-- Row  -->
        <div class="row">
        
            <!-- Column -->
            <div class="col-md-4 col">
                <div class="card card-shadow border-0 mb-4">
                    <div class="p-4">
                        <div class="icon-space">
                            <img src="<%=request.getContextPath()%>/Png/happy1.svg" class="icon-round bg-white display-5 rounded-circle">
                        </div>
                        <div class=content>
                        <h6 class="mvtitle">겨울왕국2</h6>
                             <p class="prvtitle">심금을 울리는 영화</p>
                             <p class=prvcontent>렛잇고~ 아~아아아~ 두유워너빌더스노우맨~ 인투디언노운~~~ 렛잇고~ 아~아아아~ 두유워너빌더스노우맨~ 인투디언노운~~~ 렛잇고~ 아~아아아~ 두유워너빌더스노우맨~ 인투디언노운~~~ 렛잇고~ 아~아아아~ 두유워너빌더스노우맨~ 인투디언노운~~~ 렛잇고~ 두유워너빌더스노우맨~ 인투디언노운~~~ </p>
						</div> <!-- content end -->                 
                    </div>
                </div>
            </div>
            <br><br><br>
            
            <!-- Column -->
            <div class="col-md-4 col">
                <div class="card card-shadow border-0 mb-4">
                    <div class="p-4">
                        <div class="icon-space">
                             <img src="<%=request.getContextPath()%>/Png/happy1.svg" class="icon-round bg-white display-5 rounded-circle">
                        </div>
                        <div class=content>
                         <h6 class="mvtitle">타이타닉</h6>
                             <p class="prvtitle">명작</p>
                             <p class=prvcontent>역시... 명작... 아름다운...</p>
                   		</div> <!-- content end -->  
                    </div>
                </div>
            </div>
             <br><br><br>
             
            <!-- Column -->
            <div class="col-md-4 col">
                <div class="card card-shadow border-0 mb-4">
                    <div class="p-4">
                        <div class="icon-space">
                            <img src="<%=request.getContextPath()%>/Png/neutral.svg" class="icon-round bg-white display-5 rounded-circle">
                        </div>
                         <div class=content>
                        <h6 class="mvtitle">ㄴ무너무 무서운 영화</h6>
                        <p class="mt-3">너무 무서워서 제대로 보지도 못했다. 최악의 영화...</p>
                        </div> <!-- content end --> 
                    </div>
                </div>
            </div>
						<div class="col-md-12 mt-3 text-center">
                <a class="btn btn-success-gradiant text-white border-0 btn-md" href="#"><span>더보기</span></a>
            </div>
        </div>
    </div>
    
</div>
</div>
	<!-- 추가... -->

<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
</body>
</html>