<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="css/MovieList.css">
<title>Insert title here</title>
</head>
<body>
<div class="all">

<div class="row">
<div class="form-group col-xs-2">
  <select class="form-control" id="sel1">
    <option>인기순</option>
    <option>최신순</option>
    <option>평가순</option>
  </select>
</div>

<div class="form-group col-xs-2">
  <select class="form-control" id="sel1">
    <option>모든 장르</option>
    <option>액션</option>
    <option>판타지</option>
  </select>
  </div>

  

<div class="form-group col-xs-2">
  <select class="form-control" id="sel1">
    <option>모든 키워드</option>
    <option>모험</option>
    <option>사랑</option>
  </select>
</div>
</div>


<div class="movieList">

</div>


<div class="row">
<div class= "text-center">
<ul class="pagination">
  <li class="page-item"><a class="page-link" href="#">이전</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">다음</a></li>
</ul>
</div>
</div>

</body>

<script>

var text = '<div class="row">';

for(var i = 0; i < 4; i++){
	text +=	'<div class="col-xs-3">';
	text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg">';
	text += '<div class="centered">\n';
	text += '<h5>' + '확인확인11' + '</h5>\n';
	text += '<p>' + '확인확인22' + '</p></div>\n';
	text += '<h5>기생충</h5>';
	text += '</div>';
}
text += '</div>';


text += '<div class="row">';

for(var i = 0; i < 4; i++){
	text +=	'<div class="col-xs-3">';
	text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg">';
	text += '<div class="centered">\n';
	text += '<h5>' + '확인확인11' + '</h5>\n';
	text += '<p>' + '확인확인22' + '</p></div>\n';
	text += '<h5>기생충</h5>';
	text += '</div>';
}
text += '</div>';




text += '<div class="row">';

for(var i = 0; i < 4; i++){
	text +=	'<div class="col-xs-3">';
	text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg">';
	text += '<div class="centered">\n';
	text += '<h5>' + '확인확인11' + '</h5>\n';
	text += '<p>' + '확인확인22' + '</p></div>\n';
	text += '<h5>기생충</h5>';
	text += '</div>';
}
text += '</div>';



text += '<div class="row">';

for(var i = 0; i < 4; i++){
	text +=	'<div class="col-xs-3">';
	text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg">';
	text += '<div class="centered">\n';
	text += '<h5>' + '확인확인11' + '</h5>\n';
	text += '<p>' + '확인확인22' + '</p></div>\n';
	text += '<h5>기생충</h5>';
	text += '</div>';
}
text += '</div>';
text += '</div>';
	$('.movieList').html(text);
</script>
</html>