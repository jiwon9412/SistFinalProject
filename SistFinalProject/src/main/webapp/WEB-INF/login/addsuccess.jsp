<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src = "https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<div style="display: flex; justify-content: center;">
	<img alt="" src="${root }/images/joblogo.png"><br>
</div>
<div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
	<div>
	<span style="font-size: 2em;">Job히다 <b>회원가입이 완료</b>되었습니다</span><br><br>
	</div>
	
	<div>
		<span style="color: lightgray;">로그인 후 서비스를 이용하실 수 있습니다.</span><br><br>
	</div>
	
	<div>
	<table class="table table-bordered" style="width: 500px;">
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; border-top-width: thick; border-top-color: #40e0d0;">
				아이디
			</th>
			<td style="vertical-align: middle; border-top-width: thick; border-top-color: #40e0d0;">
				<span style="font-weight: bold;">${id }</span>
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				<c:if test="${sessionScope.signupType=='user' }">
					이름
				</c:if>
				<c:if test="${sessionScope.signupType=='corp' }">
					기업명
				</c:if>
				
			</th>
			<td style="vertical-align: middle;">
				<span style="font-weight: bold;">${name }</span>
			</td>
		</tr>
	</table>
	</div><br>
	
	<div>
	<button type="button" class="btn btn-normal" style="width: 150px; height: 60px; color: #40e0d0; border-color: #40e0d0; background-color: white;
	font-size: 1.2em; font-weight: bold;" onclick="location.href='/'">홈으로</button>
	
	<button type="button" class="btn btn-normal" style="width: 150px; height: 60px; color: white; background-color: #40e0d0; margin-left: 20px;
	border: none; font-size: 1.2em; font-weight: bold;">로그인</button>
	</div>
	<br><br><br><br>
</div>
</body>
</html>