<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>
<title>마이페이지:관심 컨텐츠</title>
<style>
p {
	color: white;
	padding-right: 50px;
	font-size: 20px;
}

#like1, #like2{
	width:100%;
	height:200px;
	margin:10px;
	margin-bottom:50px;
}
body{
	background : black;
}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	if(<%=open%>)
		document.getElementById("main").style.marginLeft = "250px";

});

</script>
</head>
<body>
<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>

<div id="main">
      <span style="font-size: 30px; cursor: pointer; color: white;"
         onclick="openNav()">&#9776;</span>
<div id="like1">
	<p>관심 장르</p>
	<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Left</button>

<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Top</button>

<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus
sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Bottom</button>

<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Right</button>
</div>
<div id="like2">
	<p>관심 배우</p>
	<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Left</button>

<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Top</button>

<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus
sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Bottom</button>

<button type="button" class="btn btn-secondary" title="" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-original-title="Popover Title">Right</button>
</div>
</div>
</body>
</html>