
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>	
<!DOCTYPE html>
<html>
<head>

<meta http-equiv=Content-Type content=text/html; charset=UTF-8>
<script type="text/javascript" src="<%=cp%>/data/jss/httpRequest.js %>"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	function sendKeyword() {
		
		var userKeyword = $(".search_title").val();
		if (userKeyword == "") {
			return;
		}
		var params = "userKeyword=" + userKeyword;
		sendRequest("r_search.jsp", params, displaySuggest, "POST");
	}
	
	function sendRequest() {
		
	}
	
	
	function displaySuggest() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200)
				var resultText = httpRequest.responseText;
			
			var resultArray = resultText.split("|");
			var count = parseint(resultArray[0]);
			var keywordList = null;
			
			if (count > 0) {
				keywordList = resultArray[1].split(".");
				var html = "";
				for (var i=0; i<keywordList.length; i++) {
					html += "<a href=\"javascript:select('" +
							keywordList[i] + "');\>" +
							keywordList[i] + "</a><br/>";
							
				}
				var suggestListDiv = document.getElementById("suggestListDiv");
				suggestListDiv.innerHTML = html;
				show();
			} else {
				hide();
			}
		} else {
			hide();
		}
	} //function end
	
	
	function select (selectKeyword) {
		document.mtForm.userKeyword.value = selectKeyword;
		hide();
	}
	function show() {
		var suggestDiv = document.getElementById("suggestListDiv");
		suggestDiv.style.display = "block";
	}
	function hide() {
		var suggestDiv = document.getElementById("suggestListDiv");
		suggestDiv.style.display = "none";
	}
	window.onload = function() {
		hide();
	}
</script>

</head>
<body>
	<br>
	<br>
	<div class=container>
		<form action="" method=post name=review_write_form>


			<div class=search>
				리뷰할 영화 고르기
				<input type=text size=30 class=search_title placeholder="영화 제목 입력" 
					name="userKeyword" onkeyup="sendKeyword();">
				<div id=suggestDiv class=suggest>
					<div id=suggestListDiv></div>
				</div>

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