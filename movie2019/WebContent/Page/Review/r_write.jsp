
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
	font-size: 10pt;
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

#movie-label {
	display: block;
	font-weight: bold;
	margin-bottom: 1em;
}

#movie-id {
	background: white;
}

#movie-icon {
	float: left;
	height: 32px;
	width: 32px;
}

#movie-description {
	margin: 0;
	padding: 0;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		var movies = [ {
			value : "겨울왕국1",
			icon : "jquery_32x32.png"
		}, {
			value : "겨울왕국2",
			icon : "jqueryui_32x32.png"
		}, {
			value : "그냥 겨울 운명이조",
			icon : "sizzlejs_32x32.png"
		} ];

		$("#movie").autocomplete({
			minLength : 0,
			source : movies,
			focus : function(event, ui) {
				$("#movie").val(ui.item.label);
				return false;
			},
			select : function(event, ui) {
				$("#movie").val(ui.item.label);
				$("#movie-id").val(ui.item.value);
				$("#movie-desc").html(ui.item.value);
				$("#movie-icon").attr("src", "images/" + ui.item.icon);

				return false;
			}
		}).autocomplete("instance")._renderItem = function(ul, item) {
			return $("<span>").append(
					"<div>" + item.value + "</div>")
					.appendTo(ul);
		};
	});
</script>

</head>
<body>
	<br>
	<br>
	<div class=container>
		<form action="" method=post name=review_write_form>


			<div class=search>
				
				리뷰할 영화 고르기<div id="movie-label"></div>
				<div>
				<img id="movie-icon" src="images/transparent_1x1.png" class="ui-state-default" alt=""> 
				<input type=text id="movie">
				<div id="movie-id"></div>
</div>

			</div>

			<table>
				<tr>
					<td>영화이미지<br>
						<p id="movie-desc"></p>
						<br>
					<span>표정 점수 </span><br> <span>★★★☆☆</span>
					</td>
					
					<td>
						<div class=write_form>
							<textarea name=write_form id=write_form cols=50 rows=15
								class=write_form placeholder="..."></textarea>
						</div>
					</td>
				</tr>
			</table>

			<div class=save>
				운명이조님이 작성한 리뷰를<button type=submit>저장</button>
			</div>

		</form>
	</div>
</body>
</html>