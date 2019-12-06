package movie2019.mypage.hidden;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HiddenDAO hdao = new HiddenDAO();
		List<Hidden> list = new ArrayList<Hidden>();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		int listcount = hdao.getListCount(id);
		System.out.println("리스트 수" + listcount);

		list = hdao.getList(id);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		request.setAttribute("listcount", listcount);
		forward.setPath("Page/MyPage/Hidden/Hidden.jsp");
		request.setAttribute("totallist", list);
		return forward; 
	}

}