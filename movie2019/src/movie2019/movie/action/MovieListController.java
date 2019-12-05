package movie2019.movie.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);

		
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);

		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);

		// �ʱ�ȭ
		ActionForward forward = null;
		Action action = null;

		ServletContext sc = this.getServletContext();
		
		if (command.equals("/main.ml")) {

			action = new MainMovieAction();

			try {
				forward = action.execute(request, response,sc);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MovieList.ml")) {
			action = new MovieListAction(); // parameter ����

			try {
				forward = action.execute(request, response, null);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/Search.ml")) {
			action = new SearchMovieAction(); // parameter ����

			try {
				forward = action.execute(request, response,sc);

			} catch (Exception e) {
				e.printStackTrace();
			}

			
		} else if (command.equals("/moviedetail.ml")) {
			action = new SelectRatingAction();
			try {
				forward = action.execute(request, response, null);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/PersonDetail.ml")) {
			forward = new ActionForward();// parameter ����
			forward.setRedirect(false);
			forward.setPath("Page/MovieDetail/PersonDetail.jsp");
		} else if (command.equals("/InsertFaceRating.ml")) {
			action = new InsertFaceRatingAction();// parameter ����

			try {
				forward = action.execute(request, response, null);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/InsertStarRating.ml")) {
			action = new InsertStarRatingAction();// parameter ����

			try {
				forward = action.execute(request, response, null);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/UpdateStarRating.ml")) {
			action = new UpdateStarRatingAction();// parameter ����

			try {
				forward = action.execute(request, response, null);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/UpdateFaceRating.ml")) {
			action = new UpdateFaceRatingAction();// parameter ����

			try {
				forward = action.execute(request, response, null);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/InsertHidden.ml")) {
			action = new InsertHiddenAction();// parameter ����

			try {
				forward = action.execute(request, response, null);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				System.out.println("sendRedirect �̵� :" + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else { // �������˴ϴ�.
				System.out.println("dispather �̵� :" + forward.getPath());
				RequestDispatcher dispather = request.getRequestDispatcher(forward.getPath());
				dispather.forward(request, response);

			}
		}

	}

}
