<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "performance.PerformanceDAO" %>
<%@ page import = "performance.Performance" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.3.7.min.js"></script>
  <script src ="js/bootstrap.js"></script>
  <nav class="navbar navbar-default">
  	<div class="navbar-header">
  		<button type="button" class="navbar-toggle collapsed"
  			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
  			aria-expanded="false">
  			<span class="icon-bar"></span>
  			<span class="icon-bar"></span>
  			<span class="icon-bar"></span>
  		</button>
  		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
  	</div>
  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  		<ul class="nav navbar-nav">
  			<li><a href="main.jsp">메인</a></li>
  			<li><a href="bbs.jsp">게시판</a></li>
  			<%if(session.getAttribute("ID") != null) {
  				%>
  				<li>hi<br><%=session.getAttribute("ID") %></li><%
  			} %>
  		</ul>
  		<ul class="nav navbar-nav navbar-right">
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle"
  					data-toggle="dropdown" role="button" aria-haspopup="true"
  					aria-expanded="false">접속하기<span class="caret"></span></a>
  				<ul class="dropdown-menu">
  					<li class="active"><a href="login.jsp">로그인</a></li>
  					<li><a href="join.jsp">회원가입</a></li>
  					<li><a href="SellerRegistration.jsp">판매자 신청</a></li>
  					<li><a href="SellerLogin.jsp">판매자 로그인</a></li>
  					<li><a href="logoutAction.jsp">로그아웃</a></li>
  				</ul>
  				
  			</li>
  		</ul>
  	</div>
  </nav>
  <div class="container" style = "margin-top: 10%">
		<div id="myCarousel" class="carousel slide" data-ride= "carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active" style = "text-align : center";>
					<img src="images/heizemain.jpg" width = "1000px" height = "300px">
				</div>
				<div class="item" style = "text-align : center";>
					<img src="images/10cmmain.jpg" width = "1000px" height = "300px">
				</div>
				<div class="item" style = "text-align : center";>
					<img src="images/leemujinmain.jpg" width = "1000px" height = "300px">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-rigth"></span>
			</a>
		</div>
  </div>
	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="container" style = "margin-top: 10%">
		<div class="row">
			<table class="table table-striped"  border= "1px solid #dddddd">
				<tbody>
					<%
						PerformanceDAO performance = new PerformanceDAO();
						ArrayList<Performance> list = performance.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td width = "10%" height = "100%">
							<a href="info.jsp?performanceID=<%= list.get(i).getPerformanceID() %>">
								<div  style = "text-align : center";>
									<img src=<%="images/"+list.get(i).getPosterImg()%> style = "width :100%";>
								</div>
							</a>
						</td>
						<td>
							<a href="info.jsp"?performanceID=<%= list.get(i).getPerformanceID() %>">
								<%= list.get(i).getContent() %>
							</a>
						</td>
					</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
				<a href="main.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if (performance.nextPage(pageNumber + 1)) {
			%>
				<a href="main.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>	
			<%if("seller".equals(session.getAttribute("type"))) {
  				%>
  				<a href="Registration.jsp" class="btn btn-primary pull-right">글쓰기</a><%
  			} %>
		</div>
	</div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>
