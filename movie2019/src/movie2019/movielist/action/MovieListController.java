package movie2019.movielist.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MovieListController
 */
@WebServlet("*.ml")
public class MovieListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MovieListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);

		// getContextPath() : 컨텍스트 경로가 반환됩니다.
		// contextPath는 "/JspProject" 가 반환합니다.
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);

		// RequestURI에서 컨텍스트 경로 길이 값의 인덱스 위치의 문자부터
		// 마지막 위치 문자까지 추출합니다.
		// command는 'login.net'을 반환합니다.

		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);

		// 초기화
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/main.ml")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Page/Main/Main.jsp");
		} else if (command.equals("/MainPage.ml")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Page/MainPage/MainPage.jsp");
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				System.out.println("sendRedirect 이동 :" + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else { // 포워딩됩니다.
				System.out.println("dispather 이동 :" + forward.getPath());
				RequestDispatcher dispather = request.getRequestDispatcher(forward.getPath());
				dispather.forward(request, response);

			}
		}

	}

}
