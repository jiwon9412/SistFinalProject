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

<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<caption>${noticeSubject} (공고번호: ${noticeNum})</caption>
		<thead style="background-color: #40e0d0; color: white;">
			<tr>
				<th width="20" class="text-center">No.</th>
				<th width="70" class="text-center">이름</th>
				<th width="50" class="text-center">나이</th>
				<th width="120" class="text-center">대학교(전공)</th>
				<th class="text-center">경력</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${applicants_info}" var="li" varStatus="i">
					<tr>
						<td align="center">${i.count}</td>
						<td align="center">${li.name}</td>
						<td align="center">${li.birth}</td>
						<td align="center">${li.college}</td>
						<td>${li.career}</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>