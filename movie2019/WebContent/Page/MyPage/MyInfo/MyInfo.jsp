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
      <span style="font-size: 30px; cursor: pointer; color: white;"
         onclick="openNav()">&#9776;</span>
       
 <div class="container">    
 <%session.setAttribute("id","admin1"); %>
 
                  <div class="row">
                      <div class="panel panel-default" style="margin:0 auto;">
                      <div class="panel-heading" style="background-color : white; ">  <h4>나의 정보</h4></div>
                       <div class="panel-body" style="background-color : white; ">
                      <div class="col-xs-6 col-sm-3">
                       <img alt="User Pic" src="Page/images/winter.jpg" 
                       			id="profile-image1" class="img-thumbnail img-responsive" style="width:80%;"> 
                     
                 
                      </div>
                      <div class="col-xs-6 col-sm-6" >
                          <div class="container" >
                       		<c:set var="u" value="${userinfo }"/>                       				
                            <h2>${u.USER_NICKNAME }</h2>         
                          </div>
                           <hr>
                          <ul class="container details" >
                         	<input type="hidden" name="USER_ID" value="${u.USER_ID }" id="USER_ID">
                            <li><p><span class="glyphicon glyphicon-user one" style="width:50px;"></span>ID : ${u.USER_ID }</p></li>
                            <li><p><span class="glyphicon glyphicon-envelope one" style="width:50px;"></span>이메일 : ${u.USER_EMAIL }</p></li>
                            <li><p><span class="glyphicon glyphicon glyphicon-phone one" style="width:50px;"></span>핸드폰 번호 : ${u.USER_PHONE }</p></li>
                            <li><p><span class="glyphicon glyphicon-time one" style="width:50px;"></span>가입일자 : ${u.USER_JOIN_DATE }</p></li>
                          </ul>
                          <hr>
                          <ul class="container details" >
                             <c:set var="g" value="${genresinfo }"/>                       				
                             <li><p><span class="glyphicon glyphicon-heart-empty one" style="width:50px;"></span>관심 장르: <span id="genres">ㅎㅎ</span></p></li>
                          </ul>
						</div>
                        <div class="col-xs-6 col-sm-3" style="margin-top:250px;" >
                        <div id="ed">
	                        <label><a href="user_edit.mu">정보 수정    <span class="glyphicon glyphicon-edit one" style="width:50px;"></span></a></label><br><br>
	                        <label><a href="user_delete.mu">회원 탈퇴    <span class="glyphicon glyphicon-minus-sign one" style="width:50px;"></span></a></label>
                        </div>
                     </div>
      
                </div>
            </div>
            </div>
         
</div>
</body>
</html>