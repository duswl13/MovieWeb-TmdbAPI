package movie2019.login.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/Login/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8"); // 추가해야 한글 출력 가능

		PrintWriter out = response.getWriter();

		// 파라미터 id, passwd 값 가져오기.
		String inputid = request.getParameter("id");
		String inputpw = request.getParameter("password");

		String id = getServletContext().getInitParameter("id");
		String pw = getServletContext().getInitParameter("password");  
													//이름을 xml이랑 똑같이 써야한다.

		if (id.equals(inputid) && pw.equals(inputpw)) {

			HttpSession session = request.getSession(); // 세션 생성 //중요***
			session.setAttribute("id", id); // 세션 객체에 id라는 속성으로 id값 저장

			out.println("<script>");
			out.println("alert('" + id + "님 보슈~')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		} else if (id.equals(inputid)) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("history.back()"); // 바로 전 페이지로 이동
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('아이디가 일치하지 않습니다.')");
			out.println("history.back()"); // 바로 전 페이지로 이동
			out.println("</script>");
			out.close();
		}
	}
}
