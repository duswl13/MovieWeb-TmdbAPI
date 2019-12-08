<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>VOSHU</title>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>
body {color:white; background:#141414;}
  tr.center-block {text-align:center;}
  h1 {font-size:1.5rem; text-align:center; color:#1a92b9;}
  .container {width:60%;height:100%;}
  label {font-weight:bold;}
  #upfile {display:none;}
   h1 {text-align:center; color:#27AE60;}
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
 <form action="BoardModifyAction.bd" method="post" 
       enctype="multipart/form-data" name="modifyform">
 <input type="hidden" name="BOARD_NUM" value="${boarddata.BOARD_NUM }">
  <h1>무비 토크</h1><br>
  <div class="form-group">
    <label for="board_name">글쓴이</label>
     <input readOnly type="text" class="form-control" 
            value="${boarddata.BOARD_NAME }">
  </div>
  <div class="form-group">
    <label for="board_subject">제목</label>
    <input name="BOARD_SUBJECT" id="board_subject" 
            type="text" size="10" maxlength="100" required
            class="form-control" value="${boarddata.BOARD_SUBJECT }">
  </div> 
  <div class="form-group">
    <label for="board_content">내용</label>
    <textarea name="BOARD_CONTENT" id="board_content" required
             rows="15" class="form-control" >${boarddata.BOARD_CONTENT }</textarea>
  </div>   
  <!-- 원문글 작성자만 파일첨부 수정 가능하게 한다 -->
  <c:if test="${boarddata.BOARD_RE_LEV == 0}">
   <div class="form-group read">
    <label for="board_file">파일 첨부</label>
    <label for="upfile">
      <img src="Png/attach.png" alt="파일첨부" width="20px">
    </label>
    <input type="file" id="upfile" name="BOARD_FILE">
    <span id="filevalue">${boarddata.BOARD_FILE}</span>
     <img src="Png/remove.png" alt="파일삭제"
           width="10px" class="remove">
    </div>  
  </c:if>
  
  <div class="form-group">
    <label for="board_pass">비밀번호</label>
    <input name="BOARD_PASS" id="board_pass" value=""
            type="password" maxlength="30" required
            class="form-control" placeholder="Enter board_pass">
  </div> 
  
   <div class="form-group">
    <button type="submit" class="btn btn-primary">수정</button>
    <button type="reset" class="btn btn-danger"
                         onClick="history.go(-1)">취소</button>
  </div>  
 </form>
</div>
</div>
</body>
<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/writeform.js" charset="utf-8"></script>
</html>