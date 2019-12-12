<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>

<style>
/*custom font*/
@import url(https://fonts.googleapis.com/css?family=Montserrat);

/*basic reset*/
* {margin: 0; padding: 0;}

html {
	height: 100%;
	/*Image only BG fallback*/
	
	/*background = gradient + image pattern combo*/
	/* linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6)); */
	background: #141414;
}

body {
	font-family: montserrat, arial, verdana;
}

#message, #pass_message, #email_message, #phone_message{
    padding: 7px;
	margin: 5px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	font-size: 11px;
}
	

#MAIL_CHECK {
    padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 49%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}
/*form styles*/
#msform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}
#msform fieldset {
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
#msform fieldset:not(:first-of-type) {
	display: none;
}
/*inputs*/
#msform input, #msform textarea {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}
/*buttons*/
#msform .action-button {
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
#msform .action-button:hover, #msform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}
.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #666;
	margin-bottom: 20px;
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
	font-size: 9px;
	width: 33.33%;
	float: left;
	position: relative;
}
#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: white;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
	/*connector not needed before the first step*/
	content: none; 
}

/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/

#progressbar li.active:before,  #progressbar li.active:after{
	background: #27AE60;
	color: white;
}

.container {
    max-width: 640px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 13px;
}

ul.ks-cboxtags {
    list-style: none;
    padding: 10px;
}
ul.ks-cboxtags li{
  display: inline;
}
ul.ks-cboxtags li label{
    display: inline-block;
    background-color: rgba(255, 255, 255, .9);
    border: 2px solid rgba(139, 139, 139, .3);
    color: #adadad;
    border-radius: 25px;
    margin: 3px 0px;
    transition: all .1s;
}

ul.ks-cboxtags li label {
    padding: 4px 6px;
    cursor: pointer;
}

ul.ks-cboxtags li label::before {
    display: inline-block;
    -webkit-font-smoothing: antialiased;
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 12px;
   
    transition: transform .1s ;
}

ul.ks-cboxtags li input[type="checkbox"]:checked + label::before {
    
    transform: rotate(-360deg);
    transition: transform .1s;
}

ul.ks-cboxtags li input[type="checkbox"]:checked + label {
    border: 2px solid #1bdbf8;
    background-color: #12bbd4;
    color: #fff;
    transition: all .1s;
}

ul.ks-cboxtags li input[type="checkbox"] {
  position: absolute;
  opacity: 0;
}
ul.ks-cboxtags li input[type="checkbox"]:focus + label {
  border: 2px solid #e9a1ff;
}

#exit {float:right; text-decoration:none;
       font-size:9pt; font-weight:bold;}
</style>
<body>

<!-- multistep form -->
<form id="msform" action="<%=request.getContextPath() %>/signProcess.su" method="post">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">기본 정보</li>
    <li>상세 정보</li>
    <li>선호 장르</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
  <a href="../Login/login.jsp" id="exit" >X</a>
  <br>
    <h2 class="fs-title">기본 정보 입력</h2>
    <h3 class="fs-subtitle">step 1</h3>
    <input type="text" name="USER_ID" id="USER_ID" placeholder="아이디" required/>
    <span id="message"></span>
    <input type="password" name="USER_PASS" id="USER_PASS" placeholder="비밀번호" required/>
    <span id="pass_message"></span>
 
    <input type="button" name="next" class="next action-button" id="next1" value="다음" />
  </fieldset>
  <fieldset>
  <a href="../Login/login.jsp" id="exit" >X</a>
  <br>
    <h2 class="fs-title">상세 정보 입력</h2>
    <h3 class="fs-subtitle">step 2</h3>
    <input type="text" name="USER_EMAIL" id="USER_EMAIL" placeholder="이메일" required/>
    <span id="email_message"></span>
    <!-- 
    <div class="mail-form">
    <button type="button" id="MAIL_CHECK" class="btn btn-primary btn-lg btn-block" onClick="send_mail()">인증</button>
    <input type="text" name="MAIL_CHECK" id="MAIL_CHECK" required />
    </div>
    -->
    <input type="text" name="USER_PHONE" id="USER_PHONE" placeholder="전화번호" required/>
    <span id="phone_message"></span><br>
    <input type="button" name="previous" class="previous action-button" value="이전" />
    <input type="button" name="next" class="next action-button" id="next2" value="다음" />
  </fieldset>
  <fieldset>
  <a href="../Login/login.jsp" id="exit" >X</a>
  <br>
    <h2 class="fs-title">선호 장르 선택</h2>
    <h3 class="fs-subtitle">3개 이상 선택하세요</h3>
    <div class="container">
  <ul class="ks-cboxtags">
      <li><input type=checkbox name=genre id=action value="28">
      <label for="action">액션</label></li>
      <li><input type=checkbox name=genre id=adventure value="12">
      <label for="advanture">모험</label></li>
      <li><input type=checkbox name=genre id=animation value="16">
      <label for="animation">애니메이션</label></li>
      <li><input type=checkbox name=genre id=comedy value="35">
      <label for="comedy">코미디</label></li>
      <li><input type=checkbox name=genre id=crime value="80">
      <label for="crime">범죄</label></li>
      <li><input type=checkbox name=genre id=documentary value="99">
      <label for="documentary">다큐멘터리</label></li>
      <li><input type=checkbox name=genre id=drama value="18">
      <label for="drama">드라마</label></li>
      <li><input type=checkbox name=genre id=family value="10751">
      <label for="family">가족</label></li>
      <li><input type=checkbox name=genre id=fantasy value="14">
      <label for="fantasy">판타지</label></li>
      <li><input type=checkbox name=genre id=history value="36">
      <label for="history">역사</label></li>
      <li><input type=checkbox name=genre id=horror value="27">
      <label for="horror">공포</label></li>
      <li><input type=checkbox name=genre id=music value="10402">
      <label for="music">음악</label></li>
      <li><input type=checkbox name=genre id=mystery value="9648">
      <label for="mystery">미스터리</label></li>
      <li><input type=checkbox name=genre id=romance value="10749">
      <label for="ramance">로맨스</label></li>
      <li><input type=checkbox name=genre id=sf value="878">
      <label for="sf">SF</label></li>
      <li><input type=checkbox name=genre id=tv value="10770">
      <label for="tv">TV영화</label></li>
      <li><input type=checkbox name=genre id=thriller value="53">
      <label for="thriller">스릴러</label></li>
      <li><input type=checkbox name=genre id=war value="10752">
      <label for="war">전쟁</label></li>
      <li><input type=checkbox name=genre id=western value="37">
      <label for="western">서부</label></li>
  </ul>

</div>
    <input type="button" name="previous" class="previous action-button" value="이전" />
    <input type="submit" name="submit" class="submit action-button" value="가입" />
  </fieldset>
</form>

</body>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="jquery-3.4.1.js" ></script>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'>
</script>

<script>
//유효성 검사
$(document).ready(function(){

var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

var checkId, checkPass, checkEmail, checkPhone;

//다음 버튼 클릭할 때
$(".next").click(function(){
	
	//클릭한 버튼이 몇번쨰 next인지 확인
	var check = $(".next").index(this);
	
	//버튼 id=next1 인 경우
	if(check == 0){
		  var id = $("#USER_ID").val();
    	  var pass = $("#USER_PASS").val();
    	  if(id=="" || !checkId){
    		  alert("아이디를 확인하세요");
    		  return false;
    	  }
    	  if(pass=="" || !checkPass){
    		  alert("비밀번호를 확인하세요");
    		  return false;
    	  }
    	  
	}
	//next2인 경우
	else{
      var email = $("#USER_EMAIL").val();
   	  var phone = $("#USER_PHONE").val();
   	  if(email=="" || !checkEmail){
   		  alert("이메일을 확인하세요");
   		  return false;
   	  }
   	  if(phone=="" || !checkPhone){
   		  alert("핸드폰 번호를 확인하세요");
   		  return false;
   	  }
   	  
		
	}
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({
      'transform': 'scale('+scale+')',
      'position': 'absolute'
    });
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

//이전 버튼 클릭할 때
$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;

		//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

//아이디 형식 확인
 $("#USER_ID").keyup(function(){
	 $("#message").empty();
	   var id = $("#USER_ID").val();
	   var pattern = /^\w{5,12}$/;
	   if(!pattern.test(id)){
		   $("#message").css('color','red')
		                .html("영문자, 숫자 포함 5~12자 가능")
		   checkId = false;
		  return;
	   }   
 
	   //아이디 중복되는지 확인
	   $.ajax({
		   type: "post",
		      //idcheck하는 곳으로 경로 설정
			  url: "<%=request.getContextPath()%>/idcheck.su", 
			  data: {"id": $("#USER_ID").val()},  
			  success: function(resp){
				 if(resp==-1){
					 $("#message").css('color','green')
					              .html("사용 가능한 아이디");
				    checkId = true;
				   
				 }else{
					 $("#message").css('color','blue')
					              .html("사용 중인 아이디");
				    checkId = false;
				   
				 }
		     } //success end
	   }); // ajax end
	
 }); // id keyup end

 //비밀번호 형식 확인
    $("#USER_PASS").keyup(function(){
   	 $("#pass_message").empty();
   	   var pass = $("#USER_PASS").val();
  
   	   var pattern =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
   	   if(!pattern.test(pass)){
   		   $("#pass_message").css('color','red')
   		               .html("영문자,숫자,특수문자 포함 8자 이상")
   		   checkPass = false;
   		   return;
   	   }
      	checkPass = true;
   	   
    }); // password keyup end
    

    //이메일 형식 확인
    $("#USER_EMAIL").keyup(function(){
      	 $("#email_message").empty();
      	   var email = $('#USER_EMAIL').val();
      	   var pattern = /^\w+@\w+[.]\w{3}$/; 
      	   
      	   if(!pattern.test(email)){
      		   $("#email_message").css('color','red')
      		                      .html("이메일 형식이 맞지 않습니다.");
      		   checkEmail = false;
      		   return;
      	   }
      	   
      	  checkEmail = true;
      	   
       }); // email keyup end
       
   //핸드폰 번호 형식 확인
       $("#USER_PHONE").keyup(function(){
        	 $("#phone_message").empty();
        	   var phone = $('#USER_PHONE').val();
        	   var pattern = /^[0-9]{11}$/; 
        	   
        	   if(!pattern.test(phone)){
        		   $("#phone_message").css('color','red')
        		                      .html("숫자만 입력하세요.");
        		   checkPhone = false;
        		   return;
        	   }
        	   
        	  checkPhone = true;
        	   
         }); // phone keyup end
      
     //선호장르 개수 체크   
      $(".submit").click(function(){
    	  var genres 
    	   = $("input[type=checkbox]:checked").length;
    	  if(genres<3){
    		  alert("선호 장르를 3개 이상 선택하세요");
    		  return false;
    	  }
    	  
      })  //submit end
      
  
  
}); //ready end



</script>

</html>