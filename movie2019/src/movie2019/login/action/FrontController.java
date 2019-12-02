package movie2019.login.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.lg")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doProcess(request, response) 메소드를 구현해
	// 들어온 요청이 get/post 모두 같은 메소드에서 처리할 수 있게 했다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	// doProcess
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * 요청된 전체 url 중에서 포트 번호 다음부터 마지막 문자열까지 반환.
		 * 
		 * ex) http://localhost:8088/JspProject/login.net 인 경우 "/JspProject/login.net"
		 * 부분만 반환.
		 */

		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);

		// getContextPath() : 컨텍스트 경로 반환
		// ContextPath는 "JspProject" 반환.
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);

		// RequestURI에서 컨텍스트 경로 길이값의 인덱스 문자부터 마지막 문자까지 추출.
		// command는 "/login.net" 반환.
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);

		// 초기화
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/login.lg")) {
			forward = new ActionForward();
			forward.setRedirect(false); // 주소 변경 없이 jsp페이지의 내용을 보여준다.
			forward.setPath("login/login.jsp");


		} else if (command.equals("/idcheck.lg")) {
			action = new IdCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}


		} else if (command.equals("/loginProcess.lg")) {
			action = new LoginProcessAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}



		} else if (command.equals("/logout.lg")) {
			action = new LogoutAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}		
			
		}
		
		

		if (forward != null) {
			if (forward.isRedirect()) { // 리다이렉트 됨
				response.sendRedirect(forward.getPath());
			} else { // 포워딩 됨
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
