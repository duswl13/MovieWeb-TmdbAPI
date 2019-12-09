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

p>input{
	width:50%;
	float : right;
}

button{
	float : right;
}


ul.ks-cboxtags {
    list-style: none;
    padding: 10px;
}
ul.ks-cboxtags li{
  display: inline;
}
ul.ks-cboxtags li label{
    display: inline-block;
    background-color: rgba(255, 255, 255, .9);
    border: 2px solid rgba(139, 139, 139, .3);
    color: #adadad;
    border-radius: 25px;
    margin: 3px 0px;
    transition: all .1s;
}

ul.ks-cboxtags li label {
    padding: 4px 6px;
    cursor: pointer;
}

ul.ks-cboxtags li label::before {
    display: inline-block;
    -webkit-font-smoothing: antialiased;
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 12px;
   
    transition: transform .1s ;
}

ul.ks-cboxtags li input[type="checkbox"]:checked + label::before {
    
    transform: rotate(-360deg);
    transition: transform .1s;
}

ul.ks-cboxtags li input[type="checkbox"]:checked + label {
    border: 2px solid #a1c0d6;
    background-color: #a1c0d6;
    color: #fff;
    transition: all .1s;
}

ul.ks-cboxtags li input[type="checkbox"] {
  position: absolute;
  opacity: 0;
}
ul.ks-cboxtags li input[type="checkbox"]:focus + label {
  border: 2px solid #a1c0d6;
}





</style>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/myinfomodi.js" charset="UTF-8"></script>
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
      <span style="font-size: 30px; cursor: pointer; color: white;"
         onclick="openNav()">&#9776;</span>
       
<div class="container">    
<c:set var="u" value="${userinfo }"/>                       				
<c:set var="p" value="${posterinfo }"/>   
	<form action="user_editaction.mu"  method="post" name="user_edit">
		<div class="row">
			<div class="panel panel-default" style="margin:0 auto;">
				<div class="panel-heading" style="background-color : white; ">  <h4>나의 정보 수정</h4></div>
					<div class="panel-body" style="background-color : white; ">
						<div class="col-xs-6 col-sm-3">
						<c:if test="${empty p.USER_POSTER}">
							<img alt="poster" src="Page/MyPage/MyInfo/defualt_poster.png" 
							id="poster" class="img-thumbnail img-responsive" style="width:80%;"> 
						</c:if>
						<c:if test="${not empty p.USER_POSTER}">
                        	<img alt="poster" src="https://image.tmdb.org/t/p/w300/${p.USER_POSTER}" 
                       			id="poster" class="img-thumbnail img-responsive" style="width:80%;"><br>
						</c:if>
							<input name="HIDDEN_POSTER" id="hidden_postser"  type="hidden" >
							<input name="SEACH_MOVIE" id="movie_name"  type="text" placeholder="영화제목을  입력하세요">
		                 	<button type="button" style="background:none;border:none;" name="SEARCH_BAR" id="search_bar">
		                 	<span class="glyphicon glyphicon-search one"></span></button><br>
                    		<p style="font-size: 13px;">[대표 포스터 변경 방법]</p>
                    		<p style="font-size: 12px;">상단 검색 바에 영화 제목을 입력하고 돋보기 버튼을 클릭하세요</p>
                      	</div>
                      	<div class="col-xs-6 col-sm-6" >
                           	<hr>
                          	<ul class="container details" >
                            <li><p><span class="glyphicon glyphicon-user one" style="width:50px;"></span>
                            	ID : <input style="padding-left: 5px; background-color:#f5f5f5;" name="INFO_ID" id="info_id" value="${u.USER_ID }" readOnly type="text"></p></li>
                            <li><p><span class="glyphicon glyphicon-star one" style="width:50px;"></span>
                            	비밀번호 : <input style="padding-left: 5px;" name="INFO_PASS" id="info_pass" type="password" required></p></li>
                            <li><p><span class="glyphicon glyphicon-star-empty one" style="width:50px;"></span>
                            	비밀번호 확인 : <input style="padding-left: 5px;" name="INFO_PASS_CHECK" id="info_pass_check" type="password" required></p></li>
                            <div style="width:100%;">&nbsp;<span style="width:50%; float : right;" id="pass_message"></span></div>
                            <li><p><span class="glyphicon glyphicon-envelope one" style="width:50px;"></span>
                            	이메일 : <input style="padding-left: 5px;" name="INFO_EMAIL" id="info_email" value="${u.USER_EMAIL }" type="text" required></p></li>
                            <div style="width:100%;">&nbsp;<span style="width:50%; float : right;" id="email_message"></span></div>
                            <li><p><span class="glyphicon glyphicon glyphicon-phone one" style="width:50px;"></span>
                            	핸드폰 번호 : <input style="padding-left: 5px;" name="INFO_PHONE" id="info_phone" value="${u.USER_PHONE }" type="text" required></p></li>
                          	<div style="width:100%;">&nbsp;<span style="width:50%; float : right;" id="phone_message"></span></div>
                          </ul>
                          <hr>
                          <ul class="container details" >
                             <c:set var="g" value="${genresinfo }"/>                       				
                             <li><p><span class="glyphicon glyphicon-heart-empty one" style="width:50px;"></span>선호 장르를 3개 이상 선택하세요</p></li>
                          </ul>
                            <ul class="ks-cboxtags">
						      <li><input type=checkbox name=INFO_GENRES id=action value="28">
						      <label for="action">액션</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=adventure value="12">
						      <label for="advanture">모험</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=animation value="16">
						      <label for="animation">애니메이션</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=comedy value="35">
						      <label for="comedy">코미디</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=crime value="80">
						      <label for="crime">범죄</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=documentary value="99">
						      <label for="documentary">다큐멘터리</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=drama value="18">
						      <label for="drama">드라마</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=family value="10751">
						      <label for="family">가족</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=fantasy value="14">
						      <label for="fantasy">판타지</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=history value="36">
						      <label for="history">역사</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=horror value="27">
						      <label for="horror">공포</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=music value="10402">
						      <label for="music">음악</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=mystery value="9648">
						      <label for="mystery">미스터리</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=romance value="10749">
						      <label for="ramance">로맨스</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=sf value="878">
						      <label for="sf">SF</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=tv value="10770">
						      <label for="tv">TV영화</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=thriller value="53">
						      <label for="thriller">스릴러</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=war value="10752">
						      <label for="war">전쟁</label></li>
						      <li><input type=checkbox name=INFO_GENRES id=western value="37">
						      <label for="western">서부</label></li>
						  </ul>
						</div>
                        <div class="col-xs-6 col-sm-3" style="margin-top:450px;" >
                        <div id="ed">
	                        <button type=submit style="background:none;border:none;">수정 완료   <span class="glyphicon glyphicon-edit one" style="width:50px;"></span></button>
	                        <button type=reset style="background:none;border:none;">수정 취소   <span class="glyphicon glyphicon-remove-circle one" style="width:50px;"></span></button>
                        </div>
                     </div>
      
                </div>
            </div>
            </div>
	</form>         
</div>
</div>
</body>
</html>