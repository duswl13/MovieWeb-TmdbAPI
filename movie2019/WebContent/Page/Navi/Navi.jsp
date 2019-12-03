<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	function enterkey() {
		if (window.event.keyCode == 13) {
			var text = $('#search-form').val();
			//$('#search-form').val().replace(/(\s*)/g, "")
			if(text != '' && text != null)
			location.href = '<%=request.getContextPath()%>/Search.ml?open=false&key='
					+ text;
			else
				alert('검색어를 입력해주세요.');
		}
	}
</script>

<style>
.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #000;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	text-decoration: none;
	font-size: 14px;
	color: #fff;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-left .5s;
	padding-top: 16px;
	padding-left: 16px;
	padding-right: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

#accordian {
	background: #000;
	width: 250px;
	margin: 100px auto 0 auto;
	color: white;
}

ul {
	padding-left: 10px;
	margin-right: 10px;
}

/* 메뉴 스타일 */
#accordian h2 {
	font-size: 14px;
	line-height: 34px;
	padding: 0 10px;
	cursor: pointer;
}

#accordian h2:hover {
	text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}

/* 아이콘폰트 스타일 */
#accordian h2 span {
	font-size: 16px;
	margin-right: 10px;
}

#accordian li {
	list-style-type: none;
}

/* 서브메뉴 스타일 */
#accordian ul ul li a {
	color: white;
	text-decoration: none;
	font-size: 12.5px;
	line-height: 27px;
	display: block;
	padding-top: 8px;
	padding-left: 16px;
	padding-bottom: 8px;
	-webkit-transition: all 0.15s;
	-moz-transition: all 0.15s;
	-o-transition: all 0.15s;
	-ms-transition: all 0.15s;
	transition: all 0.15s;
	-webkit-transition: all 0.15s;
}

#accordian ul ul li a:hover {
	background: #003545;
	border-left: 5px solid #09c;
}

/* active 클래스 외에 것은 보이지 않게 하기 */
#accordian ul ul {
	display: none;
}

#accordian li.active ul {
	display: block;
}

#search-form {
	width: 100%;
	padding: 8px;
	color: white;
	border: 0;
	background-color: #141414;
	margin-bottom: 3em;
}

#login {
	width: 100%;
	padding: 8px;
	color: white;
	border: 1 solid white;
	background-color: #141414;
	margin-top: 3em;
}
.logo {font-size:42pt; font-weight:bold; text-decoration:none; color:#27AE60; 
	display: flex;
	justify-content: center; /*가운데정렬*/}
</style>
</head>
<body>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>


	<a href="<%=request.getContextPath()%>/main.ml"><span class=logo>VOSHU</span></a>
						
		<div id="accordian">

		


					<ul>
						<li><input type="text" id="search-form" placeholder="Search"
							onkeyup="enterkey();"></li>
					</ul>

					<ul>
						<li>
							<h2>
								<a href='<%=request.getContextPath()%>/MovieList.ml?option=1'>영화</a>
							</h2>

						</li>
						<li>
							<h2>
								<a href="<%=request.getContextPath()%>/list.ch">추천</a>
							</h2>
						</li>
						<li>
							<h2>
								<a href='<%=request.getContextPath()%>/Page/Review/review_list.jsp'>리뷰</a>
							</h2>
						</li>
						<li>
							<h2>
								<a href="<%=request.getContextPath()%>/Page/Board/board/board_list.jsp">게시판</a>
							</h2>
						</li>

						<li>
							<h2>마이페이지</h2>
							<ul>
								<li><a href="<%=request.getContextPath()%>/Page/MyPage/MyInfo/MyInfo.jsp">내 정보 수정</a></li>
								<li><a href="<%=request.getContextPath()%>/Page/MyPage/Like/Like.jsp">관심 콘텐츠</a></li>
								<li><a href="<%=request.getContextPath()%>/Page/MyPage/MyReview/MyReview.jsp">내 리뷰 관리</a></li>
								<li><a href="<%=request.getContextPath()%>/Page/MyPage/Hidden/Hidden.jsp">숨긴 콘텐츠 관리</a></li>
							</ul>
						</li>
						<li>
							
								<h2><a href="<%=request.getContextPath()%>/list.gong">공지사항</a></h2>
							
						</li>
						<li>
							<h2>관리자 페이지</h2>
							<ul>
								<li><a href="<%=request.getContextPath()%>/NoticeList.bo">공지사항 관리</a></li>
								<li><a href="<%=request.getContextPath()%>/FAQList.fa">FAQ 관리</a></li>
								<li><a href="<%=request.getContextPath()%>/user_list.ul">회원 관리</a></li>
							</ul>
						</li>
					</ul>

					<ul>
						<li><button type="button" id="login" onclick="location.href='<%=request.getContextPath()%>/Page/Login/login.jsp'">Login</button></li>
					</ul>
		</div>
	</div>


	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0px";
		}

		$(function() {
			$("#accordian h2").click(function() {
				$("#accordian ul ul").slideUp();
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
				}
			})
		})
	</script>

</body>
</html>
