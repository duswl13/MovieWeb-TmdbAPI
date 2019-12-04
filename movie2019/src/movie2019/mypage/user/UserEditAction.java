package movie2019.mypage.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.admin.user.UserDAO;
import movie2019.admin.user.Users;
import movie2019.mypage.genres.Genres;

public class UserEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("INFO_ID");
		String pass=request.getParameter("INFO_PASS");
		String email=request.getParameter("INFO_EMAIL");
		String phone=request.getParameter("INFO_PHONE");
		String genres=request.getParameter("INFO_GENRES");
		System.out.println("수정테스트>>>"+genres);
		Users user=new Users();
		user.setUSER_ID(id);
		user.setUSER_PASS(pass);
		user.setUSER_EMAIL(email);
		user.setUSER_PHONE(phone);
		Genres genre = new Genres();
		genre.setGENRES_ID(genres);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out=response.getWriter();
		
		UserDAO udao= new UserDAO();
		
		int result =udao.user_update(user);
		out.println("<script>");
		//삽입이 된 경우 
		if(result==1) {
			out.println("alert('회원정보가 수정되었습니다.');");
			out.println("location.href='user_info.mu';");
		}else{
			out.println("alert('회원 정보 수정에 실패했습니다.');");
			out.println("history.back()");//비밀번호를 제외한 다른 데이터는 유지되어 있습니다.	
		}
		out.println("</script>");
		out.close();
		return null;
	}

}
