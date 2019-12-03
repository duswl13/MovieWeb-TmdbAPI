package movie2019.review.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.review.action.ActionForward;
import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewAddAction implements Action {

	   @Override
	   public ActionForward execute(HttpServletRequest request, 
	      HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

	

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();
		ActionForward forward = new ActionForward();

		
		boolean result = false;

		try {
			
			// 글 등록 폼에서 입력받은 정보들을 BoardBean객체에 저장.
			reviewvo.setREVIEW_TITLE(request.getParameter("REVIEW_TITLE"));
			reviewvo.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
	
			// 글 등록 처리를 위해 DAO의 boardInsert()메소드를 호출한다.
			// 글 등록 폼에서 입력한 정보가 저장돼 있는 reviewdata객체를 전달.
			result = reviewdao.reviewInsert(reviewvo);

			// 글 등록에 실패한 경우 null을 반환.
			if (result == false) {
				System.out.println("게시판 등록 실패");
				forward.setRedirect(false);
				request.setAttribute("message", "게시판 등록 실패다.");
				forward.setPath("error/error.jsp");
				return forward;
			}
			System.out.println("게시판 등록 완료.");
			// 글 등록 완료되면 글 목록을 보여주기 위해 Redirect여부를 true로 설정
			forward.setRedirect(true);
			forward.setPath("ReviewList.rv");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	private String replaceParameter(String param) {
		String result = param;
		if (param != null) {
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		return result;
	}
}
