<!--login02 수정본 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'>
	
</script>
<style>
/*custom font*/
@import url(https://fonts.googleapis.com/css?family=Montserrat);

/*basic reset*/
* {
	margin: 0;
	padding: 0;
}

body {
	background: #141414;
	font-family: montserrat, arial, verdana;
	color: #141414;
}

a {
	color: #141414;
	text-decoration: none;
}

a:hover {
	color: #27AE60;
	text-decoration: underline;
}

/*form styles*/
#loginform {
	width: 450px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}

#loginform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	/*stacking fieldsets above each other*/
	position: relative;
}
/*Hide all except first fieldset*/
#loginform fieldset:not (:first-of-type ) {
	display: none;
}
/*inputs*/
.id, .password {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 80%;
	height: 40px;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}

.loginCheck {
	width: 100%;
	padding: 5px;
}

.saveSess {
	width: 40%;
	margin-right: 10px;
}

/*buttons*/
#loginform .submit {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}

#loginform .next {
	width: 100px;
	background: white;
	font-weight: bold;
	color: #27AE60;
	border: 1px solid #27AE60;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}

#loginform .next:hover {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 1px solid #27AE60;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}

#loginform .voshu-button {
	width: 220px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}

.join {
	background: #27AE60;
	font-weight: bold;
	font-size: 10pt;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 80px;
	margin: 10px 5px;
	text-decoration: none;
}

.join:hover {
	background: #27AE60;
	font-weight: bold;
	font-size: 10pt;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 80px;
	margin: 10px 5px;
	text-decoration: none;
}

#loginform .action-button:hover, #loginform .action-button:focus,
	.voshu-button:hover, #loginform .voshu-button:focus, .join:hover, .join:focus
	{
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.log_title1, .log_title2 {
	font-size: 17px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}

.jointext {
	font-size: 12px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 15px;
}

/*progressbar*/
#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	/*CSS counters to number the steps*/
	counter-reset: step;
}

#progressbar li {
	list-style-type: none;
	color: white;
	text-transform: uppercase;
	font-size: 12px;
	width: 47%;
	float: left;
	position: relative;
}

#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 25px;
	line-height: 25px;
	display: block;
	font-size: 12px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}


#progressbar li.active:before, #progressbar li.active:after {
	background: #27AE60;
	color: white;
}

.check {
	font-size: 8pt;
	margin-right: 20px;
}

.find {
	font-size: 8pt;
	margin-right: 15px;
}

span {
	color: red;
	font-size: 8px;
	text-align: center;
}
</style>


<body>
	<br>
	<br>
	<!-- multistep form -->
	<form id="loginform" method=post action="<%=request.getContextPath() %>/loginProcess.lg">


		<!-- fieldsets 1 -->
		<fieldset>
			<br>
			<h2 class="log_title1">VOSHU 아이디로 로그인 하기</h2>
			<br>
			<input type="text" name="id" id="id" class=id
				placeholder="아이디" required />
			<input type="password"
				name="password" id="password" class=password placeholder="비밀번호"
				required /> <br>
			<span></span>

			<div class="loginCheck">
				<input type="checkbox" id="saveSess" name="saveSess"> <label
					for="saveSess" class=check>자동로그인</label> <input type="checkbox"
					id="saveId" name="saveId" checked> <label for="saveId"
					class=check>아이디저장</label>
			</div>

			<input type="submit" name="submit" class="submit action-button"
				value="로그인" /> <input type="button" name="next"
				class="next action-button" value="SNS로그인" />

			<div class="findwrap">
				<a class=find>아이디 찾기</a> <a class=find>비밀번호 찾기</a>
			</div>
			<br>
			<hr>
			<br>
			<div class=joinwrap>
				<h3 class=jointext>아직 보슈 회원이 아니신가요?</h3>
				<a href="<%=request.getContextPath()%>/Page/Sign/RenewSign.html"
					class=join>회원가입</a>
			</div>
			<br>
		</fieldset>
  
<!-- fieldsets 2 //자꾸 이 부분이 펼쳐져 보임 ㅠ ㅠ
		<fieldset>
			<br>
			<h2 class="log_title2">SNS계정으로 간편 로그인하기</h2>
			<br> <a href="" class="openid kakao"> <img src=img/kakao.png
				width=220px>
			</a> <a href="" class="openid google"> <img src=img/google.jpg
				width=220px><br>
			</a> <br> <input type="button" name="previous"
				class="previous voshu-button" value="VOSHU 아이디로 로그인 하기" /> <br>
			<br>
		</fieldset>
-->
	</form>
</body>

<script>
	//jQuery time
	var log_title1, log_title2; //fieldsets
	var left, opacity, scale; //fieldset properties which we will animate
	var animating; //flag to prevent quick multi-click glitches

	$(".next").click(
			function() {
				if (animating)
					return false;
				animating = true;

				log_title1 = $(this).parent();
				log_title2 = $(this).parent().next();

				//activate next step on progressbar using the index of next_fs
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass(
						"active");

				//show the next fieldset
				log_title2.show();
				//hide the current fieldset with style
				log_title1.animate({
					opacity : 0
				}, {
					step : function(now, mx) {
						
						scale = 1 - (1 - now) * 0.2;
						left = (now * 50) + "%";
						opacity = 1 - now;
						log_title1.css({
							'transform' : 'scale(' + scale + ')',
							'position' : 'absolute'
						});
						log_title2.css({
							'left' : left,
							'opacity' : opacity
						});
					},
					duration : 800,
					complete : function() {
						log_title1.hide();
						animating = false;
					},
					easing : 'easeInOutBack'
				});
			});

	

	
</script>
</html>