<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/companiesdetail.css">
</head>
<body>
<!-- 상단 타이틀 -->
<div class="companiesdetail-top-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4>${dto.name}</h4>
				<b style="color: #fff;">${dto.major}</b>
			</div>
		</div>
	</div>
</div>
<!-- 상단 타이틀 끝 -->

<div class="companywrapper">
<br><br>

<!-- 기업소개,이미지 div -->
<h4 class="companytitle" style="margin-left: 50px;"><b>기업 소개</b></h4><br><br>
				
<div style="border: 1px solid fff; float: left; width: 20%; height: 500px; background-color: white">

	<p style="margin-left: 50px;">업계</p>
	<p style="margin-left: 50px;">대표자</p>
	<p style="margin-left: 50px;">설립일</p>
	<p style="margin-left: 50px;">사원수</p>
	<p style="margin-left: 50px;">업계</p>
	<p style="margin-left: 50px;">매출액</p>

</div>
<div style="border: 1px solid fff; float: left; width: 40%; height: 500px; background-color: white">

	<p>${dto.industry}</p>
	<p>${dto.ceo}</p>
	<p>${dto.establishment}</p>
	<p>${dto.employees} 명</p>
	<p>${dto.sales}</p>
	<p>${dto.intro}</p>

</div>
<div style="border: 1px solid fff; float: left; width: 40%; height: 500px; background-color: white">

	<img alt="" src="../images/${dto.photo}" style="width: 100%; height: 350px; border-radius: 20px; border: 4px solid lightgray;">

</div>
<!-- 기업소개,이미지 div 끝 -->

<!-- 기업 위치, aqi -->
<div style="border: 1px solid fff; float: left; width: 20%; height: 500px; background-color: white">

	<b style="margin-left: 50px;"><a href="${dto.site}"><span class="glyphicon glyphicon-home" style="width: 50px; height: 50px;"></span></a>기업 위치</b>
	

</div>
<div style="border: 1px solid fff; float: left; width: 40%; height: 500px; background-color: white">

	<p>${dto.addr}</p>
	

</div>
<div style="border: 1px solid fff; float: left; width: 40%; height: 500px; background-color: white">

	API 위치

</div>
<!-- 기업 위치, aqi -->


<!-- 채용중인 리스트 -->
<table style="width: 1300px;" id="hirelist">
<caption> <b>Job 히다의 채용중인 기업을 알아보세요</b> </caption>
	<tr>
		<c:forEach var="hdto" items="${hlist}" varStatus="i">
		<td>
	<div class="companies" id=${hdto.id}>
		<div class="pic">
			<img alt="" src="../images/${hdto.logo}">
		</div>
		<hr>
		<div class="txt">
			<p style="color: #40e0d0">${hdto.major}</p>
			<p style="font-weight: bold;">${hdto.name}</p>
			<p>${hdto.addr}</p>
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