<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지:내 정보 수정</title>
 
 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<style>
label {
	color: #337ab7;
	padding-right:50px;
}

p{
	color: grey;
}



</style>
</head>
<body>
        <article class="container">
            <div class="col-sm-6 col-md-offset-20">
                <form role="form">
                    <div class="form-group">
                        <label for="inputId">아이디</label>
                        <input type="text" class="form-control" id="inputId" placeholder="ID">
                    </div>
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" id="inputName" placeholder="이름을 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소</label>
                        <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPasswordCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputMobile">전화 번호</label>
                        <input type="tel" class="form-control" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요">
                    </div>

              
                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary">
                           수정완료<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                           수정취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                </form>
            </div>
        </article>

</body>
</html>