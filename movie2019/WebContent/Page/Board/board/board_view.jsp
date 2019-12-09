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
<script src="js/writeform.js"></script>
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
  top:-1px;
  color:orange;
  border-radius:20%;
  
  }
  a {text-decoration:none;}
   h1 {text-align:center; color:#2cdd9b;}
 #mail_send {
    
 }
 #content {
     width:89%;
    justify-content:center;
 }
 #writer {color:silver; font-size:11pt;}
 #date {color:silver; font-size:11pt; text-align:right;}
 #writebtn {width:10%; position:relative; top:-83px; height:80px;}
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

<h1>무비 토크</h1><br>
<div class="container">
 <table class="table table-striped">
 <tr>
 <!-- 글제목 -->
  <th colspan="2">
     <div id="title">${boarddata.BOARD_SUBJECT}</div>
  </th> 
 </tr>
 <tr>
 <!-- 글쓴이 -->
  <td>
     <div id="writer">${boarddata.BOARD_NAME } </div>
  </td>
  <td>
 
  <div id="date"> ${boarddata.BOARD_DATE }</div>
 
  </td>
 </tr>
 <!-- 본문 -->
 <tr>
    <td colspan="2"><textarea name="BOARD_CONTENT" id="board_content" readOnly
             rows="15" class="form-control" >${boarddata.BOARD_CONTENT}
             </textarea>
            
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
 
 <!-- 로그인한 회원만 답변 쓸 수 있게 (not empty : not null) -->
   <c:if test="${not empty id }">
   <a href="BoardReplyView.bd?num=${boarddata.BOARD_NUM }">
   <button type="button" class="btn btn-primary">답변</button>
   </a>
   </c:if>
   
   <!-- 작성자와 관리자만 수정/삭제 가능하게 -->
   <c:if test="${boarddata.BOARD_NAME == id || id == 'admin' }">
    <a href="BoardModifyView.bd?num=${boarddata.BOARD_NUM}">
    <button type="button" class="btn btn-info">수정</button>
    </a>
    
   <!-- 글 삭제 -->
    <a href="#">
    <button class="btn btn-danger" data-toggle="modal"
             data-target="#myModal">삭제</button>
    </a>
   </c:if>
   <a href="./BoardList.bd">
    <button type="button" class="btn btn-primary">목록</button>
   </a>
   <!-- 신고 메일 보내기 -->
   <div class="btn btn-warning" id="mail_send" data-toggle="modal"
        data-target="#policeModal">
    <div class="modal-header">    
     <h5 class="modal-title" id="modal">신고하기</h5>
     </div>
     <div class="modal-body">
      <form name="contact-form" class="form" action="Mail.bd" method="POST">
       <div class="col-xs-12">
        <label>
            <br>
            <span id="title">신고 사유를 작성하세요</span>
            <br><br>
            <textarea name="message" cols="30"rows="4" placeholder="욕설/비방/음란물/기타 등" required></textarea>
        </label>
        <br><div id="text">관리자에게 신고 메일이 전송됩니다</div>
        <button type="submit" class="btn btn-warning">
        <span class="default">신고 <i class="icon fa fa-paper-plane"></i></span>
        </button>
    </div>
</form>
     </div>
   
   </div>
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
                  <input type="hidden" name="num" value="${param.num}"
                       id="BOARD_RE_REF">

                  <div class="form-group">
                     <label for="pwd">비밀번호</label> 
                        <input type="password"
                        class="form-control" placeholder="Enter password"
                        name="BOARD_PASS" id="board_pass">
                  </div>
                  <button type="submit" class="btn btn-primary" >삭제</button>
                   <button type="button" class="btn btn-danger" data-dismiss="modal" >취소</button>
               </form>
            </div>
         </div>
      </div>
   </div>
   
   <button type="button" id="combtn" class="btn btn-primary comm">댓글
   <span id="count">[${count }]</span></button><br>

   <div id="comment">
   <table class="table table-striped">
        <thead>
         
        </thead>
        <tbody>
        
        </tbody>
       </table>
       <div id="message"></div>
       
       <textarea rows=3 class="form-control" 
                 id="content" maxLength="50"></textarea>
        <button id="writebtn" class="btn btn-info float-right">등록</button>
        
        </div>
        </div>
        </div>
</body>
<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
<script>

//댓글창 일단 숨겨
$("#comment table").hide(); //1

//댓글 목록 불러옴
function getList(){
	   $.ajax({
		   type:"post",
		   url:"CommentList.bd",
		   data:{"BOARD_RE_REF" : $("#BOARD_RE_REF").val()},
	       dataType:"json",
	       success:function(rdata){
	    	   if(rdata.length>0){
	    		   $("#comment table").show(); //문서가 로딩될 때 hide()햇던 부분 보이게
	    	       $("#comment thead").show(); //글이 있을 떄 hide() 부분을 보이게
	    	       $("#comment tbody").empty();
	    	       $("#message").text('');
	    	       output = '';
	    	       $(rdata).each(function(){
	    	    	   img='';
	    	    	   if($("#loginid").val()==this.id){ //작성자에게만 보임
	    	    		   img = "<img src='Png/write.png' width='11px' class='update'>수정"
	    	    			   + "<img src='Png/del.png' width='11px' class='remove'>삭제"
	    	    			   + "<input type='hidden' value='"+this.num+"'>";
	    	    	   }
	    	    	   output += "<tr><td>"+this.id+"</td>";
	    	    	   output += "<td>"+this.content+"</td>";
	    	    	   output += "<td>"+this.reg_date+"</td><td>"+ img+"</td></tr>";
	    	       });
	    	       $("#comment tbody").append(output);
	    	       
	    	   }else{
	    		   $("#message").text("등록된 댓글이 없습니다.")
	    		   $("#comment thead").hide(); //2
	    		   $("#comment tbody").empty();
	    	   }
	    	   $("#count").text(rdata.length);
	       }
	   
	   }) //ajax end

};

//댓글 누르면 댓글리스트 펼쳐짐
$(".comm").click(function(){
	 getList();
}); //click end


//로그인한 회원만 댓글 작성 
$("#writebtn").click(function(){
	
	var id = "${id}";
	if(id!=null && id!=""){
		
		//buttonText : 버튼의 라벨이름 ㅇㅇ
		 buttonText = $("#writebtn").text(); //버튼의 라벨로 add할 지 update할 지
		 content = $("#content").val();
		 
		 if(buttonText=="등록"){ //댓글을 추가하는 경우
			 url="CommentAdd.bd";
			 data={"content":content,
					 "id":$("#loginid").val(),
					 "BOARD_RE_REF":$("#BOARD_RE_REF").val()};		 
		 }else{//댓글을 수정하는 경우
			 url="CommentUpdate.bd";
			 data={"num":num, "content":content};
			 $("#writebtn").text("등록"); //다시 등록으로 변경
		 }
		 
		 $.ajax({
			 type:"post",
			 url:url,
			 data:data,
			 success:function(result){
				 $("#content").val('');
				 if(result==1){
					 getList();
				 }
			 }
		 }) //ajax end
		
	}else{
		
		alert("로그인한 회원만 댓글을 쓸 수 있습니다.");
	}
	
	
 }) //$("#writebtn") end
 
</script>
<script type="text/javascript">
function send_mail(){
    window.open("Page/Board/board/mailSender.jsp", "width=300, height=200, resizable=no, scrollbars=no, status=no");
}
</script>
</html>