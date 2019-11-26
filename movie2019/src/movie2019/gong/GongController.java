package movie2019.gong;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.chu.command.BCommand;
import movie2019.gong.command.GCommand;
import movie2019.gong.command.GListCommand;

@WebServlet("*.gong")
public class GongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GongController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = null;
		GCommand command = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		if (com.equals("/list.gong")) {
			page = "Page/gong/list2.jsp";
		}else if(com.equals("/gonglist.gong")) {			
			command = new GListCommand();
			command.execute(request, response);
			page="Page/gong/gonglist.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);

	}
}
