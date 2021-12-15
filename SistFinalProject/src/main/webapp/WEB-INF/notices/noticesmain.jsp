<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="<%=request.getServletPath() %>" />
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.notice{
	border-radius: 20px;
	border: solid 1px gray;
	width: 250px;
	height: 400px;
	cursor: pointer;
	margin-top: 30px;
	
	
}
div.logo>img{
	border-radius: 20px 20px 0px 0px;
	width: 250px;
	height: 200px; 	
}

div.cinfo{
	padding-top: 20px;
	padding-left: 20px;
	text-align: left;
}

button{
	border: solid 1px white;
	border-radius: 20px;
	font-size: 0.9em;
	width: 60px;
	height: 30px;
	
}

button.type{
	background-color: #6495ed     ;
	color: #0000cd  ;
}

button.loc{
	background-color: #fffacd    ;
	color: #deb887   ;
}

button.qual{
	background-color: #98fb98   ;
	color: #008080   ;
}

table{
	margin: 0 auto;
	 border-bottom: 10px solid #fff;
}
div.noticewrap{
	margin-top: 30px;
}

</style>
<title>Insert title here</title>
</head>
<body>
<div class="noticewrap">
<button type="button">필터</button>
<table style="width: 1300px;">
  <tr>
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
    
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
    
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
    
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
  </tr>
  
  <tr>
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
    
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
    
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
    
    <td>
		<div class="notice">
		  <div class="logo">
		    <img alt="" src="../images/naver123.png">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">[Naver] 백엔드, 프론트 개발자 모집</b> <br>
		    Back-end Engineer<br><br>
		    <button class="type"><b>인턴</b></button>
		    <button class="loc"><b>서울</b></button>
		    <button class="qual"><b>대졸</b></button>
		    
		    <hr style="margin-bottom: 10px;">
		    <b style="color: gray;">2021-12-14 ~ 2021-12-31</b>
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;"></span>
		  </div>
		</div>
    </td>
  </tr>
</table>
</div>



<script type="text/javascript">

$(document).on('click','span.scrap',function(){

	//ajax로 스크랩이 되면서 success에서 이거 실행하기
	$(this).attr("class","glyphicon glyphicon-heart scrapdel");
	$(this).css("color","red");

});

$(document).on('click','span.scrapdel',function(){

	//ajax로 스크랩이 삭제되면서 success에서 이거 실행하기
	$(this).attr("class","glyphicon glyphicon-heart-empty scrap");
	$(this).css("color","gray");

});


</script>
</body>
</html>