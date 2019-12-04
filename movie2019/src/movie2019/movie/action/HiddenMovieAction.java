package movie2019.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.movie.singleton.hiddenSingleton;

public class HiddenMovieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//hidden 싱글톤
		hiddenSingleton hidden = hiddenSingleton.getInstance();
		
		MovieDAO movieDAO = new MovieDAO();
		
		//추후 세션으로 아이디 변경, 숨김 목록 가져오기
		hidden.addHiddenList(movieDAO.getHiddenList("duswl13"));
		System.out.println("hiddenMovieSize = "+ hidden.getHiddenList().size());
		
		
		
		ActionForward forward = new ActionForward();
		request.setAttribute("hidden", hidden.getHiddenList());
		
		forward.setRedirect(false);
		forward.setPath("Page/MainPage/MainPage.jsp");
		
		return forward;
	}

}
