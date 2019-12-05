package movie2019.movie.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.movie.singleton.hiddenSingleton;

public class SearchMovieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc) throws Exception {
		
		
		//hidden ΩÃ±€≈Ê
		hiddenSingleton hidden = hiddenSingleton.getInstance();
		
	
		
		ActionForward forward = new ActionForward();
		request.setAttribute("hidden", hidden.getHiddenList());
		

		forward.setRedirect(false);
		forward.setPath("Page/Search/Search.jsp");
		return forward;
	}

}
