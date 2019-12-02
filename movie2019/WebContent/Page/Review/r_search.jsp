<%@ page import = "java.util.Iterator" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.Collections" %>
<%@ page import = "java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>	


<%!
	String[] keywords = {"겨울", "겨울왕국", "겨울운명이조..."};

	public List<String> search(String userKeyword) {
		if (userKeyword == null || userKeyword.equals("")){
			return null;
		}
		List<String> lists = new ArrayList<String>();
		for (int i=0; i<keywords.length; i++) {
			if (keywords[i].startsWith(userKeyword)) {
				lists.add(keywords[i]);
			}
		}
		return lists;
}
%>

<%
	String userKeyword = request.getParameter("userKeyword");
	List<String> keywordList = search(userKeyword);
	
	out.print(keywordList.size());
	out.print("|");
	
	Iterator<String> it = keywordList.iterator();
	while (it.hasNext()) {
		String value = (String)it.next();
		out.print(value);
		if (keywordList.size()-1>0) {
			out.print(",");
		}
	}
%>
