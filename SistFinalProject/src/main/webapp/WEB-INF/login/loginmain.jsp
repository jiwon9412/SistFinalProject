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

.btn-active {
	border: 1px solid #40e0d0;
	border-bottom: none;
	background-color: white;
	font-weight: bold;
	border-radius: 3px;
}


.sns_login {
	display: inline-block;
	cursor: pointer;
}
</style>

<script type="text/javascript">

$(function () {
	
	//개인회원/기업회원 버튼
	var loginLinks = document.querySelectorAll(".btn-l"); 
	
	window.onload = function() {
		loginLinks[0].click();
	}
	
	//style css active
	function clickLoginHandler() { 
		for(var i=0; i<loginLinks.length; i++) {
			loginLinks[i].classList.remove("btn-active");
		}
		this.classList.add("btn-active");
	}

	for (var i=0; i<loginLinks.length; i++) {
		loginLinks[i].addEventListener("click", clickLoginHandler);
		loginLinks[i].addEventListener("click", function () {
			//logintype에 버튼의 value값 저장
			$("input[name=logintype]").attr("value",$(this).attr("value"));
		});
	}
});

function kakaoLogin() {
	var popupX = (document.body.offsetWidth /2) - (200 / 2);
	var popupY = (document.body.offsetHeight /2) - (200 / 2);
	window.open("https://kauth.kakao.com/oauth/authorize?client_id=0f410665a17c7a968c70897f67459035&redirect_uri=http://localhost:9003/login/kakaoLogin&response_type=code"
			, '카카오 로그인', 'left=' +popupX+ ', top=' +popupY+', width=600, height=950, location=no, status=no, scrollbars=no');
}

</script>

<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
<div style="display: flex; justify-content: center;">
	<img alt="" src="${root }/images/joblogo.png">
	
</div>
<div style="text-align: center; margin: auto;">
<input type="button" value="개인회원" id="userbtn" class="btn-l" style="width: 200px; height: 40px;">
<input type="button" value="기업회원" id="corpbtn" class="btn-l" style="width: 200px; height: 40px;">

<br><br>
<form action="loginprocess" method="post" class="form form-inline" style="display: inline-block;">
	
	<input type="hidden" name="logintype">
	<input type="text" name="id" placeholder="&nbsp;아이디"  style="width: 280px; height: 50px;" class="form form-control">
	<button type="submit" class="login_button">로그인</button><br>
	<input type="password" name="pass" placeholder="&nbsp;비밀번호"  style="width: 280px; height: 50px;" class="form form-control">
	
	<br>
	<span class="user_search" style="margin-top: 5px;">비밀번호 찾기</span>
	<span class="user_search" style="margin-top: 5px;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	<span class="user_search" style="margin-top: 5px;">아이디 찾기</span>
	<br>
	
	<div class="sns_login" style="float: left;">
		<img alt="" src="${root }/images/naver_login.png" style="width: 190x; height: 45px; margin-top: 2px;">
	</div>
	<div class="sns_login" style="float: right;">
		<img alt="" src="${root }/images/kakao_login.png" style="width: 190px;"
		onclick="kakaoLogin()">
	</div>
	<br><br><br><br>
	
	<span style="cursor: pointer; font-size: 0.8em; font-weight: bold; text-decoration: underline; float: right;"
		onclick="location.href='useradd'" class="glyphicon glyphicon-user">개인회원가입</span>
	<span style="font-size: 0.8em; float: right; margin-right: 10px;">좋은 일을 찾으시나요?</span>
	<br>
	
	<span style="cursor: pointer; font-size: 0.8em; font-weight: bold; text-decoration: underline; float: right;"
		onclick="location.href='corpadd'" class="glyphicon glyphicon-briefcase">기업회원가입</span>
	<span style="font-size: 0.8em; float: right; margin-right: 10px;">좋은 인재를 구하시나요?</span>
	<br>
	
	<br>

</form>
</div>
</body>

</html>