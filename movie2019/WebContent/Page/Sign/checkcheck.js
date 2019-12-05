var checkid;
var checkpass;

 $("input[id='USER_ID']").on('keyup',function(){
	 $("#message").empty();
	   var id = $("input[id='USER_ID']").val();
	   var pattern = /^\w{5,12}$/;
	   if(!pattern.test(id)){
		   $("#message").css('color','red')
		                .html("영문자, 숫자 포함 5~12자 가능")
		   checkid = false;
		   return;
	   }   
  	   
	   $.ajax({
		   type: "post",
			  url: "idcheck.su", 
			  data: {"id": id},  
			  success: function(resp){
				 if(resp==-1){
					 $("#message").css('color','green')
					              .html("사용 가능한 아이디입니다.");
				    checkid = true;
				 }else{
					 $("#message").css('color','blue')
					              .html("사용 중인 아이디입니다.");
				    checkid = false;
				 }
		     } //success end
	   }); // ajax end
    }); // keyup end
    
   
    $("input[id='USER_PASS']").on('keyup',function(){
   	 $("#pass_message").empty();
   	   var pass = $("input[id='USER_PASS']").val();
  
   	   var pattern = /^\w{5,12}$/;
   	   if(!pattern.test(pass)){
   		   $("#pass_message").css('color','red')
   		               .html("영문자,숫자,특수문자 포함 8자 이상")
   		   checkpass = false;
   		   return;
   	   }
   	   
    });
    
    $("input[id='USER_EMAIL']").on('keyup',function(){
   	 $("#email_message").empty();
   	   var email = $("input[id='USER_EMAIL']").val();
   	   var pattern = /^\w+@\w+[.]\w{3}$/; 
   	   
   	   if(!pattern.test(email)){
   		   $("#email_message").css('color','red')
   		                      .html("이메일 형식이 맞지 않습니다.");
   		   return false;
   	   }else{
   		   $("#email_message").css('color','green')
   		                      .html("이메일 형식에 맞습니다.");
   		   return true;
   	   }
    }); // keyup end
 