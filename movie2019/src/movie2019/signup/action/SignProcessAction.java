package movie2019.signup.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		//�ѱ۱��� ����
		request.setCharacterEncoding("utf-8");
		
		String USER_ID = request.getParameter("USER_ID");
		String USER_PASS = request.getParameter("USER_PASS");
		String USER_EMAIL = request.getParameter("USER_EMAIL");
		String USER_PHONE = request.getParameter("USER_PHONE");
		
		
		Member m = new Member();

		m.setUSER_ID(USER_ID);
		m.setUSER_PASS(USER_PASS);
		m.setUSER_EMAIL(USER_EMAIL);
		m.setUSER_PHONE(USER_PHONE);
		
		
		MemberDAO mdao = new MemberDAO();
		int result = mdao.insert(m);
		
		//���� �� ���
		if(result==1) { 
			//선택한 장르를 배열로
			String[] genres = request.getParameterValues("genre");
			
						
			mdao.choice(genres, USER_ID);
			
			
			forward.setRedirect(true);
			forward.setPath("Page/Login/login.jsp");
			
			
		}else if(result==-1) { //���Ե� ���̵�
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('�̹� ���Ե� ȸ���Դϴ�.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		return forward;
	}

}
