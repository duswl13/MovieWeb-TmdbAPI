
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>



<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background: #141414;
	font-family: montserrat, arial, verdana;
	font-size:10pt;
}

tr.center-block {
	text-align: center
}

.container {
	width: 550px;
	margin: 50px auto;
	background: white;
	border: 0 none;
	border-radius: 10px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px;
	box-sizing: border-box;
	position: relative;
}

label {
	font-weight: bold
}

table td {
	padding: 10px;
}

button {
	width: 70px;
	height: 25px;
	line-height: 25px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	font-size: 9pt;
	border: 0 none;
	border-radius: 3px;
	cursor: pointer;
	margin: 10px 5px;
}

button:hover {
	opacity: 70%;
	box-shadow: 0 0 0 1px white, 0 0 0 2px #27AE60;
}

span {
	font-size: 8pt;
}

input {
	background: #edf1f2;
	border: 0px solid SteelBlue;
	border-radius: 0px;
	color: #141414;
	font-size: 9pt;
	padding: 5px;
	margin: 5px;
}

textarea {
	width: 100%;
	background: #edf1f2;
	border: 0px solid SteelBlue;
	border-radius: 0px;
	color: #141414;
	font-size: 9pt;
	padding: 5px;
	margin: 5px;
}

.search {
	text-align: center
}

.save {
	text-align: right;
}
</style>

<script>
	//수정 전
	function enterkey() {
		if (window.event.keyCode == 13) {
			location.href = 'Search.ml?open=false&key='
					+ $('#search-form').val().replace(/(\s*)/g, "");
		}
	}
</script>

</head>
<body>
	<br>
	<br>
	<div class=container>
		<form action="" method=post name=review_write_form>


			<div class=search>
				리뷰할 영화 고르기<input type=text size=30 class=search_title
					placeholder="영화 제목 입력" onkeyup="enterkey();">
				<!-- <button class=search_mv>검색</button>-->

			</div>

			<table>
				<tr>
					<td>영화이미지<br> <span>표정 점수 </span><br> <span>★★★☆☆</span></td>
					<td>
						<div class=write_form>
							<textarea name=write_form id=write_form cols=50 rows=15
								class=write_form placeholder="아~아아아~"></textarea>
						</div>
					</td>
				</tr>
			</table>

			<div class=save>
				운명이조님이 작성한 리뷰를
				<button type=submit>저장</button>
			</div>

		</form>
	</div>
</body>
</html>