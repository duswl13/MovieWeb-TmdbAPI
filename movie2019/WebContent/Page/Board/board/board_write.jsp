<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
  tr.center-bloac {text-align:center;}
  h1 {font-size:1.5rem; text-align:center; color:#1a92b9;}
  .container {width:60%;}
  label {font-weight:bold;}
  #upfile {display:none;}
  img {width:20px;}
</style>
</head>
<body>
<div class="container">
 <form action="BoardAddAction.bo" method="post"
       enctype="multipart/form-data" name="boardform">
  <h1>글 쓰기</h1>
  <div class="form-group">
    <label for="board_name">글쓴이</label>
    <input name="BOARD_NAME" id="board_name" value="${id }"
            readOnly type="text" size="10" maxlength="30"
            class="form-control" placeholder="Enter board_name">
  </div>
  <div class="form-group">
    <label for="board_pass">비밀번호</label>
    <input name="BOARD_PASSA" id="board_PASS" value=""
            type="password" size="10" maxlength="30"
            class="form-control" placeholder="Enter board_pass">
  </div> 
  <div class="form-group">
    <label for="board_content">내용</label>
    <textarea name="BOARD_CONTENT" id="board_content" 
            cols="67" rows="10" class="form-control" ></textarea>
  </div>   
   <div class="form-group">
    <label for="board_file">파일 첨부</label>
    <label for="upfile">    <!-- alt: 이미지 안나오면 대체로 나오게 하는 거 -->
       <img src="image/jisung.jpg" alt="지성"></label>
    <input type="file" id="upfile" name="BOARD_FILE">
    <span id="filevalue"></span>
  </div>  
   <div class="form-group">
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="reset" class="btn btn-danger">취소</button>
  </div>  
 </form>
</div>
</body>
</html>