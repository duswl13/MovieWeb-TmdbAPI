package movie2019.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {

		BoardDAO boarddao = new BoardDAO();
		BoardVO boarddata = new BoardVO();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		
		//WebContent�Ʒ��� ���� ����
		String saveFolder="/boardupload1";
		
		int fileSize=10*1024*1024; //���ε��� ������ �ִ� ������. 10MB
		
		//���� ���� ��θ� �����Ѵ�.
	    ServletContext sc = request.getServletContext();
	    realFolder = sc.getRealPath(saveFolder);
	    
	    System.out.println("realFolder= "+realFolder);
	    boolean result = false;
	    
	    try {
	    	MultipartRequest multi = null;
	    	multi = new MultipartRequest(request,
	    			          realFolder, fileSize,
	    			          "utf-8", new DefaultFileRenamePolicy());
	    	
	    	//BoardBean ��ü�� �� ��� ������ �Է� ���� �������� �����Ѵ�.
	    	boarddata.setBOARD_NAME(
	    			multi.getParameter("BOARD_NAME"));
	    	boarddata.setBOARD_PASS(
	    			multi.getParameter("BOARD_PASS"));
	    	boarddata.setBOARD_SUBJECT(
	    			replaceParameter(multi.getParameter("BOARD_SUBJECT")));
	    	boarddata.setBOARD_CONTENT(
	    			replaceParameter(multi.getParameter("BOARD_CONTENT")));
	    	
	    	//���ε��� ���ϸ��� ���ε��� ������ ��ü ��ο��� ���� �̸��� �����Ѵ�.
	    	boarddata.setBOARD_FILE(
	    			multi.getFilesystemName("BOARD_FILE"));
	    	
	    	//�� ��� ������ �Է��� ������ ����Ǿ� �ִ� boarddata ��ü�� �����Ѵ�.
	    	result = boarddao.boardInsert(boarddata);
	    	
	    	//�� ��Ͽ� ������ ��� false�� ��ȯ�Ѵ�.
	    	if(result==false) {
	    		System.out.println("�Խ��� ��� ����");
	    		forward.setRedirect(false);
	            request.setAttribute("message", "�Խ��� ��� �����Դϴ�.");
	            forward.setPath("error/error.jsp");
	    		return forward;
	    	}
	    	System.out.println("�Խ��� ��� �Ϸ�");
	    	//�� ����� �Ϸ�Ǹ� �� ����� �ܼ��� �����ֱ⸸ �� ���̹Ƿ�
	    	//Redirect���θ� true�� �����Ѵ�.
	    	forward.setRedirect(true);
	    	//�̵��� ��θ� �����Ѵ�.
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
