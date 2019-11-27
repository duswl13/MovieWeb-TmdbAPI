package movie2019.admin.notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NoticeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//�Ķ���ͷ� ������ �� �ѱ��� ������ �ʵ��� �ϱ� ���� �����Դϴ�.
		request.setCharacterEncoding("euc-kr");
		ActionForward forward = new ActionForward();
		Boolean result = false;

		//���޹��� �Ķ���� num ������ �����մϴ�.
		int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();

		//�۾��� ���� Ȯ���ϱ� ���� ����� ��й�ȣ�� �Է��� ��й�ȣ�� ���մϴ�.
		boolean usercheck=boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
		//��й�ȣ�� �ٸ� ���
		if(usercheck==false) {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� �ٸ��ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		//��й�ȣ�� ��ġ�ϴ� ��� ���� ������ �����մϴ�.
		boarddata.setBOARD_NUM(num);
		boarddata.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		boarddata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		
		//DAO���� ���� �޼��� ȣ���Ͽ� �����մϴ�.
		result = boarddao.boardModify(boarddata);
		//������ ������ ���
		if(result==false) {
			System.out.println("�Խ��� ���� ����");
			forward.setRedirect(false);
			request.setAttribute("message", "�Խ��� ���� �ۼ� �����Դϴ�.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		//���� ������ ���
		System.out.println("�Խ��� ���� �Ϸ�");
		
		forward.setRedirect(true);
		//������ �� ������ Ȯ���ϱ� ���� �� ���� ���� �������� ��η� �����մϴ�.
		forward.setPath("BoardDetailAction.bo?num="+boarddata.getBOARD_NUM());
		
		return forward;
	}
}