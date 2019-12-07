package movie2019.signup.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.su")
public class FrontController 
           extends javax.servlet.http.HttpServlet {
	
	protected void doProcess(HttpServletRequest request, 
		       HttpServletResponse response) 
		   throws ServletException, IOException {
		
		String RequestURI= request.getRequestURI();
		System.out.println("RequestURI"+ RequestURI);
	
		
		String contextPath=request.getContextPath();
		System.out.println("contextPath="+contextPath);
	
		
		String command=RequestURI.substring(contextPath.length());
	    System.out.println("command="+command);
		
	    //초기화
	    ActionForward forward=null;
	    Action action=null;
	    //회원 가입 페이지
        if(command.equals("/signUp.su")) { //true하면 redirect하는 거고
	    	forward=new ActionForward(); //false하면 dispatcher한다는 뜻
	    	forward.setRedirect(false); //주소 변경 없이 jsp페이지의 내용을 보여준다.
	    	forward.setPath("Page/Sign/SignUp.jsp");

	    //가입가입
	    }else if(command.equals("/signProcess.su")) { 
	          action = new SignProcessAction();
	          try {
	        	  forward=action.execute(request, response);
	          }catch(Exception e) {
	        	  e.printStackTrace();
	          }
	    
	    //아이디 중복 체크
	    }else if(command.equals("/idcheck.su")) { 
	          action = new IdCheckAction();
	          try {
	        	  forward=action.execute(request, response);
	          }catch(Exception e) {
	        	  e.printStackTrace();
	          }
	    }

        
        //여기는 건들지 않는 부분
	    if(forward!=null) {
	    	if(forward.isRedirect()) { //리다이렉트
	    		response.sendRedirect(forward.getPath());
	    	}else { //포워딩
	    		RequestDispatcher dispatcher
	    		= request.getRequestDispatcher(forward.getPath());
	    		dispatcher.forward(request, response);
	    	}
	    }
	}
 
    public FrontController() {
        super();
    }
   
	protected void doGet(HttpServletRequest request, 
			       HttpServletResponse response) 
			   throws ServletException, IOException {
	   doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, 
			       HttpServletResponse response) 
			  throws ServletException, IOException {
		 doProcess(request,response);
	}

}
