<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp" %>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#email").click(function() {
		if($("#senderName").val()==""){
			alert("받으실아이디 입력");
			return;
		}
		if($("#subject").val()==""){
			alert("제목입력");
			return;
		}
		if($("#message").val()==""){
			alert("내용입력");
			return;
		}
		
		$.ajax({
			type : "post",
			url : "mailsend.gong",
			data : {
				"senderName" : $("#senderName").val(),
				"senderMail" : $("#senderMail").val(),
				"receiveMail" : $("#receiveMail").val(),
				"subject" :$("#subject").val(),
				"message":$("#message").val()
			},
			success : function(result) {
				alert("메일보내기성공!");
				/*  $("#senderName").val("");
				$("#senderMail").val("");
				$("#subject").val("");
				$("#message").val("");  */
				location.href="list.gong"; //혹시 세션유지안되는지 확인해바야댐
			},
			
			error : function(err) {
				alert("실패:받으실이메일주소를 확인해주세요");
			}

		});
			
		
	
	});
});
 


</script>
</head>
<body>


<div class="container">
	<div class="row">
		<center><h2></h2></center>
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-12 row" style="padding:0px;margin-bottom:10px;">
                            
                            <div class="col-md-2">
                                <img src="http://dinus.org/img/fakultas/FIK/cs/cs.svg">
                                <div style="margin-left:30px;">
                                    <img src="http://dinus.org/img/fakultas/FIK/cs/cs.png" width="70px" height="70px" class="img-circle" style="border:3px solid #052C52;">
                                </div>
                            </div>
                            <div class="col-md-10">
                                <hr>
                                <p style="padding-left:55px;font-size:1.3em;"><strong>문의</strong></p>
                                
                            </div>
                            
                            
                        </div>

                        <form>
                           
                                        <input type="email" class="form-control"  id="senderName" placeholder="Your e-mail" name="senderName" >
                                 
                                        <input class="form-control" type="text" placeholder="Subject" name="subject" id ="subject">
                                 
                                        <textarea class="form-control" rows="4" placeholder="Message text . . ." name="message" id="message"></textarea>
                                  
                   <button class="btn btn-danger btn-sm" style="width: 100%;" id="email">Send</button>
                            <input type="hidden" name="senderMail" id="senderMail" value="rjstn19339@gmail.com">
<input type="hidden" name="receiveMail" id="receiveMail" value="rjstn19339@gmail.com">    

                        </form>
                    </div>
                </div>

            </div>

        </div>
	</div>









</body>
</html>