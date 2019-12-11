<!-- 내 리뷰 모아보기 수정/삭제 Modal -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

.modal-content {padding:30px;}

tr .rvtr {
   text-align: center
}

td .rvtd {
   padding: 10px;
}

button {
   width:150px;
   height: 40px;
   line-height: 40px;
   padding:0px;
   font-weight: bold;
   color: white;
   border: 0 none;
   border-radius: 3px;
   cursor: pointer;
   margin: 10px 5px;
}

.btn-gradiant {
   
      background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.btn-gradiant:hover {
      background: #1dc8cc;
    background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc 0%, #2cdd9b 100%);
    background: -webkit-gradient(linear, left top, right top, from(#1dc8cc), to(#2cdd9b));
    background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);   
}

span {
   font-size: 8pt;
}

input {
   background: #edf1f2;
   border: 0px solid SteelBlue;
   border-radius: 0px;
   color: #141414;
   font-size: 9pt;
   padding: 5px;
   margin: 5px;
}

textarea {
   width: 90%;
   background: #edf1f2;
   border: 0px solid SteelBlue;
   border-radius: 0px;
   color: #141414;
   font-size: 10pt;
   padding: 5px;
   margin: 5px;
}

.title {color:#27AE60} /**/

.bg-gradiant {
   
      background: #1dc8cc;
    background: -webkit-linear-gradient(legacy-direction(to right), #1dc8cc 0%, #2cdd9b 100%);
    background: -webkit-gradient(linear, left top, right top, from(#1dc8cc), to(#2cdd9b));
    background: -webkit-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: -o-linear-gradient(left, #1dc8cc 0%, #2cdd9b 100%);
    background: linear-gradient(to right, #1dc8cc 0%, #2cdd9b 100%);
    
}

.bg-gradiant:hover {
      background: #2cdd9b;
    background: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    background: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    background: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    background: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.font-gradiant {
    color: #2cdd9b;
    color: -webkit-linear-gradient(legacy-direction(to right), #2cdd9b 0%, #1dc8cc 100%);
    color: -webkit-gradient(linear, left top, right top, from(#2cdd9b), to(#1dc8cc));
    color: -webkit-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    color: -o-linear-gradient(left, #2cdd9b 0%, #1dc8cc 100%);
    color: linear-gradient(to right, #2cdd9b 0%, #1dc8cc 100%);
}

.submtbutton {
   width:40px;
   font-size:12pt;
   background:none;
}

button .modalclose{color:#2cdd9b; font-size:13pt;}

.floatright {float:right; padding:0px; margin-top:-20px;}
.reviewarea {right:clear;}

div .rvsubmit {text-align:center;}

       /* modal position(center)*/
        .modal {
          text-align: center;
        }
        @@media screen and (min-width: 768px) {
          .modal:before {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 100%;
          }
        }
        .modal-dialog {
          display: inline-block;
          text-align: left;
          vertical-align: middle;
        }
        
.modal-content {
    margin-top: 160px;
    margin-left: auto;
}


</style>	


<div class="modal-dialog ">
	<div class="modal-content">
		<!-- Modal body -->
		<div class="modal-body">
			<form name=review_modify_form method=post>

				<div class="outermodal">
					<button type="button" class="close modalclose" data-dismiss="modal"
						aria-label="Close">X</button>
					<div class="achtungfloat"></div>
					<div class="reviewarea">

						<div class="rvtitle"> 한 줄 감상<input type=text required="required" name=rvtitle value=${vo.review_title }>
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