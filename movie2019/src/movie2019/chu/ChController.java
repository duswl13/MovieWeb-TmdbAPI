package movie2019.chu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.chu.command.Ch_Add;
import movie2019.chu.command.Ch_Main;
import movie2019.chu.command.Command;

@WebServlet("*.ch")
public class ChController extends HttpServlet {
	private static final long serialVersionUID = 1L;


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
		Command command = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		if (com.equals("/list.ch")) {
			command = new Ch_Main();
			command.execute(request, response);
			page = "Page/Chu/list.jsp";
		}else if(com.equals("/listAdd.ch")) {
			System.out.println("들어옴에이젝스");
			command = new Ch_Add();
			command.execute(request, response);
			page = "Page/Chu/addList.jsp";
		}
		
		try {
		if(page!=null) {
		request.getRequestDispatcher(page).forward(request, response);}
		}catch (Exception e) {
			
		}
	}
}
