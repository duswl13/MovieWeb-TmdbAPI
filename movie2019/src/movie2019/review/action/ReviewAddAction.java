package movie2019.review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie2019.login.action.ActionForward;
import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;



public class ReviewAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();
		ActionForward forward = new ActionForward();

		String realFolder = "";

		String saveFolder = "reviewupload"; // WebContent아래 폴더 생성.

	
		// 실제 저장 경로 지정.		
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);

		System.out.println("realFolder=" + realFolder);
		boolean result = false;

		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder,  
						"UTF-8", new DefaultFileRenamePolicy());

			// 글 등록 폼에서 입력받은 정보들을 BoardBean객체에 저장.
			reviewdata.setBOARD_NAME(multi.getParameter("BOARD_NAME"));
			reviewdata.setBOARD_PASS(multi.getParameter("BOARD_PASS"));
			reviewdata.setBOARD_SUBJECT(replaceParameter(multi.getParameter("BOARD_SUBJECT")));
			reviewdata.setBOARD_CONTENT(replaceParameter(multi.getParameter("BOARD_CONTENT")));


			// 글 등록 처리를 위해 DAO의 boardInsert()메소드를 호출한다.
			// 글 등록 폼에서 입력한 정보가 저장돼 있는 reviewdata객체를 전달.
			result = ReviewDAO.reviewInsert(reviewdata);

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
			forward.setPath("BoardList.bo");
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
