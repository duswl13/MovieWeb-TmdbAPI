package movie2019.review.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.rv")
public class ReviewFrontController extends HttpServlet {
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

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

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

		
		
		if (command.equals("/ReviewList.rv")) {
			action = new ReviewListAction(); // 다형성에 의한 업캐스팅
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
		}else if (command.equals("/ReviewPrivateList.rv")) {
			action = new ReviewPrivateListAction(); // 다형성에 의한 업캐스팅
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
		}  else if (command.equals("/ReviewUserList.rv")) {
			action = new ReviewUserAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

			
		} else if (command.equals("/ReviewMovieList.rv")) {
			action = new ReviewMovieAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/ReviewWrite.rv")) {
			forward = new ActionForward();
			forward.setRedirect(false); // 포워딩 방식으로 주소가 바뀌지 않음.
			forward.setPath("review/review_write.jsp");

			
			
		} else if (command.equals("/ReviewAddAction.rv")) {
			action = new ReviewAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			
		} else if (command.equals("/ReviewDelete.rv")) {
			forward = new ActionForward();
			forward.setRedirect(false); // 포워딩 방식으로 주소가 바뀌지 않음.
			forward.setPath("review/review_delete.jsp");

			
			
		} else if (command.equals("/ReviewDeleteAction.rv")) {
			action = new ReviewDeleteAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

			
			
		} else if (command.equals("/ReviewModifyAction.rv")) {
			action = new ReviewModifyAction();
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
