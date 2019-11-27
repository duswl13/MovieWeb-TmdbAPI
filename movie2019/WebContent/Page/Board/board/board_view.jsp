<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

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
<style>
  th, .center {text-align:center;}
  .container {width:60%;}
  label {font-weight:bold;}
  #upfile {display:none;}
  img {width:20px;}
</style>
</head>
<body>
<div class="container">
<!-- enctype="multipart/form-data"이면 파일업로드 한다는 뜻 -->
 <form action="BoardDetailAction.bd" method="post"
       enctype="multipart/form-data" name="boardform">
 <table>
 <tr>
  <th colspan="2">영화 토론 게시판</th>
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
            cols="67" rows="10" class="form-control" ></textarea>
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
    
    <a href="BoardDelete.bd?num=${boarddata.BOARD_NUM}">
    <button type="button" class="btn btn-danger">삭제</button>
    </a>
   </c:if>
   <a href="BoardList.bd">
    <button type="reset" class="btn btn-primary">취소</button>
   </a>
   </td>
 </tr>
 </table> 
 </form>
</div>
</body>
</html>