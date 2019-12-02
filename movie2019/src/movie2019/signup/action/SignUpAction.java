package movie2019.signup.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.member.db.Member;
import movie2019.member.db.MemberDAO;

public class SignUpAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			   HttpServletResponse response) throws Exception {
	ActionForward forward = new ActionForward();
	request.setCharacterEncoding("utf-8");
	
	String id=request.getParameter("id");
	String pass=request.getParameter("password");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");

	System.out.println("test");
	  Member m = new Member();
	  m.setAge(age);
	  m.setEmail(email);
	  m.setGender(gender);
	  m.setName(name);
	  m.setId(id);
	  m.setPassword(pass);
	  
	  MemberDAO mdao = new MemberDAO();
	  int result = mdao.insert(m);
	  
	  //�궫�엯 �맂 寃쎌?��
	  if(result==1) {
		  forward.setPath("login.net");
		  forward.setRedirect(true);
	  }else if(result==-1){
		  response.setContentType("text/html;charset=euc-kr");
		  PrintWriter out = response.getWriter();
		  out.println("<script>");
		  out.println("alert('중복?�� ?��?��?��?��?��?��.')");
		 //out.println("location.href='./join.net';"); //�깉濡� ?�좎묠�릺��?
		  out.println("history.back()"); //?��꾨�踰덊?�� �젣�쇅�븳 �떎?���? �뜲�씠�꽣�뒗 ��?吏�
		  out.println("</script>");
		  out.close();
		  return null;
	  }
	return forward;
	}

}
