<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>영화 토론 게시판</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<style>
* {color:white; background:#141414;}
 #myModal {
	 display: block 
} 
 /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }


</style>

<body>
<% 
boolean open = false;
if(request.getParameter("open") != null){
   open = Boolean.parseBoolean(request.getParameter("open"));
}
%>

<% if(!open) {%>
<jsp:include page="/Page/Navi/Navi.jsp" />
<%} else{ %>
<jsp:include page="/Page/Navi/Navi3.jsp" />
<%} %>

<div id="main">

      <span style="font-size: 30px; cursor: pointer; color: white;"
         onclick="openNav()">&#9776;</span>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal body -->
				<div class="modal-body">
					<form name="deleteForm" action="BoardDeleteAction.bd"
						method="post">
						<input type="hidden" name="num" value="${param.num}">

						<div class="form-group">
							<label for="pwd">비밀번호</label> 
							   <input type="password"
								class="form-control" placeholder="Enter password"
								name="BOARD_PASS" id="board_pass">
						</div>
						<button type="submit" class="btn btn-primary" >Submit</button>
					    <button type="button" class="btn btn-danger">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
if(<%=open%>)
	document.getElementById("main").style.marginLeft = "250px";


</script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
  $(function(){
	 
	  $("button").last().click(function(){
		  history.back();
	  });
  })
</script>
</html>