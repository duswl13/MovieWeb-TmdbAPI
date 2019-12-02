package movie2019.admin.notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		boolean result=false;
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO boarddao=new NoticeDAO();
		
		result=boarddao.noticeDelete(num);
		
		ActionForward forward=new ActionForward();
		//삭제 처리 실패한 경우
		if(result==false) {
			System.out.println("게시판 삭제 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "게시판 삭제 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		//삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
		System.out.println("게시판 삭제 성공");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되엇습니다..');");
		out.println("location.href='NoticeList.bo';");
		out.println("</script>");		
		out.close();
		return null;
	}

}
