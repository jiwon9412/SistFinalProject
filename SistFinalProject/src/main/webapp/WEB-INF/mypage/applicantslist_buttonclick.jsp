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
		<caption>(공고제목)</caption>
		<thead>
			<tr>
				<th>No.</th>
				<th>이름</th>
				<th>나이</th>
				<th>대학교(전공)</th>
				<th>경력</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><c:out value="${param.nonum}" /></td>
			</tr>
			<c:forEach items="${applicantsByCompany}" var="li" varStatus="i">
				<c:set var='nnn' value='5' />
				<c:set var="search" value="${requestScope['search']}" />
				<%-- <c:if test="${fn.contains(li.notice_num, '15')}"> --%>
				<c:if test="${li.notice_num eq param.nonum}">
					<tr>
						<td align="center">${i.count}</td>
						<td><a style="color: black;" href="#">${li.notice_num}</a></td>
						<td>${li.user_id}</td>
						<td align="center"></td>
						<td align="center"></td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>