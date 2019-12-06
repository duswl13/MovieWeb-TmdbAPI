package movie2019.admin.faq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.fa")
public class FAQFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FAQFrontController() {
        super();
    }

	//doProcess(request,response)메서드를 구현하여 요청이 GET방식이든
    //POST방식으로 전송되어 오든 같은 메서드에서 요청을 처리할 수 있도록 하였습니다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();
		System.out.println("RequestURI="+RequestURI);
		
		//getContextPath():컨텍스트 경로가 반환됩니다.
		//contextPath는 "/JspProject"가 반환됩니다.
		String contextPath=request.getContextPath();
		System.out.println("contexPath="+contextPath);
		
		//RequestURI에서 컨텍스트 경로 길이 값의 인덱스 위치의 문자부터 마지막 위치 문자까지 추출합니다.
		String command=RequestURI.substring(contextPath.length());
		System.out.println("command="+command);
		
		//초기화
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/FAQList.fa")) {
			action=new FAQListAction();	//다형성에 의한 업캐스팅
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/FAQWrite.fa")) {
			forward=new ActionForward();
			forward.setRedirect(false);	//포워딩 방식으로 주소가 바뀌지 않아요
			forward.setPath("Page/AdminPage/FAQ/FAQWrite.jsp");
		}else if(command.equals("/FAQAddAction.fa")) {
			action = new FAQAddAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/FAQModifyView.fa")) {
			action = new FAQModifyView();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/FAQModifyAction.fa")) {
			action = new FAQModifyAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardDetailAction.fa")) {
			action = new FAQDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/FAQDetailAction.fa")) {
			action = new FAQDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/FAQDeleteAction.fa")) {
			action = new FAQDeleteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
		
		if(forward!=null) {
			if(forward.isRedirect()) {//리다이렉트 됩니다.
				response.sendRedirect(forward.getPath());
			}else {//포워딩됩니다.
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
