package movie2019.admin.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FAQDAO faqdao = new FAQDAO();
		FAQVO faqvo = new FAQVO();

		//글번호 파라미터 값을 num변수에 저장합니다.
		int num=Integer.parseInt(request.getParameter("num"));
		
		//글의 내용을 DAO에서 읽은 후 얻을 결과를 boarddata 객체에 저장합니다.
		faqvo=faqdao.getDetail(num);
		
		ActionForward forward = new ActionForward();
				
		//DAO에서 글의 내용을 읽지 못했을 경우 null을 반환합니다.
		if(faqvo==null) {
			System.out.println("상세보기 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "게시판 상세보기 실패입니다.");
			forward.setPath("error/error.jsp");
			return null;
		}
		System.out.println("상세보기 성공");
		
		//boarddata 객체를 Request 객체에 저장합니다.
		request.setAttribute("faqdata",faqvo);
		forward = new ActionForward();
		forward.setRedirect(false);
		
		//글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
		forward.setPath("Page/AdminPage/FAQ/FAQView.jsp");
		return forward;
	}

}
