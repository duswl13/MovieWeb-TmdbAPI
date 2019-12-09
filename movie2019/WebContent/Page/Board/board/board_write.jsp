<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<title>VOSHU</title>
<head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
body {color:white; background:#141414;}
  h1 {font-size:1.5rem; text-align:center; color:#1a92b9;}
  .container {width:60%; height:100%;}
  label {font-weight:bold;}
  #upfile {display:none;}
  img {width:20px;}
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
<!-- enctype="multipart/form-data"이면 파일업로드 한다는 뜻 -->
 <form action="BoardAddAction.bd" method="post"
       enctype="multipart/form-data" name="boardform">
  <h1>글 작성</h1>
  <div class="form-group">
    <label for="board_name">글쓴이</label>
    <input name="BOARD_NAME" id="board_name" value="${id }" readOnly
            type="text" size="10" maxlength="30" required
            class="form-control" placeholder="Enter board_name">
  </div>
  <div class="form-group">
    <label for="board_pass">비밀번호</label>
    <input name="BOARD_PASS" id="board_pass" value=""
            type="password" size="10" maxlength="20" required
            class="form-control" placeholder="Enter board_pass">
  </div> 
  <div class="form-group">
    <label for="board_subject">제목</label>
    <input name="BOARD_SUBJECT" id="board_subject" value=""
            type="text" size="10" maxlength="50" required
            class="form-control" placeholder="Enter board_subject">
  </div> 
  <div class="form-group">
    <label for="board_content">내용</label>
    <textarea name="BOARD_CONTENT" id="board_content" required
            cols="67" rows="10" class="form-control" ></textarea>
  </div>   
   <div class="form-group">
    <label for="board_file">파일 첨부</label>
    <label for="upfile">    <!-- alt: 이미지 안나오면 대체로 나오게 하는 거 -->
       <img src="Png/file.png" alt="파일"></label>
    <input type="file" id="upfile" name="BOARD_FILE">
    <span id="filevalue"></span>
  </div>  
   <div class="form-group">
    <button type="submit" class="btn btn-success">등록</button>
    <button type="reset" class="btn btn-danger" onClick="history.back()">취소</button>
  </div>  
 </form>
</div>
</div>
</body>
<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
<script>
$(document).ready(function() {
	$(document).submit(function() {
		if ($.trim($("textarea").val()) == "") {
			alert("내용을 입력하세요");
			$("textarea").focus();
			return false;
		}
	});

	$("#upfile").change(function() {
		$('#filevalue').val('');
		console.log($(this).val());
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	});

});
</script>
</html>