<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>
* {color:white; background:#141414;}
  tr.center-block {text-align:center;}
  h1 {font-size:1.5rem; text-align:center; color:#1a92b9;}
  .container {width:60%;height:100%;}
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
 <form action="BoardReplyAction.bd" method="post"
       name="boardform">
   <%-- 답변을 추가하기 위해서는 답변의 원문글에 대한
        BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ 정보 필요 --%>
   <input type="hidden" name="BOARD_RE_REF"
          value="${boarddata.BOARD_RE_REF }">
   <input type="hidden" name="BOARD_RE_LEV"
          value="${boarddata.BOARD_RE_LEV }">
   <input type="hidden" name="BOARD_RE_SEQ"
          value="${boarddata.BOARD_RE_SEQ }">              
  <h1>reply 페이지</h1>
  <div class="form-group">
    <label for="board_name">글쓴이</label>
     <input name="BOARD_NAME" id="board_name" value="${id }"
            type="text" size="10" maxlength="30" required
            class="form-control" placeholder="Enter board_name">
  </div>
  <div class="form-group">
    <label for="board_subject">제목</label>
     <input name="BOARD_SUBJECT" id="board_subject" 
            type="text" size="10" maxlength="100" required
            class="form-control" value="Re: ${boarddata.BOARD_SUBJECT}"/>
  </div> 
  <div class="form-group">
    <label for="board_content">내용</label>
    <textarea name="BOARD_CONTENT" id="board_content" required
            cols="67" rows="10" class="form-control" ></textarea>
  </div>   
  <div class="form-group">
    <label for="board_pass">비밀번호</label>
    <input name="BOARD_PASS" id="board_pass" required
            type="password" class="form-control" placeholder="Enter board_pass">
  </div> 
   <div class="form-group">
    <input type="submit" class="btn btn-primary" value="등록">
    <input type="button" class="btn btn-danger" 
           value="취소" onClick="history.go(-1)">
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