package movie2019.mypage.genres;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import movie2019.mypage.user.Action;
import movie2019.mypage.user.ActionForward;

public class USERGenresAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		GenresDAO gdao = new GenresDAO();
		String USER_ID=request.getParameter("USER_ID");
		JsonArray json=gdao.getGenres(USER_ID);
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("cache-control","no-cache,no-store");
		PrintWriter out=response.getWriter();
		out.print(json);
		System.out.println(json);
		return null;
	}
}
