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
<div style="display: inline;">
<form action="updatecorpproc" method="post" style="width: 800px; margin: auto; margin-top: 50px;">
	<span style="font-size: 1.5em; font-weight: bold; float: left;">기업정보 수정</span>
	<table class="table table-bordered">
		<caption> <span style="font-size: 8pt;">기업의 정보를 수정·확인하실 수 있습니다.</span> </caption>
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; border-top-width: thick; border-top-color: gray;">
				아이디
			</th>
			<td style="vertical-align: middle; border-top-width: thick; border-top-color: gray;">
				<span style="font-weight: bold;">${sessionScope.myid }</span>
			</td>
		</tr>
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				상호명
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		
	</table>
	<div style="text-align: center; margin: auto;">
		<button type="submit" class="btn btn-normal" style="background-color: #40e0d0; color: white; font-weight: bold;
		width: 80px; height: 50px;">확인</button>
		<button type="button" class="btn btn-normal" style="background-color: #808080; color: white; font-weight: bold;
		width: 80px; height: 50px;" onclick="history.back()">취소</button>
	</div>
	<br><br><br><br><br>
</form>
</div>
</body>
</html>