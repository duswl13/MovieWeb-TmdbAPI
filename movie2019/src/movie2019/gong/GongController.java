package movie2019.gong;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.chu.command.BCommand;
import movie2019.gong.command.FListCommand;
import movie2019.gong.command.FSListCommand;
import movie2019.gong.command.GCommand;
import movie2019.gong.command.GListCommand;
import movie2019.gong.command.MailCommand;
import movie2019.gong.command.SListCommand;

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
			page="Page/gong/list.jsp";
		}else if(com.equals("/faq.gong")) {
			command = new FListCommand();
			command.execute(request, response);			
			page="Page/gong/faqlist.jsp";
		}else if(com.equals("/gongSearch.gong")) {	
			if(request.getParameter("check").equals("notice_tbl")) {
			command = new SListCommand();
			command.execute(request, response);	
			page="Page/gong/searchlist.jsp";
			}else if(request.getParameter("check").equals("faq_tbl")) {				
				command = new FSListCommand();
				command.execute(request, response);	
				page="Page/gong/searchFList.jsp";
			}else {
				page = "Page/gong/list2.jsp";
			}
			
		}else if(com.equals("/mail.gong")) {					
			page="Page/gong/mail.jsp";			
		}else if(com.equals("/mailsend.gong")) {
			command = new MailCommand();
			command.execute(request, response);
			page="list.gong";
			
		}
		
		
		
		request.getRequestDispatcher(page).forward(request, response);

	}
}
