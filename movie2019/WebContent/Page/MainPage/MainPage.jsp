<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/MainPagestyle.css">

<!-- jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--    <script type="text/javascript"
      src="http://code.jquery.com/jquery-2.1.4.js"></script>-->
<!-- Bootstrap Js CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>
<body>
	<jsp:include page="/Page/Navi/Navi.jsp" />

	<div id="main">

		<span style="font-size: 30px; cursor: pointer; color: white;"
			onclick="openNav()">&#9776;</span>

		<div class="video-background">
			<div class="video-foreground">

				<iframe id="mainVideo"
					src="https://www.youtube.com/embed/${movieurl }?version=3&mute=1&loop=1&autoplay=1&rel=0&controls=0&showinfo=0&playlist=${movieurl }"
					frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen> </iframe>
			</div>


		</div>


		<div class="main_box">

			<div class="main_box2">
				<h1 id="m_head">${movieitem.title }</h1>

				<div class="starRev">
					<c:forEach var="test" begin="1" end="${movieitem.star }">
						<span class="starR"></span>
					</c:forEach>
				</div>
				<p id="m_reviews" class="gray">${movieitem.release_date}</p>
				<p id="m_content">${movieitem.overview}</p>

			</div>

		</div>

		<div class="container-fluid main-list-padding">

			<div class="row">

				<div class="col-md-12">
					<h3>인기 영화</h3>
					<span class="more"
						onclick="location.href='<%=request.getContextPath()%>/MovieList.ml?option=1'">더보기</span>
					<div class="carousel slide multi-item-carousel" id="theCarousel1">
						<div class="carousel-inner">


							<c:forEach var="item" begin="1" end="5" step="1"
								items="${p_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.count == 1}">
										<div class="item active">

											<div class="col-xs-4">
												<a
													href="moviedetail.ml?open=false&id=${item.id}&title=${item.title}">
													<img
													src="https://image.tmdb.org/t/p/w500${item.poster_path}"
													class="img-responsive">

													<div class="centered">
														<a href="javascript:hidden(${item.id},'${item.title}',0)"
															class="btn btn-danger hiddenMovie"
															style="float: right; margin-bottom: 8px;">숨김</a>
														<h1 style="clear: right; float: right;">${item.title}</h1>

														<div style="clear: right; float: right;">
															<c:forEach var="test" begin="1" end="${item.star }">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="item">
											<div class="col-xs-4">
												<a
													href="moviedetail.ml?open=false&id=${item.id}&title=${item.title}">
													<img
													src="https://image.tmdb.org/t/p/w500${item.poster_path}"
													class="img-responsive">

													<div class="centered">
														<a href="javascript:hidden(${item.id},'${item.title}',0)"
															class="btn btn-danger hiddenMovie"
															style="float: right; margin-bottom: 8px;">숨김</a>
														<h1 style="clear: right; float: right;">${item.title}</h1>

														<div style="clear: right; float: right;">
															<c:forEach var="test" begin="1" end="${item.star }">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>




							</c:forEach>

						</div>
						<a class="left carousel-control" href="#theCarousel1"
							data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
						<a class="right carousel-control" href="#theCarousel1"
							data-slide="next"><i
							class="glyphicon glyphicon-chevron-right"></i></a>


					</div>

				</div>
			</div>
		</div>









		<div class="container-fluid main-list-padding">

			<div class="row">

				<div class="col-md-12">
					<h3>최신 영화</h3>
					<span class="more"
						onclick="location.href='<%=request.getContextPath()%>/MovieList.ml?option=2'">더보기</span>
					<div class="carousel slide multi-item-carousel" id="theCarousel2">
						<div class="carousel-inner">


							<c:forEach var="item" begin="1" end="5" step="1"
								items="${l_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.count == 1}">
										<div class="item active">

											<div class="col-xs-4">
												<a
													href="moviedetail.ml?open=false&id=${item.id}&title=${item.title}">
													<img
													src="https://image.tmdb.org/t/p/w500${item.poster_path}"
													class="img-responsive">

													<div class="centered">
														<a href="javascript:hidden(${item.id},'${item.title}',1)"
															class="btn btn-danger hiddenMovie"
															style="float: right; margin-bottom: 8px;">숨김</a>
														<h1 style="clear: right; float: right;">${item.title}</h1>

														<div style="clear: right; float: right;">
															<c:forEach var="test" begin="1" end="${item.star }">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="item">
											<div class="col-xs-4">
												<a
													href="moviedetail.ml?open=false&id=${item.id}&title=${item.title}">
													<img
													src="https://image.tmdb.org/t/p/w500${item.poster_path}"
													class="img-responsive">

													<div class="centered">
														<a href="javascript:hidden(${item.id},'${item.title}',1)"
															class="btn btn-danger hiddenMovie"
															style="float: right; margin-bottom: 8px;">숨김</a>
														<h1 style="clear: right; float: right;">${item.title}</h1>

														<div style="clear: right; float: right;">
															<c:forEach var="test" begin="1" end="${item.star }">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>




							</c:forEach>

						</div>
						<a class="left carousel-control" href="#theCarousel2"
							data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
						<a class="right carousel-control" href="#theCarousel2"
							data-slide="next"><i
							class="glyphicon glyphicon-chevron-right"></i></a>


					</div>

				</div>
			</div>
		</div>






		<div class="container-fluid main-list-padding">

			<div class="row">

				<div class="col-md-12">
					<h3>개봉 예정 영화</h3>
					<span class="more"
						onclick="location.href='<%=request.getContextPath()%>/MovieList.ml?option=3'">더보기</span>
					<div class="carousel slide multi-item-carousel" id="theCarousel3">
						<div class="carousel-inner">


							<c:forEach var="item" begin="1" end="5" step="1"
								items="${y_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.count == 1}">
										<div class="item active">

											<div class="col-xs-4">
												<a
													href="moviedetail.ml?open=false&id=${item.id}&title=${item.title}">
													<img
													src="https://image.tmdb.org/t/p/w500${item.poster_path}"
													class="img-responsive">

													<div class="centered">
														<a href="javascript:hidden(${item.id},'${item.title}',2)"
															class="btn btn-danger hiddenMovie"
															style="float: right; margin-bottom: 8px;">숨김</a>
														<h1 style="clear: right; float: right;">${item.title}</h1>

														<div style="clear: right; float: right;">
															<c:forEach var="test" begin="1" end="${item.star }">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="item">
											<div class="col-xs-4">
												<a
													href="moviedetail.ml?open=false&id=${item.id}&title=${item.title}">
													<img
													src="https://image.tmdb.org/t/p/w500${item.poster_path}"
													class="img-responsive">

													<div class="centered">
														<a
															href="javascript:hidden(${item.id},'${item.original_title}',2)"
															class="btn btn-danger hiddenMovie"
															style="float: right; margin-bottom: 8px;">숨김</a>
														<h1 style="clear: right; float: right;">${item.title}</h1>

														<div style="clear: right; float: right;">
															<c:forEach var="test" begin="1" end="${item.star }">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>




							</c:forEach>

						</div>
						<a class="left carousel-control" href="#theCarousel3"
							data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
						<a class="right carousel-control" href="#theCarousel3"
							data-slide="next"><i
							class="glyphicon glyphicon-chevron-right"></i></a>


					</div>

				</div>
			</div>
		</div>

	</div>





	<script>
		var hiddenlist = new Array();
		<c:forEach items="${hidden}" var="item">
		hiddenlist.push("${item}");
		</c:forEach>
		ToInteger();

		function ToInteger() {
			for (var j = 0; j < hiddenlist.length; j++)
				hiddenlist[j] = hiddenlist[j] * 1;
		}
		
		function hiddenremove(list) {
			for (var i = 0; i < list.length; i++) {
				console.log('확인:' + list[i].id*1);
				if (hiddenlist.includes(list[i].id*1)) {
					console.log('지움지움:' + list[i].id*1);
					list.splice(i, 1);
					i--;
				}
			}
			return list;
		}

		var p_list = new Array();

		<c:forEach items="${p_list}" var="item2">
		var i = 0;

		<c:if test="${empty item2.star}">
		i = "${item2.star}";
		</c:if>

		p_list.push({
			poster_path : "${item2.poster_path}",
			id : "${item2.id}",
			original_title : "${item2.original_title}",
			title : "${item2.title}",
			Star : i
		});
		</c:forEach>

		var l_list = new Array();

		<c:forEach items="${l_list}" var="item2">
		var i = 0;

		<c:if test="${empty item2.star}">
		i = "${item2.star}";
		</c:if>

		l_list.push({
			poster_path : "${item2.poster_path}",
			id : "${item2.id}",
			original_title : "${item2.original_title}",
			title : "${item2.title}",
			Star : i
		});
		</c:forEach>

		var y_list = new Array();

		<c:forEach items="${y_list}" var="item2">
		var i = 0;

		<c:if test="${empty item2.star}">
		i = "${item2.star}";
		</c:if>

		y_list.push({
			poster_path : "${item2.poster_path}",
			id : "${item2.id}",
			original_title : "${item2.original_title}",
			title : "${item2.title}",
			Star : i
		});
		</c:forEach>

		//몇번쨰 캐러셀의 몇번쨰 div인지
		function hidden(movieId, movieTitle, ca) {
			//숨김 버튼 눌렀을 경우 서블릿으로 숨김 영화 insert

			var restData = {
				"movieId" : movieId,
				"movieTitle" : movieTitle
			};

			$.ajax({
				url : 'InsertHidden.ml',
				data : restData,
				dataType : 'json',
				success : function(rdata) {
					
					
					
					if (rdata == 0) {
						alert('로그인 먼저 해주세요.');
						location.href='<%=request.getContextPath()%>/Page/Login/login.jsp';
					} else {
						
						hiddenlist = null;
						hiddenlist = rdata;
						alert("숨김처리되었습니다.");
						console.log("숨김 목록 : "+hiddenlist);
						ToInteger();

						switch (ca) {
						case 0:
							p_list = hiddenremove(p_list);
							printMovie(p_list, ca);
							break;
						case 1:
							l_list = hiddenremove(l_list);
							printMovie(l_list, ca);
							break;
						case 2:
							y_list = hiddenremove(y_list);
							printMovie(y_list, ca);
							break;

						}
					}

				}
			});

		}

		function printMovie(list, count) {
			console.log('printMovie:' + list.length);

			if (list == null && list.length == 0) {
				//표시할 데이터없음
				return;
			}
			var print = '';
			var i = 0;

			for (var check = 0; check < 5; check++) {

				if (check == 0)
					print += '<div class="item active">\n';
				else
					print += '<div class="item">\n';

				print += '<div class="col-xs-4">\n';

				list[i].title = list[i].title.replace(/\"/gi, "");
				list[i].title = list[i].title.replace(/\'/gi, "");

				print += '<a href="moviedetail.ml?open=false&id=' + list[i].id
						+ '&title=' + list[i].title + '">\n';
				print += '<img src="https://image.tmdb.org/t/p/w500'+list[i].poster_path+'" class="img-responsive">\n';
				print += '\n<div class="centered">\n';
				print += '<a href="javascript:hidden('
						+ list[i].id
						+ ',\''
						+ list[i].title
						+ '\','
						+ count
						+ ','
						+ check
						+ ')" class="btn btn-danger hiddenMovie" style="float:right; margin-bottom:8px;">숨김</a>';
				print += '<h1 style="clear:right; float:right;">'
						+ list[i].title + '</h1>\n';

				print += ' <div style="clear:right; float:right;>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += '<span class="fa fa-star"></span>';
				print += ' </div>';

				print += '\n</div></a></div></div>\n';
				i++;
			}

			//console.log(print);
			$('.carousel-inner:eq(' + count + ')').html(print);
			carouselSetting(count);

		}

		// 슬라이드 쇼의 슬라이드마다 슬라이드의 다음 슬라이드 항목을 복사합니다.
		// 다음, 다음 항목에 대해서도 동일하게 수행합니다.
		carouselSetting(0);
		carouselSetting(1);
		carouselSetting(2);

		function carouselSetting(count) {

			$('.multi-item-carousel:eq(' + count + ') .item')
					.each(
							function(index) {

								var next = $(this).next();

								if (!next.length) {
									next = $(this).siblings(':first');
								}
								next.children(':first-child').clone().appendTo(
										$(this));

								if (next.next().length > 0) {
									next.next().children(':first-child')
											.clone().appendTo($(this));
								} else {
									$(this).siblings(':first').children(
											':first-child').clone().appendTo(
											$(this));
								}
							});

		}
	</script>

</body>
</html>