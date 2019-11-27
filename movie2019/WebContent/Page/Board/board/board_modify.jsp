<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<style>
  tr.center-block {text-align:center;}
  h1 {font-size:1.5rem; text-align:center; color:#1a92b9;}
  .container {width:60%;}
  label {font-weight:bold;}
  #upfile {display:none;}
  img {width:20px;}
</style>
</head>
<body>
<div class="container">
 <form action="BoardModifyAction.bd" method="post" name="modifyform">
 <input type="hidden" name="BOARD_NUM" value="${boarddata.BOARD_NUM }">
  <h1>MVC 게시판 - modify 페이지</h1>
  <div class="form-group">
    <label for="board_name">글쓴이</label>
     <input readOnly type="text" class="form-control" 
            value="${boarddata.BOARD_NAME }">
  </div>
  <div class="form-group">
    <label for="board_subject">제목</label>
    <input name="BOARD_SUBJECT" id="board_subject" 
            type="text" size="10" maxlength="100"
            class="form-control" value="${boarddata.BOARD_SUBJECT }">
  </div> 
  <div class="form-group">
    <label for="board_content">내용</label>
    <textarea name="BOARD_CONTENT" id="board_content" 
             rows="15" class="form-control" >${boarddata.BOARD_CONTENT }</textarea>
  </div>   
  <!-- 파일이 첨부되어 있으면 -->
  <c:if test="${!empty boarddata.BOARD_FILE }">
   <div class="form-group">
    <label for="board_file">파일 첨부</label>
    <div class="form-control">
       &nbsp;&nbsp;${boarddata.BOARD_FILE }</div>
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
</body>
</html>