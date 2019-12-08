
const api_key = "4b3aa211760fe451c0edcb032c99f6b2";
const youtube = document.querySelector(".youtube");
    window.addEventListener('load', () => {
        const key= "aa66c5868406af2e316790e9ab3eadb7";
        //어제 날짜 구하기
        var newDate = new Date();
    	var year = newDate.getFullYear();
    	var mon = newDate.getMonth()+1;
    	if(mon<10){
    		mon = "0"+mon;
    	};
    	var day = newDate.getDate()-1;
    	if(day<10){
    		day = "0"+day;
    	};
    	//어제날짜
    	const y = year+""+mon+""+day;
        const apiUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="+key+"&targetDt="+y;
        const myUl = document.querySelector('.boxOfficeList');
        const overlay = document.querySelector("#overlay");
        const photoCon = document.querySelector(".photo");
        const closeButton = document.querySelector(".close");
        const xhr = new XMLHttpRequest(); //리퀘스트 객체를 만든다.
        var sr = document.getElementsByClassName('src1');
        console.log(sr.length);
        closeButton.addEventListener('click', () => {
            overlay.classList.remove("show");
            youtube.innerHTML = "";
            //스크롤 방지 해제
            document.body.classList.remove("stop-scrolling");
        });
        
        
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                const jsonObj = JSON.parse(xhr.response);        
                const boxOfficeResult = jsonObj['boxOfficeResult'];                       
                const movieList = boxOfficeResult['dailyBoxOfficeList'];
             
                movieList.forEach(element => {               	 
                	
                           
                	const base_url = "https://image.tmdb.org/t/p/w300/";
                    const searchUrl = "https://api.themoviedb.org/3/search/movie?api_key="+api_key+"&language=ko-Kr&page=1&include_adult=false&query="+element['movieNm'];
                    //console.log(searchUrl);
                    fetch(searchUrl).then(res=>res.json()).then(function(res){
                    	
                    //console.log(res);
                    //화면 디자인에 따라 필요한 DOM 요소들을 생성해 준다.
                    const myLi = document.createElement('li');
                    const output = "<div><h2 style='font-size: 1em;' class='title1'>"+element['movieNm']+"</h2></div>";
                    myLi.innerHTML = output;
                   // console.log(res.results[0].id);
                    //myLi.setAttribute("onClick","viewTrailer("+res.results[0].id+','+base_url+""+res.results[0].poster_path+")");
                    myLi.setAttribute("onClick","viewTrailer("+"'"+res.results[0].id+"'"+","+"'"+base_url+""+res.results[0].poster_path+"'"+")");
                    myLi.style.backgroundImage = "url("+"'"+base_url+""+res.results[0].poster_path+"'"+")";                    	                	   
                    myUl.appendChild(myLi);
        
                }).catch(e=>console.log(e));
                //console.log(movieList);

            });
            }
        }
        xhr.open('GET', apiUrl, true);
        xhr.send();
        
       
    });

    function viewTrailer(movieId,poster) {
    	console.log(poster);
		
		//$("#src1").attr("src",base_url+""+res.results[0].poster_path);
    	const movieUrl= "https://api.themoviedb.org/3/movie/"+movieId+"/videos?api_key="+api_key
    	fetch(movieUrl).then(res=>res.json()).then(function(res){
    		//console.log(res.results[0].key);
    		
    		let output="";
    		if(res.results.length>0){
    			const youtubeId = res.results[0].key;
    			//console.log(res.results[0].key);
    			output="<iframe width='100%' height='100%' src='https://www.youtube.com/embed/"+youtubeId+"?autoplay=1'></iframe>";
    			//console.log(output);
    		}else{
    			output="<h3 class='noVideo'>재생할 예고편이 없습니다.</h3>";
    		}
    		youtube.innerHTML = output;    		
    	}).catch(e=>console.log(e));
    	
    	  overlay.classList.add("show");
         
         overlay.setAttribute("style", "background-image: url('"+poster+"'); background-size: auto; background-repeat: no-repeat;");
         //배경 body 스크롤 중지
         document.body.classList.add("stop-scrolling"); 
	};
