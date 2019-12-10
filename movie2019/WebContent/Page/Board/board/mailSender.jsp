<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
body {text-align:center;}
#title {font-weight:bold; font-size:15pt;}
#text {font-size:11px; color:darkgray; margin-bottom: 3px;}
</style>
</head>
<body>
<form name="mail-form" class="form">
     
    <div class="col-xs-12">
        <label>
            <br>
            <span id="title">신고 사유를 작성하세요</span>
            <br><br>
            <textarea name="message" cols="30"rows="4" placeholder="욕설/비방/음란물/기타 등" required></textarea>
        </label>
        <br><div id="text">관리자에게 신고 메일이 전송됩니다</div>
        <button type="submit" class="btn btn-warning">
            <span class="default">신고 <i class="icon fa fa-paper-plane"></i></span>
        </button>
    </div>
</form>
</body>
</html>