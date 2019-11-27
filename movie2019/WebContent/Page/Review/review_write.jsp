<%--https://cloudstudying.kr/lectures/236 별점참고 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<style>
* {
	margin: 0 auto
}

body {
	background: #141414;
	color: white;
}

tr.center-block {
	text-align: center
}

h4 {
	color: white;
}

.container {
	width: 60%
}

label {
	font-weight: bold
}

#upfile {
	display: none
}

img {
	width: 200px;
}

button {
	width: 200px;
	height: 50px;
	background: SteelBlue;
	border: 0px;
	border-radius: 10px;
	font-size: 10pt;
	color: white;
}

button:hover {
	opacity: 60%
}

span {
	font-size: 8pt;
}

input {
	background: #141414;
	border: 1px solid SteelBlue;
	border-radius: 10px;
	color: white;
	padding: 5px;
	margin: 5px;
}

textarea {
	background: #141414;
	border: 2px dotted SteelBlue;
	border-radius: 10px;
	color: white;
	padding: 5px;
	margin: 5px;
}
</style>

</head>
<body>

	<div class=container>
		<form action="" method=post name=review_write_form>
<br>
			<h4>내가 본 영화 리뷰 쓰기</h4>
			<br>

			<div class=form-group>
				<input name=BOARD_NAME id=board_name value="${id}" readOnly
					type=text size=20 maxlength=10 class=form-control
					placeholder="운명이조 (닉네임 자리)">
			</div>

			<div class=form-group>
				<input name=BOARD_PASS id=board_pass value="" type=password size=20
					maxlength=10 class=form-control placeholder="비밀번호 입력">
			</div>

			<div class=form-group>
				<input name=BOARD_PASS id=board_pass value="" type=password
					size=35 class=form-control placeholder="★영화 검색해서 선택하는 기능 넣기">
			</div>
			
			<div class=form-group>
				<input name=BOARD_SUBJECT id=board_subject value="" type=text
					size=35 maxlength=50 class=form-control placeholder="제목 입력">
			</div>
			
			<br> <span>신호등 별점 신호등 별점 신호등 별점 신호등 별점 신호등 별점 신호등 별점 </span> <br>
			<div class=form-group>
				<textarea name=BOARD_CONTENT id=board_content cols=50 rows=10
					class=form-control placeholder="리뷰... 왜 글씨가 다 회색으로 나오는 건지..."></textarea>
			</div>

			<br>

			<div class=form-group>
				<label for=upfile><button>추억도 같이 저장ㄴㄱ</button></label> <input
					name=BOARD_FILE id=upfile type=file> <span>티켓사진 같은 거
					첨부하면 어떨지...☆</span>
			</div>
			<br>

			<div class=form-group>
				<button type=submit>등록</button>
				<button type=reset>취소</button>
			</div>

		</form>
	</div>
</body>
</html>