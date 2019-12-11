<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>
<title>마이페이지:내 정보 수정</title>
 
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
label {
	color: white;
	padding-right:50px;
}

p{
	color: grey;
}

container row{
	margin:0 auto;
	background-color: rgba( 255, 255, 255, 0.5 );
}
.panel{
	background-color: rgba( 255, 255, 255, 0.5 );
}
h4{
	text-align : center;
}

#ed{
	float:right;
}
#myModal{
	display:none;
	justify-content:center;
}
.modal{
	justify-content:center;
}
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
                left:0;
        }
}
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
#btn{
	text-align: right;
}
</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/myinfo.js" charset="UTF-8"></script>
<script>
$(function(){
	if(<%=open%>)
		document.getElementById("main").style.marginLeft = "250px";

});

</script>
</head>
<body style="background-color:black;">
<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>

<div id="main">
	<span style="font-size: 30px; cursor: pointer; color: white;" onclick="openNav()">&#9776;</span>
<c:if test="${empty id}">       
	<script>
		location.href = "<%=request.getContextPath()%>/Page/Login/login.jsp";
	</script>
</c:if>

<div class="container">    
<c:set var="u" value="${userinfo }"/>                       				
<c:set var="p" value="${posterinfo }"/>   
	<div class="row">
		<div class="panel panel-default" style="margin:0 auto;">
			<div class="panel-heading" style="background-color : white; ">  <h4><strong>나의 정보</strong></h4></div>
				<div class="panel-body" style="background-color : white; ">
					<div class="col-xs-6 col-sm-3">
					<c:if test="${empty p.USER_POSTER}">
						<img alt="poster" src="Page/MyPage/MyInfo/defualt_poster.png" 
						id="poster" class="img-thumbnail img-responsive" style="width:100%; margin-top:10px;"> 
					</c:if>
					<c:if test="${not empty p.USER_POSTER}">
						<img alt="poster" src="https://image.tmdb.org/t/p/w300/${p.USER_POSTER}" 
						id="poster" class="img-thumbnail img-responsive" style="width:100%; margin-top:10px;"> 
					</c:if>
                    </div>
                    <div class="col-xs-6 col-sm-6" ><hr>
                    	<ul class="container details" >
                        	<input type="hidden" name="USER_ID" value="${id }" id="USER_ID">
                            <li><p><span class="glyphicon glyphicon-user one" style="width:50px;"></span>ID : ${id }</p></li>
                            <li><p><span class="glyphicon glyphicon-envelope one" style="width:50px;"></span>이메일 : ${u.USER_EMAIL }</p></li>
                            <li><p><span class="glyphicon glyphicon glyphicon-phone one" style="width:50px;"></span>핸드폰 번호 : ${u.USER_PHONE }</p></li>
                            <li><p><span class="glyphicon glyphicon-time one" style="width:50px;"></span>가입일자 : ${u.USER_JOIN_DATE }</p></li>
                    	</ul><hr>
                        <ul class="container details" >
                        	<c:set var="g" value="${genresinfo }"/>                       				
                        	<li><p><span class="glyphicon glyphicon-heart-empty one" style="width:50px;"></span>관심 장르: <span id="genres">ㅎㅎ</span></p></li>
                        	<input type="hidden" name="MOVIE_ID" value="" id="genres2">
                        </ul>
                        <hr>
						</div>
                        <div class="col-xs-6 col-sm-3" style="margin-top:250px;" >
                        <div id="ed">
	                        <label><a href="user_editview.mu?user_id=${u.USER_ID }" style="color:black;" >정보 수정    <span class="glyphicon glyphicon-edit one" style="width:50px;"></span></a></label><br><br>
	                        <label><a href="#" style="color:black;" data-toggle="modal"	data-target="#myModal">회원 탈퇴    <span class="glyphicon glyphicon-minus-sign one" style="width:50px;"></span></a></label>
                        </div>
                     </div>     
                </div>
            </div>
            </div>
         </div>
<body>
	<!-- The Modal -->
	<div class="modal" id="myModal" style="left:-250px;;">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form name="deleteForm" action="user_delete.ul"
						method="post">
						<div class="form-group">
							<p>회원 탈퇴를 원하시면 비밀번호를 입력해주세요.</p>
							   <input type="password"
								class="form-control" placeholder="비밀번호를 입력하세요."
								name="USER_PASS" id="user_pass">
						</div>
						<div id="btn">
							<button type="submit" class="btn btn-danger">탈퇴하기</button>
							<button type="button" class="btn" data-dismiss="modal" style="background:#27AE60; color:white;">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</div>
</body>
</html>