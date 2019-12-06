package movie2019.mypage.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReviewDAO hdao = new ReviewDAO();
		List<Review> list = new ArrayList<Review>();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int listcount = hdao.getListCount(id);
		System.out.println("리스트 수" + listcount);

		list = hdao.getList(id);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		request.setAttribute("listcount", listcount);
		forward.setPath("Page/MyPage/MyReview/MyReview.jsp");
		request.setAttribute("totallist", list);
		return forward; 
	}

}