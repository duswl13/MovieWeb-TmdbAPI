<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="css/MovieList.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--    <script type="text/javascript"
      src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style>
body{
background: #141414;
color:white;
}
</style>
</head>
<%

String id = request.getParameter("id");
String name = request.getParameter("name");
String apikey = application.getInitParameter("APIKEY");
boolean open = false;
if(request.getParameter("open") != null){
	open = Boolean.parseBoolean(request.getParameter("open"));
}

%>
<body>

<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>


<div id="main">

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>
<div class="container">
<h1 id="persionId"><%=name %></h1>

<hr>


		<div class="movieList"></div>

</div>
</div>
<script>

if(<%=open%>)
document.getElementById("main").style.marginLeft = "250px";




$.ajax({

	url : 'https://api.themoviedb.org/3/person/<%=id%>/movie_credits?api_key=<%=apikey%>&language=ko-KO',
	dataType : 'json',
	cache : false,
	success : function(data) {

		console.log('사람 정보 성공');
		var list = data.cast;

		printPerson(list);
		
	},
	error : function(request, status, error) {
		console.log('사람 정보 error');
	},
	complete : function() {
		console.log('사람 정보 ');

	}
});

function printPerson(list){
	
		var text = '';
		var check = 0;

		for (var i = 0; i < 5; i++) {

			text += '<div class="row">';

			for (var j = 0; j < 4; j++) {

				if (check < list.length) {
					if (list[check].poster_path == null
							|| list[check].overview == null
							|| list[check].genre_ids == null
							|| list[check].overview == ""
							|| list[check].genre_ids == ""
							|| list[check].overview.includes('섹스')) {
						j--;
						check++;
						console.log('이상한 거니까 넘김' + check);

						continue;
					}

					list[check].overview = list[check].overview.substring(0,
							100)
							+ '...';
					text += '<div class="col-xs-3">';
					text += '<a href="moviedetail.ml?open=false&id=' + list[check].id
							+ '">\n';
					text += '<img class="img-responsive" src="https://image.tmdb.org/t/p/w500'+list[check].poster_path+'">';
					text += '</a>';
					text += '<div class="centered">\n';
					text += '<h5>' + list[check].original_title + '</h5>\n';
					text += '<p>' + list[check].overview + '</p></div>\n';
					text += '<h5>' + list[check].original_title + '</h5>';

					text += '</div>';

					check++;
				}
			}
			text += '</div>';

		}

		console.log('check : ' + check);
		$('.movieList').html(text);

	
}

</script>
</body>
</html>