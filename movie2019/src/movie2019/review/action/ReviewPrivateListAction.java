package movie2019.review.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewPrivateListAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReviewDAO reviewdao = new ReviewDAO();
		List<ReviewVO> reviewlist = new ArrayList<ReviewVO>();

		int page = 1;
		int limit = 5;

		HttpSession session = request.getSession();
		String userId = null;

		if (session.getAttribute("id") != null)
			userId = (String) session.getAttribute("id");

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지 = " + page);

		if (request.getParameter("limit") != null) { // 요 부분 추가
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		System.out.println("넘어온 limit = " + limit);

		// 총 listcount 받아오기.
		int listcount = reviewdao.getPrivateListCount(userId);
		System.out.println("listcount : " + listcount);
		// 리스트 받아오기
		reviewlist = reviewdao.getreviewPrivateList(userId, page, limit);

		for (ReviewVO i : reviewlist)
			System.out.print("등록된 리뷰 :" + i.getREVIEW_TITLE());
		/*
		 * 총 페이지 수 = (DB에 저장된 총 리스트 + 한 페이지에서 보여주는 리스트 - 1) / 한 페이지에서 보여주는 리스트
		 * 
		 * 예를 들어 한 페이지에서 보여주는 리스트의 수가 10개인 경우 DB에 저장된 총 리스트의 수가 0이면 총 페이지 수는 0페이지 DB에
		 * 저장된 총 리스트의 수가 (1~10)이면 총 페이지 수는 1페이지 DB에 저장된 총 리스트의 수가 (11~20)이면 총 페이지 수는
		 * 2페이지 DB에 저장된 총 리스트의 수가 (21~30)이면 총 페이지 수는 3페이지
		 * 
		 */

		int maxpage = (listcount + limit - 1) / limit;
		System.out.println("총 페이지 수 = " + maxpage);

		/*
		 * startpage : 현재 페이지 그룹에서 맨 처음에 표시될 페이지 수 ([1], [11], [21] 등...)
		 * 
		 * 보여줄 페이지가 30개일 경우 [1][2][3]...[30]까지 다 표시하기엔 너무 많으니까 보통 한 페이지에 10페이지 정도만 표시한다.
		 * 
		 * 예를 들어 페이지 그룹이 아래와 같은 경우, [1][2][3][4][5][6][7][8][9][10] 페이지 그룹의 시작 페이지는
		 * startpage에, 마지막 페이지는 endpage에 구함.
		 * 
		 * 예로 1~10페이지의 내용을 나타낼 때 페이지 그룹은 [1][2][3]...[10]로 표시, 11~10페이지의 내용을 나타낼 떄 페이지
		 * 그룹은 [11][12][13]...[20]까지 표시된다.
		 */

		int startpage = ((page - 1) / 5) * 5 + 1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 = " + startpage);

		int endpage = startpage + 5 - 1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 = " + endpage);

		/*
		 * 마지막 그룹의 마지박 페이지 값은 최대 페이지 값. 마지막 페이지 그룹이 [21]~[30]인 경우 시작페이지 (startpage=21)와
		 * 마지막페이지(endpage=30)이지만 최대페이지(maxpage=25)가 25라면 [21]~[25]까지만 표시되게 한다.
		 */

		if (endpage > maxpage)
			endpage = maxpage;

		String state = request.getParameter("state");

		if (state == null) { // 이 부분 추가
			System.out.println("state=null");
			request.setAttribute("page", page); // 현재 페이지 수
			request.setAttribute("maxpage", maxpage); // 최대 페이지 수
			request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지
			request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지
			request.setAttribute("listcount", listcount); // 총 글의 수
			request.setAttribute("reviewlist", reviewlist); // 해당 페이지의 글 목록을 갖고 있는 리스트

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Page/Review/review_list_private.jsp");
			return forward; // reviewFrontController.java로 리턴.

		} else { // 이 부분 추가

			System.out.println("state=ajax");
			JSONObject object = new JSONObject();
			object.put("page", page);
			object.put("maxpage", maxpage);
			object.put("startpage", startpage);
			object.put("endpage", endpage);
			object.put("listcount", listcount);
			object.put("limit", limit);
			// List => JsonArray
			JsonArray je = new Gson().toJsonTree(reviewlist).getAsJsonArray();

			// List => JsonElement

			System.out.println("je = " + je);
			object.put("reviewlist", je);

			// jObject.put("results", jArray);
			Gson gson = new Gson();
			String json = gson.toJson(object);
			response.getWriter().append(json);
			System.out.println("json : " + json);

			return null;

		}
	}

}
