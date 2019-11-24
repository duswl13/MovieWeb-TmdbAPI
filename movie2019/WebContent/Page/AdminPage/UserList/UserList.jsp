<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지:숨김 컨텐츠 관리</title>
<style>
body{
	background:white;
}
b {
	color: black;
	padding-right:50px;
	font-size: 15px;
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
#btn3{
	width:50px;
}

table, td {
	border-bottom: 1px solid black;
	border-collapse: collapse;
}
.container-fluid{
	color:green;
    text-shadow:
    -1px -1px 0 grey,
    1px -1px 0 grey,
    -1px 1px 0 grey,
    1px 1px 0 grey;
}

</style>
</head>
<body>
	<div class="container">

		<form name="joinform">
			<div id="hidden">
			<table>
				<tr>
					<td><b>NO</b></td>
					<td><b>아이디</b></td>
					<td><b>비밀번호</b></td>
					<td><b>이름</b></td>
					<td><b>이메일</b></td>
					<td><b>성별</b></td>
					<td><b>가입일자</b></td>
					<td><b>변경일자</b></td>
					<td><b>관리자</b></td>
					<td><b>전화번호</b></td>
					<td><b>회원삭제</b></td>
				</tr>
				<tr>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td><button id="btn3" class="btn btn-primary">삭제</button></td>
				</tr>
				<tr>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
					<td><button id="btn3" class="btn btn-primary">삭제</button></td>
				</tr>
			</table>
			</div>
		</form>
	</div>
</body>
</html>