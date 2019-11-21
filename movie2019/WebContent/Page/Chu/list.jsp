<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body{
color: white;
}

.cardClear {
	clear: both;
}

#msg {
	border-radius: 5px;
	border: 2px solid #73AD21;
	padding: 10px;
	padding-left: 20px;
	margin: 10px;
	width: 400px;
	height: 200px;
	font-size: 14px;
	text-align: left;
	float: left;
}

p {
	color: red;
}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function() {
	var newDate = new Date();
	var year = newDate.getFullYear();
	var mon = newDate.getMonth()+1;
	if(mon<10){
		mon = "0"+mon;
	};
	var day = newDate.getDate()-1;
	if(day<10){
		day = "0"+day;
	}
	
	var url ="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=aa66c5868406af2e316790e9ab3eadb7";
	url = url+ "&targetDt=" + year+mon+day;
	console.log(url);
	
	$.ajax({
		type:"GET",
		url:url,
		success:function(data){				
			var str="";				
			//안된경우
			if($(data).find("dailyBoxOffice").text()==""){
				alert("날짜에 대한 처리가없음");
				return;
			}		
			$(data).find("dailyBoxOffice").each(function() {	
				//링크
				str = str +"<a href='#' onclick='javascript:movie("+$(this).find("movieCd").text()+")'>";
				
				//순위
				str = str +$(this).find("rank").text()+"위";					
				//증감
				var rankInten =parseInt($(this).find("rankInten").text());
				if(rankInten>0) str = str + "▲";
				else if(rankInten<0) str = str +"▼";
				str = str + rankInten+") :";
				str = str  +$(this).find("movieNm").text() + "</a><br>";
				
			});
	$("#msg").html(str);},
		error:function(){
			alert("데이터통신실패");				
		}
		
	});
});
	
function movie(movieCd) {
	console.log(movieCd);
	var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=aa66c5868406af2e316790e9ab3eadb7";
	url += "&movieCd="+movieCd;
	$(".box3").html("");
	$.ajax({
		type:"GET",
		url : url,
		success : function(data){
			
			var str="";
			str = "<h1>"+$(data).find("movieNm").text()+"</h1>";
			str =str+"<h3>"+$(data).find("movieNmEn").text()+"<h3>";
			str =str+ "<p>상영시간 : "+$(data).find("showTm").text()+"</p>";
			str = str + "<ul>";
			$(data).find("actor").each(function() {
				str = str+ "<li>"+$(this).find("peopleNm").text()+"</li>";
			});
			str+= "</ul>";
			$(".box3").append(str);
		},
		error:function(){alert("데이터통신실패");}
		
	});
	
}
</script>



</head>
<body>
	<div id="msg"></div>
	<!-- 순위 -->
	<div class="cardClear"></div>
<div class="box3"></div>
	<!-- 상세 -->
</body>