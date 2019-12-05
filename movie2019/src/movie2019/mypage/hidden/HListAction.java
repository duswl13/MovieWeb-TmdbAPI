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
		// 총 리스트 수를 받아옵니다.
		int listcount = hdao.getListCount(id);
		System.out.println("리스트 수" + listcount);

		// 리스트를 받아옵니다.
		list = hdao.getList(id);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		request.setAttribute("listcount", listcount);
		// 글 목록 페이지로 이동하기 위해 경로를 설정합니다.
		forward.setPath("Page/MyPage/Hidden/Hidden.jsp");
		request.setAttribute("totallist", list);
		return forward; // BoardFrontController.java로 리턴됩니다.
	}

}