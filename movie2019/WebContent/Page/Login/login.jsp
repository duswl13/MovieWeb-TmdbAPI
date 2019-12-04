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
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>
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
.id, .pass {
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
	margin-left: 70px;
	padding: 0px;
}

/* 아이디저장, 비밀번호저장 체크박스 텍스트 */
.saveid, .savepass {
	width: 40%;
	margin-right: 10px;
	font-size: 8pt;
}

/*buttons*/
/*
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
*/
#loginform .submit {
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
	
#loginform .snsgo {
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

#loginform .snsgo:hover {
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


#loginform .join, #loginform .submit {
	width: 200px;
	height:40px;
	background: #27AE60;
	font-weight: bold;
	font-size: 10pt;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 10px;
	margin: 10px 5px;
	text-decoration: none;
}

#loginform .join {
	padding: 10px 10px;
	margin: 0px 0px;
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
	font-size: 20px;
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

.cancel {
	color: black;
	font-size: 12px;
	font-weight : bold;
	float: right;
}

hr {
	margin: 10px 0px;
	}
</style>

<script>
$(document).ready(function(){
   
    var inputid = getCookie("inputid");
    $("input[id='id']").val(inputid); 
     
    if($("input[id='id']").val() != ""){ 
        $("#saveidcheck").attr("checked", true); // check
    }
     
    $("#saveidcheck").change(function(){ 
        if($("#saveidcheck").is(":checked")){ 
            var inputid = $("input[id='id']").val();
            setCookie("inputid", inputid, 7); // save cookies for 7days
        }else{ 
            deleteCookie("inputid"); //delete
        }
    });
     
    $("input[id='id']").keyup(function(){ 
        if($("#saveidcheck").is(":checked")){ 
            var inputid = $("input[id='id']").val();
            setCookie("inputid", inputid, 7); 
        }
    });


    var inputpass = getCookie("inputpass");
    $("input[pass='pass']").val(inputpass); 
     
    if($("input[pass='pass']").val() != ""){ 
        $("#savepasscheck").attr("checked", true); // check
    }
     
    $("#savepasscheck").change(function(){ 
        if($("#savepasscheck").is(":checked")){ 
            var inputpass = $("input[pass='pass']").val();
            setCookie("inputpass", inputpass, 7); // save cookies for 7days
        }else{ 
            deleteCookie("inputpass"); //delete
        }
    });
     
    $("input[pass='pass']").keyup(function(){ 
        if($("#savepasscheck").is(":checked")){ 
            var inputpass = $("input[pass='pass']").val();
            setCookie("inputpass", inputpass, 7); 
        }
    });
    
    
    //f(x) for cookies 룰루
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null)?"":";expires="+exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
    
});


$(function() {
	$(".join").click(function() {
		location.href="../Sign/Signup.jsp";
	})
})

</script>
<body>
	<br>
	<br>
	<!-- multistep form -->
	<form id="loginform" method=post action="<%=request.getContextPath() %>/loginProcess.lg">


		<!-- fieldsets 1 -->
		<fieldset>
			<a href="<%=request.getContextPath()%>/index.jsp"
					><span class=cancel>X</span></a>
			<br>
			<h2 class="log_title1">로그인해보슈</h2>
			<br>
			<input type="text" name="USER_ID" id="id" class=id
				placeholder="아이디" required autocomplete="off"/>
			<input type="password" name="USER_PASS" id="pass" class=pass 
				placeholder="비밀번호" required autocomplete="off"/> <br>
			<span></span>

			<div class="loginCheck">
				<input type="checkbox" id="saveidcheck" name="saveidcheck" checked> 
				<label for="saveid" id=saveid class=saveid>아이디 기억하기</label> 
		<!-- 	<input type="checkbox" id="savepasscheck" name="savepasscheck">
				<label for="savepass" id=savepass class=savepass>비밀번호저장</label>  -->
			</div>
			<div class=buttons>
			<input type="submit" name="submit" class="submit action-button" value="로그인" /> 
	<!--	<input type="button" name="snsgo" class="snsgo action-button" value="SNS로그인" />-->
			</div>
			
	<!--	<div class="findwrap">
				<a class=find>아이디 찾기</a> <a class=find>비밀번호 찾기</a>
			</div>-->
			<br>
			<hr color=#c7c7c7>
			<br>
			<div class=joinwrap>
				<h3 class=jointext>아직 보슈 회원이 아니신가요?</h3>
				<input type=button name=join class="join" value="회원가입" />
			</div>
			<br>
		</fieldset>
  
<!-- fieldsets 2 //자꾸 이 부분이 펼쳐져 보임 ㅠ ㅠ 일단...
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

	$(".snsgo").click(
			function() {
				if (animating)
					return false;
				animating = true;

				log_title1 = $(this).parent();
				log_title2 = $(this).parent().snsgo();

				//activate snsgo step on progressbar using the index of snsgo_fs
				$("#progressbar li").eq($("fieldset").index(snsgo_fs)).addClass(
						"active");

				//show the snsgo fieldset
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