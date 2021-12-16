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
<style type="text/css">
div.companies{
	width: 300px;
	height: 300px;
	border: 1px solid lightgray;
	border-radius: 20px;
}

div.pic{
	width: 300px;
	margin-top: 20px;
}

div.pic>img{
	margin-left: 50px;
}

div.txt>p{
	padding-left: 20px;
	padding-top: 10px;
	margin-top: 10px;
}

table{
	margin: 0 auto;
}

div.wrapper{
	margin-top: 80px;
}

b.title{
	font-size: 15pt;
	margin-left: 300px;
	color: #424242;
}
</style>

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

<!-- 테이블 위 title -->
<b class="title">Job 히다 추천공고</b>

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
			<p style="font-weight: bold;">${dto.name}</p>
			<p>${dto.addr}</p>
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
</body>
</html>