<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp" %>
<script type="text/javascript">
$(function() {
	$("#email").click(function() {
		mail();
	});
});
 

function mail() {//메일
	
	
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
			/* $("#senderName").val("");
			$("#senderMail").val("");
			$("#subject").val("");
			$("#message").val(""); */
			location.href="list.gong"; //혹시 세션유지안되는지 확인해바야댐
		},
		
		error : function(err) {
			alert("실패:받으실이메일주소를 확인해주세요");
		}

	});

}

</script>


</head>
<body>
<form action="mailsend.gong">
받을이메일: <input name="senderName" id="senderName"><br>
제목 : <input name="subject" id ="subject"><br>
내용 : <textarea rows="5" cols="80" name="message" id="message"></textarea>
<input type="button" value="전송" id="email">
<input type="hidden" name="senderMail" id="senderMail" value="rjstn19339@gmail.com">
<input type="hidden" name="receiveMail" id="receiveMail" value="rjstn19339@gmail.com">
</form>

</body>
</html>