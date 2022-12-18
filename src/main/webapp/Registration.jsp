<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="performance.PerformanceDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
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
				<li class="active"><a href="bbs.jsp">게시판</a></li>
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
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" encType = "multipart/form-data" action="RegistrationAction.jsp?keyValue=multipart">
					<h3 style="text-align: center;">공연 등록 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="제목" name="title" maxlength="20">
					</div>
					<div class="form-group">
						<textarea class="form-control" placeholder="내용" name="content" maxlength="20"></textarea>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="공연 위치" name="location" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="공연 날짜 및 시간" name="userEmail" maxlength="20">
						
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주최사" name="company" maxlength="20">
						
					</div>
					<div>
						메인이미지<input type="file" name="mainImg">
						포스터<input type="file" name="posterImg">
						전체이미지<input type="file" name="contentImg">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="공연 등록">
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>