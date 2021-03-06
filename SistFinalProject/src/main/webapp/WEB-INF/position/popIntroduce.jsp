<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap"
rel="stylesheet">

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="${root }/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="${root }/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="${root }/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${root }/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${root }/css/custom.css">
    
<style type="text/css">
.resume_mini_title {
	color: #40e0d0;
}

.resume_table tr{
	height: 35px;
}
ul.mypage_category {
　　　list-style-type: none;
	text-align: center;
}

li.mypage_category {
	display: inline-block;
	font-weight: bold;
}
a.nav-link{
	color: white;	
}
</style>

<title>Insert title here</title>
</head>
<body>
<!-- 상단 바 -->
<div class="mypage-top-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>${resumedto.name} 님의 이력서</h2>
			</div>
		</div>
	</div>
</div>
<!-- 상단 바 끝-->
    
    <div class="cart-box-main">
    	<form action="resume_view" method="post" enctype="multipart/form-data">
    	<c:if test="${resumedto.name}">
    	
    	</c:if>
        <div class="container">
            <div class="row new-account-login">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3 class="resume_mini_title">인적사항</h3>
                    </div>
                    <table style="border-collapse: collapse; margin-bottom: 50px;" class="resume_table">
						<tr>
							<th width="90">이름</th>
							<td width="310">${resumedto.name}</td>
							<td rowspan="5">
								<div class="resumephoto" style="width: 120px; height: 160px; border: 1px solid lightgray;" >
									<img alt="" src="${root}/images/${resumedto.photo}" id="photoo_preview" style="width: 117.8px; height: 157.8px;">
								</div>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${resumedto.birth}</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>${resumedto.gender}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${resumedto.hp}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${resumedto.email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${resumedto.addr}</td>
						</tr>			
					</table>
                </div>
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">어학/자격증</h3>
						</div>
                    <table style="border-collapse: collapse; margin-bottom: 50px;" class="resume_table">
						<c:forEach items="${license1}" var="li" varStatus="status">
							<tr>
								<th width="20">■</th>
								<td><b>${li}</b> &nbsp; | &nbsp; 급수/점수: ${license2[status.index]} &nbsp; | &nbsp; 취득일: ${license3[status.index]} </td>
							</tr>
						</c:forEach>
					</table>
					</div>
				</div>
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3 class="resume_mini_title">학력/병역사항</h3>
                        </div>
                    <table style="border-collapse: collapse; margin-bottom: 50px;" class="resume_table">
						<tr>
							<th width="90">고등학교</th>
							<td width="310">${resumedto.highschool1} (${resumedto.highschool2} ~ ${resumedto.highschool3})</td>
						</tr>
						<tr>
							<th>대학교</th>
							<td>${resumedto.college1} (${resumedto.college2} ~ ${resumedto.college3})</td>
						</tr>
						<tr>
							<th>병역</th>
							<td>${resumedto.military}</td>
						</tr>
					</table>
                    </div>
                </div>
                
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">대외활동</h3>
						</div>
					<table style="border-collapse: collapse; margin-bottom: 50px;" class="resume_table">
						<c:forEach items="${activity1}" var="li" varStatus="status">
							<tr>
								<th width="20">■</th>
								<td><b>${li}</b> (${activity2[status.index]}  ~ ${activity3[status.index]}) </td>
							</tr>
						</c:forEach>
					</table>
					</div>
					
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">경력</h3>
						</div>
					<table style="border-collapse: collapse; margin-bottom: 50px;" class="resume_table">
						<c:forEach items="${career1}" var="li" varStatus="status">
							<tr>
								<th width="20">■</th>
								<td><b>${li}</b> ${career2[status.index]} ${career3[status.index]} (${career4[status.index]} ~ ${career5[status.index]})</td>
							</tr>
						</c:forEach>
					</table>
					</div>

					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">자기소개서</h3>
						</div>
						<div class="rounded p-2 bg-light">
							<div class="media mb-2 border-bottom">
								<textarea readonly class="form-control" style="height: 200px;
								background-color: white;">${resumedto.introduce}</textarea>
							</div>
						</div>
					</div>

					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">관심산업</h3>
						</div>
					<table style="border-collapse: collapse; margin-bottom: 50px;" class="resume_table">
							<tr>
								<td><b>관심산업군 :&nbsp; ${resumedto.job}</b></td>
							</tr>
					</table>
					</div>

					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">포트폴리오</h3>
						</div>
						<div class="mb-4">
							<c:if test="${resumedto.portfolio!='no' && resumedto.portfolio!=null}">
								<span> <a href="/mypage/download?clip=${resumedto.portfolio}">
									<span class="glyphicon glyphicon-download-alt"></span>&nbsp;${resumedto.portfolio}</a>
								</span>
							</c:if>
							<c:if test="${resumedto.portfolio=='no' || resumedto.portfolio==null}">
								첨부된 포트폴리오가 없습니다.
							</c:if>
						</div>

						<button type="button" class="btn btn-primary" style="font-size:1.2em; background-color: #40e0d0;
						border: 0px; border-radius: 20px; width: 110px; height: 50px; font-weight: bold; margin-left: 430px; 
						margin-top: 60px;" onclick="window.close()">확인</button>
				</div>
       		</div>
        </form>
    </div>
    <!-- End Cart -->

</body>
</html>