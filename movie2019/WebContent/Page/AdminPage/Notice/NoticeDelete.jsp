<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>MVC °Ô½ÃÆÇ</title>

<jsp:include page="header.jsp" />
<script src="js/delete.js" charset="UTF-8"></script>
<script>
  $(function(){
	 
	  $("button").last().click(function(){
		  history.back();
	  });
  })
</script>
</head>
<style>
 #myModal {
	 display: block 
} 
</style>


<body>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">


				<!-- Modal body -->
				<div class="modal-body">
					<form name="deleteForm" action="BoardDeleteAction.bo"
						method="post">
						<input type="hidden" name="num" value="${param.num}">

						<div class="form-group">
							<label for="pwd">ºñ¹Ð¹øÈ£</label> 
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
</body>
</html>