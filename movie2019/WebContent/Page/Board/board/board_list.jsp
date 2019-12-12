<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>VOSHU</title>
<head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
 body {color:white; background:#141414;}
 .container {height:70%; background:white; color:black; border-radius:1%;}
 select {justify-content:center;}
 .center-block {display:flex; clear:both;
                justify-content:center; /* 가운데 정렬 */}
  #searchForm {width:300px; display:flex; justify-content:center; }
 #id {text-align:center;}
 #b-ti {color:black; margin:10px;font-weight:bold; font-size:26pt;}
 a {text-decoration:none;}
 #searchForm, #writebtn {
   margin-bottom:20px;
 }
 #writebtn {background:#2cdd9b; float:right;}
 #searchbtn {background:#2cdd9b;}
 .table-active {background:#9febed;}
 tr:hover {background:#bef7e2; }
 #writebtn:hover {background:#1dc8cc;}
 #searchbtn:hover {background:#1dc8cc;}
 h2 {font-weight:bold; font-size:26pt;}
</style>
</head>
<body>
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

<div class="container" >
<br><br>
<h2 id="b-ti">&nbsp;&nbsp;&nbsp;씨네필 라운지</h2>

 <%-- 게시글이 있는 경우 --%>

   <!-- 게시물 검색  -->       
  <form action="BoardList.bd" class="form-inline float-right" id="searchForm">
   <div class="input-group">
   <select id="viewcount" name="search_field">
      <option value="0" selected>아이디</option>
      <option value="1" >제목</option>
      <option value="2" >내용</option>
   </select>
   <input name="search_word" type="text" class="form-control"
   placeholder="Search" value="${search_word }" id="search">
   <button class="btn border-0" type="submit" id="searchbtn">검색</button>
   </div>
   </form>
   
   <table class="table">
   <thead>
     <tr class="table-active">
       <th width="8%"><div>번호</div></th> 
       <th width="50%"><div>제목</div></th>
       <th width="14%"><div>글쓴이</div></th>
       <th width="17%"><div>날짜</div></th>
       <th width="11%"><div>조회수</div></th>
     </tr>
    </thead>
    <tbody>
    <c:set var="num" value="${listcount-(page-1)*10 }"/>
    <c:forEach var="b" items="${boardlist }">
      <tr>
        <td>
        <c:out value="${num }"/> <%-- num 출력 --%>
        <c:set var="num" value="${num-1 }"/> <%--num=num-1 --%>
        </td>
        <td>
           <div>
             
             <c:if test="${b.BOARD_RE_LEV != 0 }"> <!-- 답글인 경우 앞에 공백주고 처리 -->
               <c:forEach var="a" begin="0"
                          end="${b.BOARD_RE_LEV*2 }" step="1">
               &nbsp;
               </c:forEach>
             </c:if>
             <c:if test="${b.BOARD_RE_LEV ==0 }"> <!-- 원문인 경우 -->
              &nbsp;
             </c:if>
             
             <a href="BoardDetailAction.bd?num=${b.BOARD_NUM }">
                ${b.BOARD_SUBJECT}  
             </a>
           </div>
        </td>
        <td>
          <div>${b.BOARD_NAME } </div>
        </td>
        <td>
          <div>${b.BOARD_DATE }</div>
        </td>
        <td>
          <div>${b.BOARD_READCOUNT }</div>
        </td>
      </tr>
    </c:forEach>
   </table>
   </tbody>
   
   <button type="button" id="writebtn"
         class="btn btn-gradiant btn-md border-0 text-white pull-right">글쓰기</button>
   
   
   
   
   <!-- 페이징 처리 -->
   <div class="center-block">
     <div class="row">
       <div class="col">
          <ul class="pagination">
          <c:if test="${page <= 1 }">
            <li class="page-item">
            <a class="page-link" href="#">이전&nbsp;</a>
            </li>
          </c:if>
          <c:if test="${page > 1 }">
            <li class="page-item">
            <a href="BoardList.bd?page=${page-1 }"
                class="page-link">이전</a>&nbsp;
            </li>
          </c:if>
          <c:forEach var="a" begin="${startpage }" end="${endpage }">
            <c:if test="${a == page }">
              <li class="page-item">
              <a class="page-link" href="#">${a }</a>
              </li>
            </c:if>
            <c:if test="${a != page }">
              <li class="page-item">
              <a href="BoardList.bd?page=${a }"
                 class="page-link">${a }</a>
              </li>
            </c:if>
          </c:forEach>
          <c:if test="${page >= maxpage }">
            <li class="page-item">
            <a class="page-link" href="#">&nbsp;다음</a>
            </li>
          </c:if>
          <c:if test="${page < maxpage }">
            <li class="page-item">
            <a href="BoardList.bd?page=${page+1 }"
                class="page-link">&nbsp;다음</a>
            </li>
          </c:if>
          </ul>
       </div>
     </div>
   </div>

 <%-- 게시글이 없는 경우 --%>
 <c:if test="${listcount==0 }">
     <font size=5>등록된 글이 없습니다.</font>
 </c:if><br>
  
</div>
</div>
<br>
<br>
</body>
<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
<script>
//로그인한 회원만 글 쓰기
$(function(){
	 $("#writebtn").click(function(){
		 var id = "${id}";
		 if (id != null && id !="" ) {
			 location.href="BoardWrite.bd";
		 }
		 else {
			 alert("로그인이 필요합니다.");
			 
		 }
	 })
})

//검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되게 한다
var selectedValue = '${search_field}'
if(selectedValue != '-1')
    $("#viewcount").val(selectedValue);

//검색어 공백 유효성 검사
$("#searchbtn").click(function(){		
   if($("#search").val()==''){
	 alert("검색어를 입력하세요");
	 return false;
   }
});


</script>
<script src="list.js"></script>
</html>