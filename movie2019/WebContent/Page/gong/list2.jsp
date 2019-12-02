<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	boolean open = false;
	if (request.getParameter("open") != null) {
		open = Boolean.parseBoolean(request.getParameter("open"));
	}
%>
<%
	if (!open) {
%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%
	} else {
%>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%
	}
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body, html {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	background: black;
}

.searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 60px;
	background-color: #353b48;
	border-radius: 30px;
	padding: 10px;
}

.search_input {
	color: white;
	border: 0;
	outline: 0;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 40px;
	transition: width 0.4s linear;
}

.search_input {
	padding: 0 10px;
	width: 450px;
	caret-color: red;
	transition: width 0.4s linear;
}

.search_icon {
	background: white;
	color: #e74c3c;
	height: 40px;
	width: 40px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
	text-decoration: none;
}

.testing1 {
	display: inline;
}

.btn-dark-moon {
	background: #141E30; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #243B55, #141E30);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #243B55, #141E30);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	color: #fff;
	border: 3px solid #eee;
	margin: 20px;
	
}
</style>

<jsp:include page="header.jsp" />
<meta charset="UTF-8">
<script type="text/javascript">
	$(function() {
		if (
<%=open%>
	)
			document.getElementById("main").style.marginLeft = "250px";

		list("1");//시작

		$("#search").click(
				function() {//클릭이벤트
					if ($("input[name=check]:checked").val() == ""
							|| $("input[name=check]:checked").val() == null) {
						alert("선택또는 입력해주세요");
						return;
					}

					$("#result").empty();
					if ($("input[name=check]:checked").val() == "notice_tbl") {
						gongSearch("1");
					}
					if ($("input[name=check]:checked").val() == "faq_tbl") {
						faqSearch("1");
					}

				});
		$("#keyword")
				.keydown(
						function(key) {//엔터이벤트 
							if (key.keyCode == 13) {
								if ($("input[name=check]:checked").val() == ""
										|| $("input[name=check]:checked").val() == null) {
									alert("선택또는 입력해주세요");
									return;
								}

								$("#result").empty();
								if ($("input[name=check]:checked").val() == "notice_tbl") {
									gongSearch("1");
								}
								if ($("input[name=check]:checked").val() == "faq_tbl") {
									faqSearch("1");
								}
							}
						});

		$("#gong").click(function() {
			$("#result").empty();
			list("1");
		})
		$("#faq").click(function() {
			$("#result").empty();
			flist("1");
		})
		$("#mail").click(function() {
			$("#result").empty();
			mail();
			
		});
		
		
	});
	
	function mail() { //메일
		$.ajax({
			type : "post",
			url : "mail.gong",
			success : function(result) {
				$("#result").html(result);
			},
			error : function(err) {
				alert("통신X");
			}

		});
	}
	
	
	function faqSearch(curPage) {//FAQ 서치결과
		$.ajax({
			type : "post",
			url : "gongSearch.gong",
			data : {
				"check" : $("input[name=check]:checked").val(),
				"keyword" : $("#keyword").val(),
				"curPage" : curPage
			},
			success : function(result) {
				$("#result").html(result);
			},
			error : function(err) {
				alert("통신X");
			}

		});
	}
	function gongSearch(curPage) {//공지 서치결과
		$.ajax({
			type : "post",
			url : "gongSearch.gong",
			data : {
				"check" : $("input[name=check]:checked").val(),
				"keyword" : $("#keyword").val(),
				"curPage" : curPage
			},
			success : function(result) {
				$("#result").html(result);
			},
			error : function(err) {
				alert("통신X");
			}

		});

	}

	function list(curPage) {//공지리스트
		$.ajax({
			type : "post",
			url : "gonglist.gong",
			data : {
				"curPage" : curPage
			},
			success : function(result) {
				$("#result").html(result);
			},
			error : function(err) {
				alert("통신X");
			}

		});

	}

	function flist(curPage) {//FAQ리스트
		$.ajax({
			type : "post",
			url : "faq.gong",
			data : {
				"curPage" : curPage
			},
			success : function(result) {
				$("#result").html(result);

			},
			error : function(err) {
				alert("통신X");
			}

		});

	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="main">

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>





		<div class="container h-100">
			<div class="d-flex justify-content-center h-100">
				<div class="testing1">
					<div class="custom-control custom-radio">
						<input type="radio" name="check" id="jb-radio-1"
							class="custom-control-input" value="notice_tbl"> <label
							class="custom-control-label" for="jb-radio-1">공지사항</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="check" id="jb-radio-2"
							class="custom-control-input" value="faq_tbl"> <label
							class="custom-control-label" for="jb-radio-2">FAQ</label>
					</div>
				</div>
				<div class="searchbar">
					<input class="search_input" type="text" id="keyword"
						placeholder="Search...">
					<button class="search_icon" id="search"></button>
				</div>
			</div>
		</div>
		
				<div class="row text-center" style="width: 100%">
					<button class="col btn btn-dark-moon btn-rounded"
						style="width: 30%" onclick="gong" id="gong">공지사항</button>
					<button class="col btn btn-dark-moon btn-rounded"
						style="width: 30%" onclick="faq" id="faq">FAQ(자주하는 질문)</button>
						<button class="col btn btn-dark-moon btn-rounded"
						style="width: 30%" onclick="mail" id="mail">Mail(고객문의)</button>
				</div>
		

		<div id="result"></div>


	</div>



</body>
</html>