<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

h1 {
	font-size: 1.5rem;
	color: CadetBlue
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
	width: 100px;
	height: 40px;
	background: CadetBlue;
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
	border: 1.5px dotted gray;
	border-radius: 10px;
	color: white;
	padding: 5px;
	margin: 5px;
}

textarea {
	background: #141414;
	border: 1.5px dotted white;
	border-radius: 10px;
	font-color: white;
	padding: 5px;
	margin: 5px;
}
</style>


</head>
<body>
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
							<textarea name=write_form id=write_form cols=50 rows=10
								class=write_form placeholder="아~아아아~"></textarea>
						</div>
					</td>
				</tr>
			</table>


			<br>
			<div>
				<c:if test="${boarddata.BOARD_NAME == id || id == 'admin'}">
					<a href="BoardModifyView.bo?num${boarddata.BOARD_NUM }">
						<button>수정</button>
					</a>

					<a href="BoardDelete.bo?num${boarddata.BOARD_NUM }">
						<button>삭제</button>
					</a>
				</c:if>
				<a href="BoardList.bo">
					<button>전체목록</button>
				</a>
			</div>
		</form>
	</div>

</body>
</html>