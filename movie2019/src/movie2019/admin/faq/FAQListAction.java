package movie2019.admin.faq;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FAQListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		FAQDAO faqdao=new FAQDAO();
		List<FAQVO> faqlist=new ArrayList<FAQVO>();
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지 = "+page);
		
		//총 리스트 수를 받아옵니다.
		int listcount=faqdao.getListCount();
		System.out.println("리스트 수"+listcount);
		
		//리스트를 받아옵니다.
		faqlist = faqdao.getFAQList(page,limit);
		
		/*
		총 페이지 수 = 
		(DB에 저장된 총 리스트의 수 + 한 페이지에서 보여주는 리스트의 수 -1)/한 페이지에서 보여주는 리스트의 수
		
		 * 예를 들어 한 페이지에서 보여주는 리스트의 수가 10개인 경우
		예1) DB에 저장된 총 리스트의 수가 0이면 총 페이지수는 0 페이지
		예2) DB에 저장된 총 리스트의 수가 (1~10)이면 총 페이지수는 1 페이지
		예3) DB에 저장된 총 리스트의 수가 (11~20)이면 총 페이지수는 2 페이지
		예4) DB에 저장된 총 리스트의 수가 (21~30)이면 총 페이지수는 4 페이지
		 */
		
		int maxpage = (listcount+limit-1)/limit;
		System.out.println("총 페이지수="+maxpage);
		
		/*
		startpage:현재 페이지 그룹에서 맨 처음에 표시될 페이지 수를 의미합니다.
				([1],[11],[21] 등...)
		보여줄 페이지가 30개일 경우 [1][2][3]...[30]까지 다 표시하기에는 너무 많기 때문에 보통 한 페이지에는
		10 페에지 정도까지 이동할 수 있게 표시합니다.
		예) 페이지 그룹이 아래와 같은 경우
			[1][2][3][4][5][6][7][8][9][10]
			페이지그룹의 시작 페이지는 startpage에 마지막 페이지는 endpage에 구합니다.
			
			예로 1~10 페이지의 내용을 나타낼때는 페이지 그룹은
			[1][2][3]..[10]로 표시되고
			11~20페이지의 내용을 나타낼때는 페이지 그룹은
			[11][12][13]..[20]까지 표시됩니다.
		 */
		int startpage=((page-1)/10)*10+1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 ="+startpage);
		
		//endpage:현재 페이지 그룹에서 보여줄 마지막 페이지 수([10],[20],[30] 등..)
		int endpage=startpage+10-1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수"+endpage);
		
		/*
		 * 마지막 그룹의 마지막 페이지 값은 최대 페이지 값입니다.
		 * 예로 마지막 페이지 그룹이 [21]~[30]인 경우
		 * 시작페이지(startpage=21)와 마지막페이지(endpage=30)
		 * 이지만 최대 페이지(maxpage)가 25라면 [21]~[25]까지만 표시되도록 합니다.
		 */
		if(endpage>maxpage) endpage=maxpage;
		request.setAttribute("page", page);//현재 페이지 수
		request.setAttribute("maxpage", maxpage);//최대 페이지 수
		
		//현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("startpage", startpage);

		//현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
	
		//해당 페이지의 글 목록을 갖고 있는 리스트
		request.setAttribute("faqlist", faqlist);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		
		//글 목록 페이지로 이동하기 위해 경로를 설정합니다.
		forward.setPath("Page/AdminPage/FAQ/FAQList.jsp");
		
		return forward;	//FAQFrontController.java로 리턴됩니다.
	}

}
