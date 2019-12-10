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
   color:#141414;
}

.center-block {
	display: flex;
	justify-content: center; /*가운데정렬*/
}

.col {width:400px; height:300px;}

.rvlist {
  font-family: "Montserrat", sans-serif;
  font-weight: 300;
}

.rvlist h1, .rvlist h2, .rvlist h3, .rvlist h4, .rvlist h5, .rvlist h6 {
  color: #3e4555;
}

.rvlist h6 {
   line-height: 26px;
    font-size: 21px;
}

.rvlist .rvtitle {
    font-size: 10pt;
    font-weight: bold;
}

.rvcontent {font-size:9pt;}

.rvbottom1, .rvbottom2 {color:#141414; font-size:8pt;}

/*왼쪽 이미지*/
.rvlist .wrap-rvlist .icon-position {
    position: relative;
    background-size: cover;
    background-position: center center;
    max-height: 250px;
    min-height: 250px;
}

/*가운데 동글 아이콘*/
.icon-round {
    width: 35px;
    height: 35px;
    line-height: 28px;
    text-align: center;
    border-radius: 100%;
    display: inline-block;
    position: absolute;
    right: -18px;
    top: 13px;
    max-height: 300px;
}


.bg-gradiant {
    background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.rvlist .display-5 {
   font-size: 2.5rem;
}

a {
   color:#1dc8cc;
    text-decoration: none;
}

a:hover {
   color:#2cdd9b;
    text-decoration: none;
}

@media (max-width: 300px) {
   .rvlist .wrap-rvlist .icon-position .icon-round {
         top: 157px;
         right: 30px;
   }
}


.btn
{   width:150px;
   height: 40px;
   line-height: 40px;
   padding:0px;}
   
.btn-gradiant {
      background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.btn-gradiant:hover {
      background: #1dc8cc;
    background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc 0%, #2cdd9b 100%);
    background: -webkit-gradient(linear, left top, right top, from(#1dc8cc), to(#2cdd9b));
    background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);   
}

.bg-white {
   background:white;
}
.writebutton {
    position:absolute;
   right:150px;
   top:50px;}   
}
.rvlist .btn-md {
    padding: 15px 45px;
    font-size: 16px;
}

.rvintro {
   color: #edf1f2;
   margin-left: 150px;
}

.readit {
   font-size: 10pt;
   color: #edf1f2;
   margin-left: 150px;

}


.star {color:gold; font-size:12pt; font-weight:bold;}

.mb-4, .my-4 {
    margin-bottom: 4rem!important;
    width: 350px;
    height: 250px;
}

.page-item {
	margin:5px;
}
.page-item .page-link {
    margin: 0px;
    background-color: #141414;
    border: 0px;
    color: white;
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


<div id="main">
   

      <span style="font-size: 30px; cursor: pointer; color: white;"
         onclick="openNav()">&#9776;</span>


      
      <br>
        
<!-- 글이 있는 경우 -->        
<c:if test="${listcount > 0 }">        
    

        
<div class="py-5 rvlist">
    <div class="container">
        <!-- row  -->
        <div class="row wrap-rvlist">
        
<c:set var="num" value="${listcount-(page-1)*10}"/>
<c:forEach var="r" items="${reviewlist}">   
        
            <!-- Column  -->
            <div class="1column">
                <!-- card  -->
                <div class="card border-0 mb-4">
                    <div class="row no-gutters">
                        <div class="col-md-5 icon-position rounded-left" style="background-image:url(https://image.tmdb.org/t/p/w500${r.MOVIE_POSTER })">
                             <c:choose>
                             <c:when test="${r.FACE == 1}">
                             <img src="<%=request.getContextPath()%>/Png/happy1.svg" class="icon-round bg-white display-5">

                             </c:when>   
                             <c:otherwise>
                               <img src="<%=request.getContextPath()%>/Png/neutral.svg" class="icon-round bg-white display-5">
                             </c:otherwise>

                       	
                        </c:choose>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body ml-0 ml-md-3">
                                <p class="rvtitle"><a href="moviedetail.ml?open=false&id=${r.MOVIE_ID}">${r.MOVIE_NAME}</a></p>
                                <p class=rvcontent>${r.REVIEW_TITLE}<br>${r.REVIEW_CONTENT}<br>${r.REVIEW_DATE}</p>
                                <br>
                                 
                             <c:choose>
                             <c:when test="${r.STAR == 1}">
                             <p class=star >★☆☆☆☆</p> 

                             </c:when>
                             
                              <c:when test="${r.STAR == 2}">
                             <p class=star >★★☆☆☆</p> 
                             </c:when>   
                             
                              <c:when test="${r.STAR == 3}">
                             <p class=star >★★★☆☆</p> 
                             </c:when>   
                             
                              <c:when test="${r.STAR == 4}">
                             <p class=star >★★★★☆</p> 
                             </c:when>   
                             
                              <c:when test="${r.STAR == 5}">
                             <p class=star >★★★★★</p> 
                             </c:when>
                                </c:choose>
                                
                                <p class=rvbottom1><a href="ReviewUserList.rv?userId=${r.USER_ID}" title="보슈 회원 ${r.USER_ID}님의 리뷰 더보기">${r.USER_ID}</a>님이 남긴 리뷰</p>
                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Column end -->
            
 </c:forEach>
            
        </div>
<div class="center-block">
   <div class=row>
      <div class=col>
         <ul class=pagination>
         
      <c:if test="${page <= 1 }">
         <li class=page-item>
         <a class=page-link href=#><&nbsp;</a>
         </li>
      </c:if>
      <c:if test="${page > 1 }">
         <li class=page-item>
         <a class=page-link href="ReviewList.rv?page=${page-1}"><&nbsp;</a>
         </li>
      </c:if>      
      
      <c:forEach var="a" begin="${startpage }" end="${endpage }">
         <c:if test="${a == page }">
            <li class=page-item>
            <a class=page-link href=#>${a }</a>
            </li>
         </c:if>
         <c:if test="${a != page }">
            <li class=page-item>
               <a class=page-link href="ReviewList.rv?page=${a }">${a }</a>   
            </li>   
         </c:if>
      </c:forEach>
      
      <c:if test="${page >= maxpage }">
         <li class=page-item>
            <a class=page-link href=#>&nbsp;></a>
         </li>
      </c:if>
      <c:if test="${page < maxpage }">
    
         <li class=page-item>
            <a class=page-link href="ReviewList.rv?page=${page+1 }">&nbsp;></a>   
         </li>
         </c:if>      
         </ul>   
      </div>
   </div>

</div>
    </div>
</div>

   
</c:if>

<!-- 게시글이 없는 경우 -->
<c:if test="${listcount == 0 }">
      <font size=5>등록된 리뷰가 없습니다.</font>
</c:if>


</div>
   <!-- 추가... -->

<script>
if(<%=open%>)
   document.getElementById("main").style.marginLeft = "250px";


</script>
</body>
</html>