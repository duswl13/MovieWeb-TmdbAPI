<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지:숨김 컨텐츠 관리</title>
<style>
b {
	color: yellow;
	padding-right:50px;
	font-size: 20px;
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
	width:100px;
	height:20px;
	margin-right:10px;
}
#btn3{
	width:50px;
}
</style>
</head>
<body>
	<div class="container">

		<form name="joinform">
			<div id="hidden">
			<table>
				<tr>
					<td><b>숨긴 영화</b></td>
					<td><b>숨김 해제</b></td>
				</tr>
				<tr>
					<td><b>test</b></td>
					<td><button id="btn3" class="btn btn-primary">해제</button></td>
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