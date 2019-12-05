package movie2019.movie.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response,ServletContext sc) throws Exception;
}
