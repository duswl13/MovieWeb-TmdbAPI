package movie2019.review.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		
		HttpSession session = request.getSession();
		String userId = null;
		
		if(session.getAttribute("id") != null)
		userId = (String) session.getAttribute("id");
		
		
		if(userId != null) {
		boolean result = false;
		try {
			
			// �� ��� ������ �Է¹��� �������� BoardBean��ü�� ����.
			reviewvo.setUSER_ID(userId);
			//reviewvo.setMOVIE_ID(userId);
			reviewvo.setREVIEW_TITLE(request.getParameter("REVIEW_TITLE"));
			reviewvo.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
	
			// �� ��� ó���� ���� DAO�� boardInsert()�޼ҵ带 ȣ���Ѵ�.
			// �� ��� ������ �Է��� ������ ����� �ִ� reviewdata��ü�� ����.
			result = reviewdao.reviewInsert(reviewvo);

			// �� ��Ͽ� ������ ��� null�� ��ȯ.
			if (result == false) {
				System.out.println("�Խ��� ��� ����");
				forward.setRedirect(false);
				request.setAttribute("message", "�Խ��� ��� ���д�.");
				forward.setPath("error/error.jsp");
				return forward;
			}
			System.out.println("�Խ��� ��� �Ϸ�.");
			// �� ��� �Ϸ�Ǹ� �� ����� �����ֱ� ���� Redirect���θ� true�� ����
			forward.setRedirect(true);
			forward.setPath("ReviewList.rv");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
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
