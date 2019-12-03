package movie2019.review.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie2019.login.action.ActionForward;
import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();

		String realFolder = "";

		// WebContent 아래에 꼭 폴더를 생성하세요.
		String saveFolder = "reviewupload";

		int fileSize = 10 * 1024 * 1024; // 업로드할 파일의 최대 사이즈 입니다. 10MB

		// 실제 저장 경로를 지정합니다.
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);

		System.out.println("realFolder = " + realFolder);
		boolean result = false;

		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
			// BoardBean 객체에 글 등록 폼에서 입력 받은 정보들을 저장합니다.
			int num = Integer.parseInt(multi.getParameter("BOARD_NUM"));
			String pass = multi.getParameter("BOARD_PASS");

			// 글쓴이가 맞는지 확인하기 위해 저장된 비번 & 입력 비번 비교
			boolean usercheck = reviewdao.isReviewWriter(num, pass);

			// 비밀번호가 다른 경우
			if (usercheck == false) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}

			// 비밀번호가 일치하는 경우 수정 내용 설정한다.
			// BoardBean객체에 글 등록 폼에서 입력받은 정보들을 저장.
			reviewdata.setBOARD_PASS(pass);
			reviewdata.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
			reviewdata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));

			String check = multi.getParameter("check");
			System.out.println("check=" + check);

			if (check != null) { // 기존 파일 그대로 사용하는 경우
				reviewdata.setBOARD_FILE(check);
			} else { // 시스템에 업로드된 실제 파일명 가져오기
				String filename = multi.getFilesystemName("BOARD_FILE");
				reviewdata.setBOARD_FILE(filename);
			}

			// DAO에서 수정 메소드 호출해 수정하기
			result = reviewdao.boardModify(reviewdata);

			// 수정 실패한 경우
			if (result == false) {
				System.out.println("게시판 수정 실패");
				forward.setRedirect(false);
				request.setAttribute("message", "게시판 수정 실패");
				forward.setPath("error/error.jsp");
				return forward;
			}
			// 게시글 수정이 제대로 된 경우
			System.out.println("수정 완료!");

			forward.setRedirect(true);
			// 수정한 글 내용 확인을 위해 글 내용보기 페이지를 경로로 설정
			forward.setPath("BoardDetailAction.bo?num=" + reviewdata.getBOARD_NUM());

			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
