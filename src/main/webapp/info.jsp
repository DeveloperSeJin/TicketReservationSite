<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="performance.Performance" %>
<%@ page import="performance.PerformanceDAO" %>
<%@ page import="performance.Review" %>
<%@ page import="performance.ReviewDAO" %>
<%@ page import="performance.Qna" %>
<%@ page import="performance.QNADAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
<style>
.starpoint_wrap{display:inline-block;}
.starpoint_box{position:relative;background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0 no-repeat;font-size:0;}
.starpoint_box .starpoint_bg{display:block;position:absolute;top:0;left:0;height:18px;background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 -20px no-repeat;pointer-events:none;}
.starpoint_box .label_star{display:inline-block;width:10px;height:18px;box-sizing:border-box;}
.starpoint_box .star_radio{opacity:0;width:0;height:0;position:absolute;}
.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}

.blind{position:absolute;clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}
</style>
<script>
	const changeType = (type) = > {
		type=type
	}
</script>
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.3.7.min.js"></script>
  <script src ="js/bootstrap.js"></script>
   <%
  	String userID = null;
    
  	if (session.getAttribute("ID") != null) {
  		userID = (String) session.getAttribute("ID");
  	}
  	int performanceID = 0;
  	if (request.getParameter("performanceID") != null) {
  		performanceID = Integer.parseInt(request.getParameter("performanceID"));
  	}
  	String type = "information";
  	
  	if (request.getParameter("type") != null) {
  		type = (String)request.getParameter("type");
  	}
  	Performance performance = new PerformanceDAO().getPerformance(performanceID);

  %>
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
  				</ul>
  				
  			</li>
  		</ul>
  	</div>
  </nav>
  <div class="container" style = "margin-top: 10%">
  	<div  style = "text-align : center";>
		<img src=<%="images/" + performance.getMainImg() %> style = "width :100%";>
	</div>
  </div>
  
  <div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						
						<td>
							<a href="info.jsp"?type=<%="review"%>&performanceID=<%=performanceID%>>
								공연정보
							</a>
						</td>
						<td>
							<a href="info.jsp?type=<%="review"%>&performanceID=<%=performanceID%>">
								리뷰
							</a>
						</td>
						<td>
							<a href="info.jsp?type=<%="qna"%>&performanceID=<%=performanceID%>">
								Q&A
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
  <%if("information".equals(type)) {%>
	  <div class="container" style = "margin-top: 10%">
  <h3>
  	<%= performance.getTitle()%>
  </h3>
  <h5>
  	<%= performance.getContent()%>
  </h5>
  </div>
  <div class="container" style = "margin-top: 10%">
  	<div  style = "text-align : center";>
		<img src=<%="images/" + performance.getContentImg() %> style = "width :100%";>
	</div>
  </div>
  <%} else if ("review".equals(type)) {%>
  	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">별점</th>
				<th style="background-color: #eeeeee; text-align: center;">코멘트</th>
				<th style="background-color: #eeeeee; text-align: center;">작성자</th>
				<th style="background-color: #eeeeee; text-align: center;">작성일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>							
					<div class="starpoint_wrap">
  						<div class="starpoint_box">
    						<label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
    						<label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
    						<label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
						    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
    						<label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
    						<label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
  							<label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
  							<label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
    						<label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
    						<label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
   							<input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
  							<input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
    						<input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
    						<input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
    						<input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
  							<input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
  							<input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
    						<input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
    						<input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
    						<input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
						    <span class="starpoint_bg"></span>
  						</div>
					</div>
				</td>
				<td>최고에용</td>
				<td>홍길동</td>
				<td>2017-05-04</td>
			</tr>
		</tbody>
	</table>
	<%-- <%
				int pageNumber = 1;
				if (request.getParameter("pageNumber") != null) {
					pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				}
			%>
			<%	
				ReviewDAO review = new ReviewDAO();
				ArrayList<Review> list = review.getList(pageNumber, performanceID);
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td width = "10%" height = "100%">
					<div  style = "text-align : center";>
						<img src=<%="images/"+list.get(i).getPosterImg()%> style = "width :100%";>							
					</div>
				</td>
				<td>
					<%= list.get(i).getContent() %>
				</td>
			</tr>
			<%		
				}
			%> --%>
  <%} else if ("qna".equals(type)) {%>
  <div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>안녕하세요</td>
						<td>홍길동</td>
						<td>2017-05-04</td>
					</tr>
				</tbody>
			</table>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
  <%} %>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>
