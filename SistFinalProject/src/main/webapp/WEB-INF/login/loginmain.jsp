<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<style type="text/css">

.login_button {
	background-color: #40E0D0;
	width: 120px;
	height: 100px;
	float: right;
	border: none;
	font-weight: bold;
	color: white;
	font-size: 15pt;
}

.user_search {
	float: right;
	font-size: 0.8em;
	cursor: pointer;
}

.sns_login {
	display: inline-block;
	cursor: pointer;
}
</style>

<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
<div style="display: flex; justify-content: center;">
	<img alt="" src="${root }/images/joblogo.png">
</div>

<div style="display: flex; justify-content: center;">
<form action="loginprocess" method="post" class="form form-inline">
	<div id="job_seeker">
		
		<input type="text" name="id" placeholder="&nbsp;아이디"  style="width: 280px; height: 50px;" class="form form-control">
		<button type="submit" class="login_button">로그인</button><br>
		<input type="password" name="pass" placeholder="&nbsp;비밀번호"  style="width: 280px; height: 50px;" class="form form-control">
		<br>
		<span style="cursor: pointer; font-size: 0.8em; font-weight: bold; text-decoration: underline;"
		onclick="location.href='useradd'">회원가입</span>
		<span class="user_search">비밀번호 찾기</span>
		<span class="user_search">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
		<span class="user_search">아이디 찾기</span>
		
		<br>
		<div class="sns_login">네이버 로그인</div>
		<div class="sns_login" style="float: right;">카카오 로그인</div>
	</div>
	
	<div id="corp">
	
	</div>
</form>
</div>
</body>
</html>