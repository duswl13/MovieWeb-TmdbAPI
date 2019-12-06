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
import movie2019.chu.parse.MovieDAO;
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
		if (id == null) {
			out.println("<script>");
			out.println("alert('로그인해주세요');");
			out.println("location.href='Page/Login/login.jsp';");
			out.println("</script>");
			out.close();		
		}

		if(id != null) {
		try{
			List<GenresVO> gen = dao.GenChu(id);
		
		MovieDAO mdao = new MovieDAO();
		MoviePageVO result = mdao.getChu(gen);
		request.setAttribute("id", id);
		request.setAttribute("gen", result.getResults());
		request.setAttribute("image", "https://image.tmdb.org/t/p/w300/");
		}catch (Exception e) {
			
		}
		

	}
	}

}
