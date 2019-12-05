<!-- 리뷰 클릭 시 첫 화면 -->
<!-- 이미지 들어가는 템플릿-->

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
}

.col {width:400px; height:300px;}

.service-18 {
  font-family: "Montserrat", sans-serif;
	color: #8d97ad;
  font-weight: 300;
}

.service-18 h1, .service-18 h2, .service-18 h3, .service-18 h4, .service-18 h5, .service-18 h6 {
  color: #3e4555;
}

.service-18 h6 {
		line-height: 26px;
    font-size: 21px;
}

.service-18 .font-weight-medium {
	font-weight: 500;
}


.service-18 .wrap-service-18 .icon-position {
  position: relative;
  background-size: cover;
  background-position: center center;
  min-height: 200px;
}

.service-18 .wrap-service-18 .icon-position .icon-round {
  position: absolute;
  right: -38px;
  top: 20px;
}

.service-18 .icon-round {
    width: 80px;
    line-height: 80px;
    text-align: center;
    border-radius: 100%;
    display: inline-block;
}

.service-18 .bg-success-gradiant {
    background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.service-18 .display-5 {
	font-size: 2.5rem;
}

.service-18 a {
    text-decoration: none;
}

.service-18 .linking {
    color: #3e4555;
}

.service-18 .linking:hover {
    color: #316ce8;
}

.service-18 .card-body {
	padding: 40px;
}

@media (max-width: 500px) {
	.service-18 .wrap-service-18 .icon-position .icon-round {
			top: 157px;
			right: 30px;
	}
}

.service-18 .btn-success-gradiant {
		background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.service-18 .btn-success-gradiant:hover {
		background: #1dc8cc;
    background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc 0%, #2cdd9b 100%);
    background: -webkit-gradient(linear, left top, right top, from(#1dc8cc), to(#2cdd9b));
    background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);	
}

.service-18 .btn-md {
    padding: 15px 45px;
    font-size: 16px;
}

h2, h3 {
	color: #edf1f2
}

button {
	width: 100px;
	height: 40px;
	line-height: 30px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 3px;
	cursor: pointer;
	margin: 10px 5px;
}

button:hover {
	opacity: 50%;
}
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


	

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>

		<h2>지금 이 순간,</h2>
		<h3>보슈의 다른 회원들은 어떤 영화를 보고, 또 평가하고 있을까요?</h3>
		<br><br>
		
<div class="py-5 service-18">
    <div class="container">
        <!-- row  -->
        <div class="row wrap-service-18">
            <!-- Column  -->
            <div class="col-lg-6">
                <!-- card  -->
                <div class="card border-0 mb-4">
                    <div class="row no-gutters">
                        <div class="col-md-5 icon-position rounded-left" style="background-image:url(https://ww.namu.la/s/a72cdf98b9e910668043d6a133cde88ad1208267475f3e3d9567b162603ac916f3ac729791c407322247af759da8288800e47368143694c3b5b95c7c90a8be5b76527f02bf679064cdfbe54246473261f655f781ed94ac6396b2c27862cfa2cdf82359498c0aa67689578922afe34f8e)">
                            <div class="icon-round bg-success-gradiant text-white display-5">^^</div>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body ml-0 ml-md-3">
                                <h6 class="font-weight-medium">심금을 울리는 영화</h6>
                                <p>완전 렛잇고</p>
                                 <p>${id}님의 리뷰</p>
                           		 <p>2019-12-15  </p>
                                 <a href="javascript:void(0)" class="linking text-underline">Lets Talk</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Column  -->
            <!-- Column  -->
            <div class="col-lg-6">
                <!-- card  -->
                <div class="card border-0 mb-4">
                    <div class="row no-gutters">
                        <div class="col-md-5 icon-position rounded-left" style="background-image:url(https://ww.namu.la/s/5570fd1083d5a897953712d1d6e7c64f737908c13d969e68045cb0600069716ec699991085e6eaf3f5baf716313284825f3662498528bf06b29996c1fe3f8b3d0c275248cad215fbf600e5c188cc4403d68d945c6fe9b87242634d5c35b95c6a4fa20ec166b4982598eeb2434307007f)">
                            <div class="icon-round bg-success-gradiant text-white display-5">ㅠㅠ</div>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body ml-0 ml-md-3">
                                <h6 class="font-weight-medium">미친 영화</h6>
                                <p>무서워요.</p>
                                  <p>${id}님의 리뷰</p>
                           		 <p>2019-12-15  </p>
                                <a href="javascript:void(0)" class="linking text-underline">Lets Talk <i class="ti-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Column  -->
            <!-- Column  -->
            <div class="col-lg-6">
                <!-- card  -->
                <div class="card border-0 mb-4">
                    <div class="row no-gutters">
                        <div class="col-md-5 icon-position rounded-left" style="background-image:url(https://newsimg.sedaily.com/2019/10/01/1VPCOEOZBK_1.jpg)">
                            <div class="icon-round bg-success-gradiant text-white display-5">--</div>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body ml-0 ml-md-3">
                                <h6 class="font-weight-medium">무엇</h6>
                                <p>ㅎ....</p>
                                  <p>${id}님의 리뷰</p>
                           		 <p>2019-12-15  </p>
                                <a href="javascript:void(0)" class="linking text-underline">Lets Talk</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Column  -->
            <!-- Column  -->
            <div class="col-lg-6">
                <!-- card  -->
                <div class="card border-0 mb-4">
                    <div class="row no-gutters">
                        <div class="col-md-5 icon-position rounded-left" style="background-image:url(https://t1.daumcdn.net/movie/676b7dbf7a2cf721d01efc61708493080d2a9d8e)">
                            <div class="icon-round bg-success-gradiant text-white display-5">ㅠㅠ</div>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body ml-0 ml-md-3">
                                <h6 class="font-weight-medium">명작</h6>
                                <p>역시... 명작은... 언제 봐도...</p>
                                 <p>${id}님의 리뷰</p>
                           		 <p>2019-12-15  </p>
                                <a href="javascript:void(0)" class="linking text-underline">Lets Talk <i class="ti-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Column  -->
        </div>
				<div class="row">
            <div class="col-md-12 mt-4 text-center">
                <a class="btn btn-success-gradiant btn-md border-0 text-white" href="#f18"><span>더보기</span></a>
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