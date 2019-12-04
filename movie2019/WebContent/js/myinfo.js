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
					output='';
					$(rdata).each(function(){
						output+="<span>"+this.GENRES_NAME + "</span>";
						output+="<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
					})
					$("#genres").append(output);
				}else{
					$("#genres").text("선호 장르가 없습니다.");
				}
			}
		})	//ajax end
	}//function end
	console.log("test");
	getGenres();
})