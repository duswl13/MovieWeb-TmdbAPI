<!-- 모달! 여기가 모달임 내리뷰모아보기 모달 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
         <div class="modal-dialog ">
            <div class="modal-content">
      <!-- Modal body -->
               <div class="modal-body">
      <form name=review_modify_form method=post>

      <div class="outermodal">
               <button type="button" class="close modalclose" data-dismiss="modal" aria-label="Close">X</button>
            <div class="achtungfloat">          
            </div>
            <div class="reviewarea">
         <!--    <input name=movieid type=text hidden value=${movieId}> -->
                  <div class="rvtitle">제목<input type=text required="required" name=rvtitle value=${vo.review_title }></div>
                  <div class="rvcontent">
                     <textarea class="rvcontentarea" cols=50 rows=12 name=rvcontent>${vo.review_content}</textarea>
                  </div>   
                   
                     <div class=rvsubmit>
                    <button type="submit" class="submitbutton button-gradiant" value="modify" 
                    onclick="javascript: form.action='<%=request.getContextPath() %>/PriReviewModify.rv?movieId=${vo.movie_id}';">수정</button>
                    	 
    				<button type="submit" class="submitbutton button-gradiant" value="delete" 
    				onclick="javascript: form.action='<%=request.getContextPath() %>/PriReviewDelete.rv?movieId=${vo.movie_id}';">삭제</button>   
             			
                  </div>
            </div>
            
         </div>
      </form>
               </div>       
            </div>
         </div>
     