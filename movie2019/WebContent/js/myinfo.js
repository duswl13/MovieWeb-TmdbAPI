$(function(){
	function getGenres(){
		$.ajax({
			type:"post",
			url:"user_genres.mu",
			data:{"USER_ID" : $("#USER_ID").val()},
			dataType:"json",
			success:function(rdata){
				if(rdata.length>0){
					$("#genres").text('');
					$("#genres2").text('');
					output='';
					output2='';
					$(rdata).each(function(){
						output+="<span>"+this.GENRES_NAME + "</span>";
						output+="<span>&nbsp;&nbsp;&nbsp;</span>";
					})
					$("#genres").append(output);
					output2=rdata[0].GENRES_ID
					$("#genres2").text(output2);
					getPoster();
				}else{
					$("#genres").text("선호 장르가 없습니다.");
				}
			}
		})	//ajax end
	}//function end
	console.log("test");
	getGenres();
	function getPoster(){
		
		var link = 'https://api.themoviedb.org/3/discover/movie?api_key=139dd374c866d879d4ac74f2f897ac19&language=ko-KO&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres='+$("#genres2").text();
		console.log("test>>>"+$("#genres2").text());
		$.ajax({
			url:link,
			cache:false,
			data:{"MOVIE_ID" : $("#MOVIE_ID").val()},
			dataType:"json",
			success:function(rdata){
				var list=rdata;
				console.log('list:'+list);
					$("#poster").attr('src', 'https://image.tmdb.org/t/p/w300/'+rdata.results[0].poster_path);
			},
			error:function(request, status, error){
				console.log('포스터가져오기 실패');
			},
			complete:function(){
				console.log('목록완료');
			}
		})	//ajax end
	}//function end
	
})