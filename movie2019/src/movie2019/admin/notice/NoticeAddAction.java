package movie2019.admin.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NoticeAddAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, 
      HttpServletResponse response) throws Exception {
	  request.setCharacterEncoding("UTF-8");
  
      NoticeDAO noticedao = new NoticeDAO();
      NoticeVO noticevo = new NoticeVO();
      ActionForward forward = new ActionForward();
    
       boolean result = false;
       
       try {
         
          //NOTICEBean 객체에 글 등록 폼에서 입력 받은 정보들을 저장한다.
    	   noticevo.setNOTICE_NAME(
                request.getParameter("NOTICE_NAME"));
    	   noticevo.setNOTICE_SUBJECT(
                replaceParameter(request.getParameter("NOTICE_SUBJECT")));
    	   System.out.println(request.getParameter("NOTICE_NAME"));
    	   System.out.println(request.getParameter("NOTICE_SUBJECT"));
    	   noticevo.setNOTICE_CONTENT(
                replaceParameter(request.getParameter("NOTICE_CONTENT")));
          
          
          //글 등록 폼에서 입력한 정보가 저장되어 있는 NOTICEdata 객체를 전달한다.
          result = noticedao.NoticeInsert(noticevo);
          
          //글 등록에 실패할 경우 false를 반환한다.
          if(result==false) {
             System.out.println("게시판 등록 실패");
             forward.setRedirect(false);
               request.setAttribute("message", "게시판 등록 실패입니다.");
               forward.setPath("error/error.jsp");
             return forward;
          }
          System.out.println("게시판 등록 완료");
          //글 등록이 완료되면 글 목록을 단순히 보여주기만 할 것이므로
          //Redirect여부를 true로 설정한다.
          forward.setRedirect(true);
          //이동할 경로를 지정한다.
          forward.setPath("NoticeList.bo");
          return forward;
       }catch(Exception ex) {
          ex.printStackTrace();
       }
       return null;
         
   }
   
   private String replaceParameter(String param) {
      String result = param;
      if(param!=null) {
         result = result.replaceAll("<","&lt;");
         result = result.replaceAll(">","&gt;");
         result = result.replaceAll("\"", "&quot;");
      }
      return result; 
   }

}