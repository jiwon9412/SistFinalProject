<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap"
rel="stylesheet">
<link rel="stylesheet" href="../css/notices.css">
<title>Insert title here</title>
<style type="text/css">

div.detail{
	margin-top: 50px;
}

table{
	margin: 0 auto;
}
table th{
	width:200px; 
	vertical-align: top;
	font-size: 1.2em;
}
</style>
</head>
<body>
<!-- 상단 타이틀 시작 -->
    <div class="notices-top-box" style="background: url('../images/notices-bg.jpg') no-repeat center center;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>
                    	<img alt="" src="../images/coupang_logo.jpg" style="border: 1px solid white; width: 80px; height:50px; ">
                    	${dto.company_id }
                    </h2>
                    <h4>회사설명</h4>
                </div>
            </div>
        </div>
    </div>
    <!-- 상단 타이틀 끝 -->

<!-- ****************div height 나중에 지워주기 보기좋으라고일단해놓은거!***********************  -->
<div class="detail" style="height: 800px;">
  <table>
	<tr>
	  <th rowspan="2">지원분야</th>
	  <td>모집부분</td>
	</tr>	
	<tr>
	  <td>${dto.section }</td>
	</tr>
  </table>
</div>
</body>
</html>