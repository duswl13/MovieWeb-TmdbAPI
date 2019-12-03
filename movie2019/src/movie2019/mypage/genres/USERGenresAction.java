package movie2019.mypage.genres;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.mypage.user.Genres;
import movie2019.mypage.user.GenresDAO;

public class USERGenresAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("테스투투투투투");

		GenresDAO gdao = new GenresDAO();
		List<Genres> genres=new ArrayList<Genres>();
		System.out.println("테스투투투투투");
		String id=request.getParameter("user_id");
		genres=gdao.getGenres(id);
		ActionForward forward = new ActionForward();
		
		if(genres==null) {
			System.out.println("정보가져오기 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "정보가져오기 실패입니다.");
			forward.setPath("error/error.jsp");
			return null;
		}
		System.out.println("장르정보 가져오기 성공");
		
		request.setAttribute("genresinfo",genres);
		forward = new ActionForward();
		forward.setRedirect(false);
		
		//글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
		forward.setPath("Page/MyPage/MyInfo/MyInfo.jsp");
		return forward;
	}


}
