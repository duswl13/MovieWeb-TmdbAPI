package movie2019.chu.command;

import java.awt.print.Pageable;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
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
import movie2019.mypage.genres.GenresDAO;

public class Ch_Main implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		GenDAO dao = new GenDAO();
		String matching = null;
		if (id == null) {
			out.println("<script>");			
			out.println("location.href='Page/Login/login.jsp';");
			out.println("</script>");
			out.close();
		}

		if (id != null) {
			try {
				List<GenresVO> gen = dao.GenChu(id);
				MovieDAO mdao = new MovieDAO();
				String p = "1";
				MoviePageVO result = mdao.getChu(gen, p);
				matching = dao.matching(id);
				List<Rating_faceVO> matchings = dao.matchings(matching);
				List<MovieInfoVO> re_match = mdao.getinfo(matchings);
				
				
				List<GenresVO> aChu = dao.getAdmin(id);
		
				MoviePageVO aChu_result = mdao.getChu(aChu, p);
				
				
				
				request.setAttribute("aChu", aChu_result.getResults());
				request.setAttribute("matching", re_match);
				request.setAttribute("gen", result.getResults());
				request.setAttribute("image", "https://image.tmdb.org/t/p/w300/");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("건수오류");
			}

		}
	}

}
