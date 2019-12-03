<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>
* {color:white; background:#141414;}
  th, .center {text-align:center;}
  .container {width:60%; height:100%;}
  label {font-weight:bold;}
  #upfile {display:none;}
  img {width:20px;}
  #myModal {display:none;}
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
<div class="container">
 <table class="table table-striped">
 <tr>
  <th colspan="2"> view 페이지</th>
 </tr>
 <tr>
  <td>
     <div>글쓴이</div>
  </td>
  <td>
     <div>${boarddata.BOARD_NAME }</div>
  </td>
 </tr>
 <tr>
  <td>
     <div>제목</div>
  </td>
  <td>
     <div>${boarddata.BOARD_SUBJECT}</div>
  </td> 
 </tr>
 <tr>
  <td>
     <div>내용</div>
  </td>
    <td><textarea name="BOARD_CONTENT" id="board_content" 
             rows="10" class="form-control" >${boarddata.BOARD_CONTENT}</textarea>
  </td>  
 </tr>
 <tr> 
   <c:if test="${!empty boarddata.BOARD_FILE }">
    <tr>
     <td>
        <div>첨부파일</div>
     </td>
     <td>
       <img src="image/jisung.jpg" alt="지성">
    <a href="BoardFileDown.bd?filename=${boarddata.BOARD_FILE }">
        ${boarddata.BOARD_FILE}</a></td> 
 </tr>
 </c:if>
 <tr> 
  <td colspan="2" class="center">
   <a href="BoardReplyView.bd?num=${boarddata.BOARD_NUM }">
   <button type="button" class="btn btn-primary">답변</button>
   </a>
   <c:if test="${boarddata.BOARD_NAME == id || id == 'admin' }">
    <a href="BoardModifyView.bd?num=${boarddata.BOARD_NUM}">
    <button type="button" class="btn btn-info">수정</button>
    </a>
   <!-- delete어쩌구에서 modal로 변경 -->
    <a href="#">
    <button class="btn btn-danger" data-toggle="modal"
             data-target="#myModal">삭제</button>
    </a>
   </c:if>
   <a href="./BoardList.bd">
    <button type="button" class="btn btn-primary">목록</button>
   </a>
   </td>
 </tr>
 </table> 
  <%-- 게시판 수정 end --%>
  <%-- modal 시작 --%>
      <div class="modal" id="myModal">
      <div class="modal-dialog">
         <div class="modal-content">


            <!-- Modal body -->
            <div class="modal-body">
               <form name="deleteForm" action="BoardDeleteAction.bd"
                  method="post">
                  <input type="hidden" name="num" value="${param.num}">

                  <div class="form-group">
                     <label for="pwd">비밀번호</label> 
                        <input type="password"
                        class="form-control" placeholder="Enter password"
                        name="BOARD_PASS" id="board_pass">
                  </div>
                  <button type="submit" class="btn btn-primary" >Submit</button>
                   <button type="button" class="btn btn-danger">Close</button>
               </form>
            </div>
         </div>
      </div>
   </div>
   </div>
   </div>
</body>
<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	  $("form").submit(function(){
		
	  if($.trim($("textarea").val())==""){
		  alert("내용을 입력하세요");
		  $("textarea").focus();
		  return false;
	  }
	 });
	  
	  $("#upfile").change(function(){
		 $("#filevalue").val('');
		 console.log($(this).val());
		 var inputfile=$(this).val().split('\\');
		 $("#filevalue").text(inputfile[inputfile.length-1]);
	  });
	  
	}); //ready() end
</script>
</html>