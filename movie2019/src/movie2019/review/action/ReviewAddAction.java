package movie2019.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.review.action.ActionForward;
import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewAddAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
         throws Exception {
      request.setCharacterEncoding("UTF-8");

      ReviewDAO reviewdao = new ReviewDAO();
      ReviewVO reviewvo = new ReviewVO();
      ActionForward forward = new ActionForward();

      HttpSession session = request.getSession();
      String userId = null;

      if (session.getAttribute("id") != null)
         userId = (String) session.getAttribute("id");

      
      String rvTitle = request.getParameter("rvtitle");
      String rvContent = request.getParameter("rvcontent");
      int movieid = Integer.parseInt(request.getParameter("movieid"));

      
      System.out.println("rvTitle : "+rvTitle);
      System.out.println("rvContent : "+rvContent);
      System.out.println("movieid : "+movieid);
      
      if (userId != null) {
         boolean result = false;
         try {
            
            // 글 등록 폼에서 입력받은 정보들을 reviewvo객체에 저장.
            reviewvo.setUSER_ID(userId);
             reviewvo.setMOVIE_ID(movieid);
            reviewvo.setREVIEW_TITLE(rvTitle);
            reviewvo.setREVIEW_CONTENT(rvContent);

            // 글 등록 처리를 위해 DAO의 reviewInsert()메소드를 호출한다.
            // 글 등록 폼에서 입력한 정보가 저장돼 있는 reviewvo객체를 전달.
            result = reviewdao.reviewInsert(reviewvo);

            // 글 등록에 실패한 경우 null을 반환.
            if (result == false) {
               System.out.println("리뷰 등록 실패");
               forward.setRedirect(false);
               request.setAttribute("message", "리뷰 등록 실패다.");
               forward.setPath("error/error.jsp");
               return forward;
            }
            System.out.println("게시판 등록 완료.");
            // 글 등록 완료되면 글 목록을 보여주기 위해 Redirect여부를 true로 설정
            forward.setRedirect(true);
            forward.setPath("ReviewList.rv");
            return forward;

         } catch (Exception ex) {
            ex.printStackTrace();
         }
         return null;

      }
      return forward;
   }
   private String replaceParameter(String param) {
      String result = param;
      if (param != null) {
         result = result.replaceAll("<", "&lt;");
         result = result.replaceAll(">", "&gt;");
         result = result.replaceAll("\"", "&quot;");
      }
      return result;
   }
}