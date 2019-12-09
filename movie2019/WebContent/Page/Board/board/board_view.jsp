<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>VOSHU</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
 body {color:white; background:#141414;}
  th, .center {text-align:center;}
  .container {width:60%; height:100%;}
  label {font-weight:bold;}
  #upfile {display:none;}
  img {width:20px;}
  #myModal {display:none;}
  #count{
  position:relative;
  top:-10px;
  left: -10px;
  background:orange;
  color:white;
  border-radius:30%;}
  
 #mail_send {
    
 }
 #content {
    width:80%;
    justify-content:center;
 }
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
         
<input type="hidden" id="loginid" value="${id}" name="loginid">         
<div class="container">
 <table class="table table-striped">
 <tr>
  <th colspan="2"> view</th>
 </tr>
 <tr>
  <td>
     <div>글쓴이</div>
  </td>
  <td>
     <div >${boarddata.BOARD_NAME } </div>
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
    <td><textarea name="BOARD_CONTENT" id="board_content" readOnly
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
       <img src="Png/file.png" alt="첨부파일">
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
   <!-- 신고 메일 보내기 -->
   <a href="#">
    <button type="button" id="mail_send" class="btn btn-warning" onclick="send_mail()">신고</button>
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
                   <button type="button" class="btn btn-danger" onClick="history.back();">Close</button>
               </form>
            </div>
         </div>
      </div>
   </div>
   <div id="comment">
   <button type="button" id="combtn" class="btn btn-primary start">댓글</button>
   <span id="count">${count }</span>
   <table class="table table-striped table-sm">
        <thead>
        <!--  <tr><td>아이디</td><td>내용</td><td>날짜</td></tr> -->
        </thead>
        <tbody>
        
        </tbody>
       </table>
    <!--   <button class="btn btn-info float-left">총 50자까지 작성 가능</button>  -->
      <textarea rows=3 class="form-control"
                 id="content" maxLength="50"></textarea>
      <button id="writebtn" class="btn btn-info float-right">등록</button>
        <div id="message"></div>
        </div>
    </div>
       </div>
</body>
<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
<script>
$("#combtn").click(function(){
	//댓글 버튼 클릭하면 댓글 리스트 뜨게 하고 싶은데 ....
})
</script>
<script type="text/javascript">
function send_mail(){
    window.open("Page/Board/board/mailSender.jsp", "", "width=300, height=200, resizable=no, scrollbars=no, status=no");
}
</script>
</html>