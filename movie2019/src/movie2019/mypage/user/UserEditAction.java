package movie2019.mypage.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.admin.user.UserDAO;
import movie2019.admin.user.Users;
import movie2019.mypage.genres.Genres;
import movie2019.mypage.genres.GenresDAO;

public class UserEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("INFO_ID");
		String pass=request.getParameter("INFO_PASS");
		String pass_check=request.getParameter("INFO_PASS_CHECK");
		String email=request.getParameter("INFO_EMAIL");
		String phone=request.getParameter("INFO_PHONE");
		String[] genres=request.getParameterValues("INFO_GENRES");
		String poster=request.getParameter("HIDDEN_POSTER");
		
		if(!pass.equals(pass_check)) {
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		}
		try {
		System.out.println("test>>>"+genres.length);
		if (genres.length < 3||genres.length==0||genres==null) {
			out.println("alert('장르를 3개 이상 선택하세요');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		}
		}catch(Exception e) {
			if(genres==null) {
				out.println("alert('장르를 3개 이상 선택하세요');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
			}
		}
		Users user=new Users();
		user.setUSER_ID(id);
		user.setUSER_PASS(pass);
		user.setUSER_EMAIL(email);
		user.setUSER_PHONE(phone);
		GenresDAO gdao = new GenresDAO();
		gdao.update_genres(genres, id);

		
		UserDAO udao= new UserDAO();		
		int result =udao.user_update(user);
		
		if(poster!="") {
			PosterDAO pdao = new PosterDAO();
			int result2=pdao.update_poster(poster, id);
		}
		
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
