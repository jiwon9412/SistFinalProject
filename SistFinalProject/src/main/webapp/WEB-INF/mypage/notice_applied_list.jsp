<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="<%=request.getContextPath() %>" />
<c:set var="loginok" value="${sessionScope.loginok }" />
<c:set var="myid" value="${sessionScope.myid }" />
<meta charset="utf-8">
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

.resume_table tr {
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

a.nav-link {
	color: white;
}

div.notice {
	border-radius: 20px;
	border: solid 1px gray;
	width: 250px;
	height: 400px;
	margin-top: 30px;
}

div.godetail {
	cursor: pointer;
}

div.logo>img {
	border-radius: 20px 20px 0px 0px;
	width: 250px;
	height: 200px;
}

div.cinfo {
	padding-top: 20px;
	padding-left: 20px;
	text-align: left;
	height: 140px;
}

div.period {
	padding-left: 20px;
}

button {
	border: solid 1px white;
	border-radius: 20px;
	font-size: 3px;
	width: 50px;
	height: 30px;
}

button.type {
	background-color: #87cefa;
	color: #4169e1;
}

button.loc {
	background-color: #fffacd;
	color: #deb887;
}

button.perso {
	background-color: #afeeee;
	color: #3cb371;
}

table {
	margin: 0 auto;
	border-spacing: 2px;
	border-collapse: separate;
}

table td {
	width: 300px;
}

div.noticewrap {
	margin-top: 30px;
}

select option {
	font-size: 16px;
	/* font-weight: bolder;
	color: #40e0d0;  */
	/* font-family: Gamja Flower; */
}

/* a.hover{
	color: black;
	text-decoration: none;
}
a:link {
	color: gray;
    text-decoration: none;
} */

/* a:visited {
    text-decoration: none;
}

a:active {
    text-decoration: none;
} */
</style>

<title>Insert title here</title>
</head>
<body>
<!-- 상단 바 -->
<div class="mypage-top-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>마이페이지</h2>
                    <ul class="mypage_category">
                        <c:if test="${sessionScope.logintype=='user'}">
							<li class="mypage_category"><a class="nav-link" href="${root }/mypage/main">이력서 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" style="color: #40e0d0;" href="${root }/mypage/applications">지원 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/scraps">스크랩 공고</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updatpassform">회원정보 수정</a></li>
						</c:if>
						<c:if test="${sessionScope.logintype=='corp'}">
							<li class="mypage_category"><a class="nav-link" href="${root }/mypage/main">공고 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/applicants">지원자 현황</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updatpassform">기업정보 수정</a></li>
						</c:if>
                    </ul>
			</div>
		</div>
	</div>
</div>
<!-- 상단 바 끝-->
    
    <div class="cart-box-main">
    	<form action="resume_view" method="post" enctype="multipart/form-data">
        <div class="container">
			<c:if test="${appCount==0}">
				<div style="float: center; color: black; font-weight: bold; font-size: 30px; 
				padding-top:60px; padding-bottom:30px;">지원하신 공고가 없습니다.</div>
			</c:if>
			
	        <button type="button" class="btn btn-primary" style="background-color: #40e0d0; border: 0px;
	        border-radius: 20px; width: 150px; height: 50px; font-weight: bold;" 
	        onclick="location.href='/notices/main'">채용공고 보러가기</button>    
			
			<c:if test="${appCount==0}">
				<div style="padding-top:60px; padding-bottom:30px;"></div>
			</c:if>
			
			<c:if test="${appCount>0}">
				<span style="float: right; padding-right: 32px;">${appCount} 개의 지원내역이 있습니다.</span>
				<br><br>
				<table >
				  <tr>
				 
				  <c:if test="${totalCount>0 }">
				  <c:forEach var="ndto" items="${list }" varStatus="i">
				  
				    <td>
						<div class="notice">
						<div class="godetail" num=${ndto.num }>
						  <div class="logo">
						    <img alt="" src="../images/${ndto.photo }">
						    
						  </div>
						  <div class="cinfo">
						    <b style="font-size: 1.1em;">${ndto.name }</b> <br>
						    ${ndto.subject }<br><br>
						   
						    <button class="type"><b>${ndto.type }</b></button>
						    <button class="loc"><b>${ndto.location }</b></button>
						    <button class="perso"><b>${ndto.personnel }명</b></button>
						    
						  </div>
						  </div>
						  <div class="period">
						    <hr style="margin-bottom: 5px;">
						    <b style="color: gray; ">${ndto.period_start } ~ ${ndto.period_end }</b>
						  
						  </div>
						</div>
				    </td>
				    <c:if test="${i.count%4==0 }">
				    </tr>
				    <tr>
				    </c:if>
				    </c:forEach>
				    </c:if>
				    
				  </tr>
				</table>
			</c:if>
        </div>
        </form>
    </div>

<script type="text/javascript">
$("div.godetail").click(function(){
	
	var num = $(this).attr("num");
	
	location.href="${root}/notices/detail?num="+num;
});
</script>
</body>
</html>