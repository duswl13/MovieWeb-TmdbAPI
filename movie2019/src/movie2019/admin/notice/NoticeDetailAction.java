package movie2019.admin.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		NoticeDAO noticedao = new NoticeDAO();
		NoticeVO noticevo = new NoticeVO();

		int num=Integer.parseInt(request.getParameter("num"));
		
		noticevo=noticedao.getDetail(num);
		
		ActionForward forward = new ActionForward();
				
		if(noticevo==null) {
			forward.setRedirect(false);
			request.setAttribute("message", "상세보기 실패.");
			forward.setPath("error/error.jsp");
			return null;
		}
		
		request.setAttribute("noticedata",noticevo);
		forward = new ActionForward();
		forward.setRedirect(false);
		
		forward.setPath("Page/AdminPage/Notice/NoticeView.jsp");
		return forward;
	}

}
