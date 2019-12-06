package movie2019.admin.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class NoticeFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();
		System.out.println("RequestURI="+RequestURI);

		String contextPath=request.getContextPath();
		System.out.println("contexPath="+contextPath);
		
		String command=RequestURI.substring(contextPath.length());
		System.out.println("command="+command);
		
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/NoticeList.bo")) {
			action=new NoticeListAction();	
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/NoticeWrite.bo")) {
			forward=new ActionForward();
			forward.setRedirect(false);	
			forward.setPath("Page/AdminPage/Notice/NoticeWrite.jsp");
		}else if(command.equals("/NoticeAddAction.bo")) {
			action = new NoticeAddAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/NoticeModifyView.bo")) {
			action = new NoticeModifyView();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/NoticeModifyAction.bo")) {
			action = new NoticeModifyAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardDetailAction.bo")) {
			action = new NoticeDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/NoticeDetailAction.bo")) {
			action = new NoticeDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/NoticeDeleteAction.bo")) {
			action = new NoticeDeleteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
