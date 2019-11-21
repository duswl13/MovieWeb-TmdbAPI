<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지:내 정보 수정</title>
<style>



</style>
</head>
<body>


    <form name="joinform">
    
       <div>
          <b>아이디</b>
          <input type="text" placeholder="Enter id" id="id" name="id" maxLength="12" required>
          <span id="message"></span>
       </div>
       <div>
           <b>비밀번호</b>
           <input type="password" placeholder="Enter password" name="pass" required>
       </div>
       <div>
          <b>이름</b>
          <input type="text" placeholder="Enter name"  name="name" maxLength="15" required>
       </div>
       <div>
          <b>나이</b>
          <input type="text" placeholder="Enter age"  name="age" maxLength=2 required>
       </div>
       <div>
          <b>성별</b>
          <input type="radio" name="gender" value="남" checked><span>남자</span>
          <input type="radio" name="gender" value="여"><span>여자</span>
       </div>
       <div>
          <b>이메일 주소</b>
          <input type="text" placeholder="Enter email"  name="email" required>
          <span id="email_message"></span>
       </div>
       <div class="clearfix">
          <button type="submit" class="submitbtn">로그인</button>
          <button type="reset" class="cancelbtn">다시작성</button>
        </div>
     </form>

</body>
</html>