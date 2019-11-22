<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지:내 정보 수정</title>
<style>
b {
	color: yellow;
	padding-right:50px;
}
tr{
	width:100%;
}
td{
	padding:4px;
}
button{
	width:100%;
}
#replace{
	padding-bottom:50px;
}
#btn1,#btn2{
	width:100px;;
	height:20px;
	margin-right:10px;
}

</style>
</head>
<body>
	<div class="container">

		<form name="joinform">
			<div id="replace">
			<table>
				<tr>
					<td><b>이름</b></td>
					<td><input type="text" placeholder="Enter name" name="name"
						maxLength="15" required></td>
				</tr>
				<tr>
					<td><b>아이디</b></td>
					<td><input type="text" placeholder="Enter id" id="id"
						name="id" maxLength="12" required> <span id="message"></span></td>
				</tr>

				<tr>
					<td><b>비밀번호</b></td>
					<td><input type="password" placeholder="Enter password"
						name="pass" required></td>
				</tr>
				<tr>
					<td><b>비밀번호 확인</b></td>
					<td><input type="password" placeholder="Enter password"
						name="pass" required></td>
				</tr>
				<tr>
					<td><b>이메일 주소</b></td>
					<td><input type="text" placeholder="Enter email" name="email"
						required> <span id="email_message"></span></td>
				</tr>

				<tr>
					<td><b>휴대전화</b></td>
					<td><input type="text" readOnly="readonly" name="email"
						required> <span id="email_message"></span></td>
				</tr>

			</table>
			</div>
			<div>
			<table>
				<tr>
					<td id="btn1">
						<button type="submit" class="btn btn-primary">수정</button>
					</td>
					<td id="btn2">
						<button type="reset" class="btn btn-secondary">취소</button>
					</td>
				</tr>
			</table>
			</div>
		</form>
	</div>
</body>
</html>