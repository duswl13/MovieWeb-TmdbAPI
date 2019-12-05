$(function(){

	var page;
	function getPoster(){
		
//		var apikey = application.getInitParameter("APIKEY");
		var link = 'https://api.themoviedb.org/3/movie/330457?api_key=139dd374c866d879d4ac74f2f897ac19&language=ko-KO';

		$.ajax({
			url:link,
			cache:false,
			data:{"MOVIE_ID" : $("#MOVIE_ID").val()},
			dataType:"json",
			success:function(rdata){
				var list=rdata.results;
				console.log('list:'+list);
				
				if(rdata.length>0){
					$("#poster").attr('src', 'https://image.tmdb.org/t/p/w300/'+this.poster_path);
				}else{
					$("#poster").attr('src','Page/images/winter.jpg');
				}
		
			},
			error:function(request, status, error){
				console.log('포스터가져오기 실패');
			},
			complete:function(){
				console.log('목록완료');
			}
		})	//ajax end
	}//function end
	console.log("testTTTT");
	getPoster();
})