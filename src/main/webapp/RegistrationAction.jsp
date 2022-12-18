<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="performance.PerformanceDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="performance" class="performance.Performance" scope="page" />
<jsp:setProperty name="performance" property="year" />
<jsp:setProperty name="performance" property="month" />
<jsp:setProperty name="performance" property="day" />
<jsp:setProperty name="performance" property="hour" />
<jsp:setProperty name="performance" property="minute" />
<jsp:setProperty name="performance" property="location" />
<jsp:setProperty name="performance" property="mainImg" />
<jsp:setProperty name="performance" property="posterImg" />
<jsp:setProperty name="performance" property="contentImg" />
<jsp:setProperty name="performance" property="company" />
<jsp:setProperty name="performance" property="content" />
<jsp:setProperty name="performance" property="title" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
  <% 
	request.setCharacterEncoding("utf-8");
		
	String location = "C:\\workbench";
		
	int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트
	DefaultFileRenamePolicy a = new DefaultFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", new DefaultFileRenamePolicy());
  %>
  <%
  	System.out.println(performance.getContentImg());
  	if (performance.getTitle() == null || performance.getContent() == null) {
  			PrintWriter script = response.getWriter();
  			script.println("<script>");
  			script.println("alert('입력이 안된 사항이 있습니다.')");
  			script.println("history.back()");
  			script.println("</script>");
  		} else {
  			PerformanceDAO performanceDAO = new PerformanceDAO();
  			int result = performanceDAO.write(performance.getLocation(), performance.getMainImg(), performance.getPosterImg(), 
  							performance.getContentImg(), "", performance.getCompany());
  			if (result == -1) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('글쓰기에 실패 했습니다.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("location.href = 'bbs.jsp'");
  				script.println("</script>");
  			}
  	}
  %>
</body>
</html>