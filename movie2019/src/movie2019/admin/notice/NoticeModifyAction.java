package movie2019.admin.notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NoticeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//파라미터로 가져올 떄 한글이 꺠지지 않도록 하기 위한 문장입니다.
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		Boolean result = false;

		//전달받은 파라미터 num 변수에 저장합니다.
		int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();

		//글쓴이 인지 확인하기 위해 저장된 비밀번호와 입력한 비밀번호를 비교합니다.
		boolean usercheck=boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
		//비밀번호가 다른 경우
		if(usercheck==false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		//비밀번호가 일치하는 경우 수정 내용을 설정합니다.
		boarddata.setBOARD_NUM(num);
		boarddata.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		boarddata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		
		//DAO에서 수정 메서드 호출하여 수정합니다.
		result = boarddao.boardModify(boarddata);
		//수정에 실패한 경우
		if(result==false) {
			System.out.println("게시판 수정 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "게시판 수정 작성 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		//수정 성공의 경우
		System.out.println("게시판 수정 완료");
		
		forward.setRedirect(true);
		//수정한 글 내용을 확인하기 위해 글 내용 보기 페이지를 경로로 설정합니다.
		forward.setPath("BoardDetailAction.bo?num="+boarddata.getBOARD_NUM());
		
		return forward;
	}
}
