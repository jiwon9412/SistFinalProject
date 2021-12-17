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
									<!-- 레이아웃 만드는중 !! -->
<div class="detailwrapper">

<div class="companyname">
	<h4><b>기업 소개</b></h4>
</div>

<div class="companytxt">
	<b>업계&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.industry}</b>	<br><br>
	<b>대표자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.ceo}</b>								<br><br>
	<b>매출액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.sales}</b>							<br><br>
	<b>설립일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.establishment}</b>					<br><br>
	<b>사원수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.employees} 명</b>						<br><br>
	<b>주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.addr}</b>		<br><br>
	<b>${dto.intro}</b>
</div>

<div class="companypic">
	< 사진이 들어갈 곳 >
</div>

</div>

</body>
</html>