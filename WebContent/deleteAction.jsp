<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Notice Board Login</title>
</head>
<body>
	<%	
		String userID = null;
		if(session.getAttribute("userID") != null) {
			System.out.print("bye");
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You need Login')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		if(bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('This Content is Error!')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(request.getParameter("bbsID"))) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You can't Fix this Content!')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
	
	
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);
				if(result < 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Delete is Failed, Please Retry!')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
	%>
</body>
</html>