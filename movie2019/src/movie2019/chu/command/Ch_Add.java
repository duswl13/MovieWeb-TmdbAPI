package movie2019.chu.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.chu.model.GenDAO;
import movie2019.chu.model.GenresVO;
import movie2019.chu.model.Rating_faceVO;
import movie2019.chu.parse.MovieDAO;
import movie2019.chu.parse.MovieInfoVO;
import movie2019.chu.parse.MoviePageVO;

public class Ch_Add implements Command{
 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		GenDAO dao = new GenDAO();
		List<GenresVO> gen = dao.GenChu(id);
		MovieDAO mdao = new MovieDAO();
		String p = request.getParameter("p");
		MoviePageVO result = mdao.getChu(gen, p);
		request.setAttribute("gen", result.getResults());
		request.setAttribute("image", "https://image.tmdb.org/t/p/w300/");
		
		
		
	}
	
	
	

}
