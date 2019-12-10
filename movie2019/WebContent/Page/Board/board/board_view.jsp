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
 #mailModal {
    display:none;
 }
 #content {
     width:89%;
    justify-content:center;
 }
 .modal-body {text-align:center;}
#title {font-weight:bold; font-size:15pt; color:black;}
#text {font-size:11px; color:darkgray; margin-bottom: 3px;}
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
<!-- 로그인한 사람 아이디 -->         
<input type="hidden" id="loginid" value="${id}" name="loginid">   
<!-- 로그인한 사람 이메일 -->
<c:set var="usermail" value="${mem}" />
<input type="hidden" id="loginemail" value="${usermail.email} " name="loginemail">
<h1>무비 토크</h1><br>
<div class="container">
 <table class="table table-striped">
 <tr>
 <!-- 글제목 -->
  <th colspan="2">
     <div id="b_subject">${boarddata.BOARD_SUBJECT}</div>
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
 <!-- 첨부파일 있다면 -->
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
 
 <!-- 로그인한 회원만 답변 쓸 수 있게 -->
   <c:if test="${!empty id }">
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
   <!-- 로그인한 회원만 신고할 수 있게 -->
   <c:if test="${!empty id }">
   <a herf="#">
   <button class="btn btn-warning" data-toggle="modal"
        data-target="#mailModal">신고</button>
   </a>
   </c:if>

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
   </div> <!-- 삭제 모달 끝 -->
  
  
   <!-- 신고 모달 시작 -->
    <div class="modal" id="mailModal">
    <div class="modal-dialog">
     <div class="modal-content">
     <div class="modal-body">
      
        <label>
            <br>
            <span id="title">신고 사유를 작성하세요</span>
            <br><br>
            <textarea id="singo" cols="30"rows="4" placeholder="욕설/비방/음란물/기타 등" required></textarea>
        </label>
        <br><div id="text">관리자에게 신고 메일이 전송됩니다</div>
        
        <input type="hidden" name="senderMail" id="senderMail" value="dlwldus0922@gmail.com">
        <!-- 관리자 메일 (현재는 지연 메일) -->
        <input type="hidden" name="receiveMail" id="receiveMail" value="dlwldus0922@gmail.com">    
        <button type="button" class="btn btn-danger" id="police" >신고</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
    
    </div>
    </div> 
    </div>
    </div>
     <!-- 신고 모달 끝 -->
    
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
$(function() {
	$("#police").click(function(){
		mail_send();
	});//신고 메일
});

function mail_send(){
	$.ajax({
		type: "post",
		url: "Mail.bd",
		data:{
			"senderId" : "${id}", //신고하는 사람 아이디 (로그인 하고 있는 사람)
			"senderMail" : $("#loginmail").val(), //신고하는 사람 메일
			"receiveMail" : $("#receiveMail").val(), //관리자 메일
			"subject" : "[신고접수] 작성자:"+ $("#writer").text()+" 제목:"+$("#b_subject").text(), //메일 제목
			"content": "신고 사유:"+$("#singo").val() //메일 내용
		},
		success: function(mail){
		
			alert("신고가 접수되었습니다.");
		}
		
	});
	
}


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
	    	    		   img = "<img src='Png/write.png' width='10px' class='update'>"
	    	    			   + "<img src='Png/del.png' width='10px' class='remove'>"
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
 
 
 //수정
 $("#comment").on('click', '.update', function(){
	 before = $(this).parent().prev().prev().text(); //선택한 내용 가져오기
	 $("#content").focus().val(before); //댓글창에 전에 쓴 내용 불러오기
	 num = $(this).next().next().val(); //수정할 댓글 번호
	 $("#writebtn").text("수정"); //등록버튼 이름 수정으로 변경
	
	 
 }) //수정 끝
 
 //삭제
 $("#comment").on('click', '.remove', function(){
	 var num = $(this).next().val(); //댓글 번호
	 
	var re = confirm("정말 삭제하시겠어요?");
	 if(re){
	 $.ajax({
		 type: "post",
		 url:"CommentDelete.bd",
		 data: {"num": num},
		 success: function(result){
			 if(result==1){
				 getList();
			 }
		 }
	 }) //ajax end
	 }else{
		 
	 } 
	 
 }) // 삭제 끝
 
</script>

</html>