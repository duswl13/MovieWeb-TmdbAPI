<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="js/delete.js" charset="euc-kr"></script>
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
					<form name="deleteForm" action="ReviewDeleteAction.rv"
						method="post">
						<input type="hidden" name="num" value="${param.num}">

						<button type="submit" class="btn btn-primary" >Submit</button>
					    <button type="button" class="btn btn-danger">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>