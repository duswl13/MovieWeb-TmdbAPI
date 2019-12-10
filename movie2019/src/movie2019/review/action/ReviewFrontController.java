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
			
		//내리뷰모아보기
		} else if (command.equals("/ReviewPrivateList.rv")) {
			action = new ReviewPrivateListAction(); // 다형성에 의한 업캐스팅
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		//모달 뜨게 하는 부분
		} else if (command.equals("/Reviewdetail.rv")) {
			System.out.println("모달 뜨는 버튼 클릭");
			action = new ReviewDetail();
			try {
				forward = action.execute(request, response);
				forward.setRedirect(false); // 포워딩 방식으로 주소가 바뀌지 않음.
				forward.setPath("Page/Review/review_detail.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}

		//리뷰수정
		} else if (command.equals("/PriReviewModify.rv")) {
			action = new PriReviewModify(); // 다형성에 의한 업캐스팅
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		//리뷰삭제
		} else if (command.equals("/PriReviewDelete.rv")) {
			action = new PriReviewDelete(); // 다형성에 의한 업캐스팅
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		//이용자별 리뷰리스트
		} else if (command.equals("/ReviewUserList.rv")) {
			action = new ReviewUserAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		//영화상세보기에서리뷰더보기클릭
		} else if (command.equals("/ReviewMovieList.rv")) {
			action = new ReviewMovieAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		//리뷰쓰기
		} else if (command.equals("/ReviewAddAction.rv")) {
			action = new ReviewAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		//영화상세보기에서리뷰수정
		} else if (command.equals("/ReviewModifyAction.rv")) {
			action = new ReviewModifyAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		
		//? 뭐지
		} else if (command.equals("/ReviewMovieAction.rv")) {
			action = new ReviewMovieAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//좋아요
		} else if (command.equals("/LikeAction.rv")) {
			action = new LikeAction();
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
