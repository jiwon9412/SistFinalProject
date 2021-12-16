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
<link rel="stylesheet" href="../css/companies.css">

</head>

<body>
<!-- 상단 타이틀 -->
<div class="company-top-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>기업 탐색</h2>
				<h4 style="color: #ffffff; font-weight: bold;">Job히다에서 추천드리는 기업정보 및 기업문화를 알아보세요</h4>
			</div>
		</div>
	</div>
</div>
<!-- 상단 타이틀 끝 -->

<div class="wrapper">
<table style="width: 1300px;">
	<tr>
	<c:forEach var="dto" items="${list}" varStatus="i">
		<td>
	<div class="companies">
		<div class="pic">
			<img alt="" src="../images/${dto.logo}">
		</div>
		<hr>
		<div class="txt">
			<p style="color: #40e0d0">${dto.major}</p>
			
			<!-- 채용중이면 보이게 , 채용중이 아니면 안보이게 ??????-->
			<c:if test="">
			<button class="jobs-tag">테스트</button>
			</c:if>
			
			<p style="font-weight: bold;">${dto.name}</p>
			<p>${dto.addr}</p>	<!-- 현재 intro null이라 addr잠시 띄움 -->
		</div>
	</div>
		</td>
		<c:if test="${i.count%4==0 }">
		</tr>
		<tr>
		</c:if>
		</c:forEach>
	</tr>	
</table>	
</div>

<!-- 페이징 -->

<c:if test="${totalCount>0}">
	<div style="width: 800px; text-align: center;" class="container">
	<ul class="pagination">
	
	<!-- 이전 -->
	<c:if test="${startPage>1}">
		<li><a href="main?currentPage=${startPage-1}">⬅</a></li>
	</c:if>
	
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<c:if test="${currentPage==pp}">
				<li class="active"><a href="main?currentPage=${pp}">${pp}</a></li>
			</c:if>
			<c:if test="${currentPage!=pp}">
				<li><a href="main?currentPage=${pp}">${pp}</a></li>
			</c:if>
		</c:forEach>
		
	<!-- 다음 -->
	<c:if test="${endPage<totalPage}">
		<li><a href="main?currentPage=${endPage+1}">➡</a></li>
	</c:if>
		
	</ul>
	</div>
</c:if>

</body>
</html>