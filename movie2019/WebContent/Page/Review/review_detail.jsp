<!-- 내 리뷰 모아보기 수정/삭제 Modal -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="modal-dialog ">
	<div class="modal-content">
		<!-- Modal body -->
		<div class="modal-body">
			<form name=review_modify_form method=post>

				<div class="outermodal">
					<button type="button" class="close modalclose floatright" data-dismiss="modal"
						aria-label="Close">X</button>
					<div class="achtungfloat"></div>
					<div class="reviewarea">

						<div class="rvtitle floatleft"> 한 줄 감상<input type=text required="required" name=rvtitle value=${vo.review_title }>
						</div>
						<div class="rvcontent">
							<textarea class="rvcontentarea" cols=50 rows=12 name=rvcontent style="resize: none;">${vo.review_content}</textarea>
							<span style="color:#141414; font-size:10pt;" id="counter">-/200자</span>
						</div>

						<div class=rvsubmit>
							<button type="submit" class="submitbutton button-gradiant"
								value="modify"
								onclick="javascript: form.action='<%=request.getContextPath() %>/PriReviewModify.rv?movieId=${vo.movie_id}';">수정</button>

							<button type="submit" class="submitbutton button-gradiant"
								value="delete"
								onclick="javascript: form.action='<%=request.getContextPath() %>/PriReviewDelete.rv?movieId=${vo.movie_id}';">삭제</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
   //textarea 글자수 제한/카운팅
   $('.rvcontentarea').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html(""+content.length+"/200자");
	    if (content.length > 200){
	        alert("VOSHU 리뷰는 최대 200자 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#counter').html("200/200자");
	    }
	});
</script>