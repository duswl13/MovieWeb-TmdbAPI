package movie2019.board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 ActionForward forward = new ActionForward();
	      BoardDAO boarddao = new BoardDAO();
	      BoardVO boarddata = new BoardVO();
	      
	      String realFolder="";
			
			//WebContent아래에 폴더 생성
			String saveFolder="boardupload";
			
			int fileSize=10*1024*1024; //업로드할 파일의 최대 사이즈. 10MB
			
			//실제 저장 경로를 지정한다.
		    ServletContext sc = request.getServletContext();
		    realFolder = sc.getRealPath(saveFolder);
		    
		    System.out.println("realFolder= "+realFolder);
		    boolean result = false;
		    
		    try {
		    	MultipartRequest multi = 
		    			new MultipartRequest(request,
		    			          realFolder, fileSize,
		    			          "utf-8", new DefaultFileRenamePolicy());
	      
	      //전달받은 파라미터 num 변수에 저장한다.
	      int num = Integer.parseInt(multi.getParameter("BOARD_NUM"));
	      String pass = multi.getParameter("BOARD_PASS");
	      //글쓴이인지 확인하기 위해 저장된 비밀번호와 입력한 비밀번호를 비교한다.
	      boolean usercheck = 
	    		  boarddao.isBoardWriter(num,pass);
	      
	      System.out.println("비밀번호체크"+usercheck);
	      //비밀번호가 다른 경우
	      if(usercheck==false) {
	    	  response.setContentType("text/html;charset=utf-8");
	    	  PrintWriter out = response.getWriter();
	    	  out.println("<script>");
	    	  out.println("alert('비밀번호가 다릅니다.');");
	    	  out.println("history.back();");
	    	  out.println("</script>");
	    	  out.close();
	    	  return null;
	      }
         //비밀번호가 일치하는 경우
	      //수정 내용을 설정한다.
	      boarddata.setBOARD_NUM(num);
	      boarddata.setBOARD_SUBJECT(
	    		  request.getParameter("BOARD_SUBJECT"));
	      boarddata.setBOARD_CONTENT(
	    		  request.getParameter("BOARD_CONTENT"));
	     
	      String check = multi.getParameter("check");
	      System.out.println("check="+check);
	      if(check!=null) {//기존파일 그대로 사용하는 경우
	    	  boarddata.setBOARD_FILE(check);
	      }else {
	    	  //업로드된 파일의 시스템 상에 업로드된 실제 파일명을 얻어온다.
	    	  String filename = multi.getFilesystemName("BOARD_FILE");
	    	  boarddata.setBOARD_FILE(filename);
	      }
	   
	      //DAO에서 수정 메서드 호출하여 수정한다.
	      result = boarddao.boardModify(boarddata);
	      //수정에 실패한 경우
	      if(result==false) {
	    	  System.out.println("게시판 수정 실패");
	    	  forward.setRedirect(false);
	    	  request.setAttribute("message","게시판 수정 실패입니다.");
	    	  forward.setPath("error/error.jsp");
	    	  return forward;
	      }
	      //수정 성공의 경우
	      System.out.println("게시판 수정 완료");

	      forward.setRedirect(true);
	      //수정한 글 내용을 보여주기 위해 글 내용 보기 보기페이지로 
	      //이동하기 위해 경로를 설정한다.
	      forward.setPath("BoardDetailAction.bd?num="+boarddata.getBOARD_NUM());
	      return forward;
	
	 }catch(Exception ex) {
	    	ex.printStackTrace();
	    }
	    return null;
			
	}
}
