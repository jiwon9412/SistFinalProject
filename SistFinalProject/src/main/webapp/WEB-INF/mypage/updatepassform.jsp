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

th, td {
	border: none;
}

</style>

<title>Insert title here</title>
</head>
<body>

<div style="display: inline;">
<form action="updateuserpasscheck" method="post" style="width: 800px; margin: auto; margin-top: 50px;">
	<span style="font-size: 1.5em; font-weight: bold; float: left;">비밀번호 확인</span>
	<table class="table table-bordered">
		<caption> <span style="font-size: 8pt;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해 주세요.</span> </caption>
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; border-top-width: thick; border-top-color: gray;">
				아이디
			</th>
			<td style="vertical-align: middle; border-top-width: thick; border-top-color: gray;">
				${sessionScope.myid }
			</td>
		</tr>
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				비밀번호
			</th>
			<td>
				<input type="password" name="pass" class="form-control" style="width: 200px; height: 30px;">
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