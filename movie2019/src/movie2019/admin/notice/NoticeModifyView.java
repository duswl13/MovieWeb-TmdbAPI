package movie2019.admin.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class NoticeModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		NoticeDAO noticedao=new NoticeDAO();
		NoticeVO notice = new NoticeVO();

		//파라미터로 전달받은 답변할 글 번호를 num 변수에 저장합니다.
		int num=Integer.parseInt(request.getParameter("num"));
		
		//글 번호 num에 해당하는 내용을 가져와서 boarddata 객체에 저장합니다.
		notice=noticedao.getDetail(num);
		
		//글 내용이 없는 경우
		if(notice==null) {
			System.out.println("수정 페이지 이동 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "수정 페이지 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("수정 페이지 이동 완료");
		//수정 페이지로 이동할 때 원본 글 내용을 보여주기 위해
		//boarddata객체를 Request 객체에 저장합니다.
		request.setAttribute("notice", notice);
		forward.setRedirect(false);
		//수정 페이지 경로 지정합니다.
		forward.setPath("Page/AdminPage/Notice/NoticeModify.jsp");
		
		return forward;
	}

}
