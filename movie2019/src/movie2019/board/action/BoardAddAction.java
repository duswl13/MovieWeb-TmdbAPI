package movie2019.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
	   HttpServletResponse response) throws Exception {
		
		BoardDAO boarddao = new BoardDAO();
		BoardVO boarddata = new BoardVO();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		
		//WebContent아래에 폴더 생성
		String saveFolder="/boardupload1";
		
		int fileSize=10*1024*1024; //업로드할 파일의 최대 사이즈. 10MB
		
		//실제 저장 경로를 지정한다.
	    ServletContext sc = request.getServletContext();
	    realFolder = sc.getRealPath(saveFolder);
	    
	    System.out.println("realFolder= "+realFolder);
	    boolean result = false;
	    
	    try {
	    	MultipartRequest multi = null;
	    	multi = new MultipartRequest(request,
	    			          realFolder, fileSize,
	    			          "utf-8", new DefaultFileRenamePolicy());
	    	
	    	//BoardBean 객체에 글 등록 폼에서 입력 받은 정보들을 저장한다.
	    	boarddata.setBOARD_NAME(
	    			multi.getParameter("BOARD_NAME"));
	    	boarddata.setBOARD_PASS(
	    			multi.getParameter("BOARD_PASS"));
	    	boarddata.setBOARD_SUBJECT(
	    			replaceParameter(multi.getParameter("BOARD_SUBJECT")));
	    	boarddata.setBOARD_CONTENT(
	    			replaceParameter(multi.getParameter("BOARD_CONTENT")));
	    	
	    	//업로드의 파일명은 업로드한 파일의 전체 경로에서 파일 이름만 저장한다.
	    	boarddata.setBOARD_FILE(
	    			multi.getFilesystemName("BOARD_FILE"));
	    	
	    	//글 등록 폼에서 입력한 정보가 저장되어 있는 boarddata 객체를 전달한다.
	    	result = boarddao.boardInsert(boarddata);
	    	
	    	//글 등록에 실패할 경우 false를 반환한다.
	    	if(result==false) {
	    		System.out.println("게시판 등록 실패");
	    		forward.setRedirect(false);
	          
	    		return forward;
	    	}
	    	System.out.println("게시판 등록 완료");
	    	//글 등록이 완료되면 글 목록을 단순히 보여주기만 할 것이므로
	    	//Redirect여부를 true로 설정한다.
	    	forward.setRedirect(true);
	    	//이동할 경로를 지정한다.
	    	forward.setPath("BoardList.bd");
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
