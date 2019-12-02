<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>
<script type="text/javascript">
$(function() {
	$("#email").click(function(e) {
		
		mail();
	});
});
 

function mail() {//메일
	if($("#senderName").val()==""){
		alert("받으실 이메일")
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
			/* $("#senderName").val("");
			$("#senderMail").val("");
			$("#subject").val("");
			$("#message").val(""); */
			//location.href="list.gong"; 혹시 세션유지안되는지 확인해바야댐
		},
		
		error : function(err) {
			alert("실패:받으실이메일주소를 확인해주세요");
		}

	});

}

</script>
<style type="text/css">
div.center {
	margin-left: 400px;
}
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h2 style="visibility: hidden;">무엇을 도와드릴까요</h2>
			</center>
		
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-12 row"
							style="padding: 0px; margin-bottom: 10px;">

							<div class="col-md-2">
								<img src="http://dinus.org/img/fakultas/FIK/cs/cs.svg">
								<div style="margin-left: 30px;">
									<img src="http://dinus.org/img/fakultas/FIK/cs/cs.png"
										width="70px" height="70px" class="img-circle"
										style="border: 3px solid #052C52;">
								</div>
							</div>
							<div class="col-md-10">
								<hr>
								<p style="padding-left: 55px; font-size: 1.3em;">
									<strong>무엇을 도와드릴까요</strong>
								</p>

							</div>


						</div>

						<form>
							<table class="table">
								<tr>
									<td><input type="email" name="senderName"
										class="form-control" id="senderName" placeholder="Your e-mail">
									</td>
								</tr>
								<tr>
									<td><input class="form-control" name="subject"
										id="subject" type="text" placeholder="Subject"></td>
								</tr>
								<tr>
									<td><textarea class="form-control" rows="4" name="message"
											id="message" placeholder="Message text . . ."></textarea></td>
								</tr>
								<tr>
									<td>
									<input type="hidden" name="senderMail" id="senderMail"
										value="rjstn19339@gmail.com"> <input type="hidden"
										name="receiveMail" id="receiveMail"
										value="rjstn19339@gmail.com">
										<button class="btn btn-danger btn-sm" style="width: 100%;" id="email">
											<i class="fa fa-envelope-o" style="padding-right: 5px;"  ></i>
											전송
										</button> 
									</td>
								</tr>
							</table>

						</form>
					</div>
				</div>

			</div>

		</div>
	</div>
	




</body>
</html>