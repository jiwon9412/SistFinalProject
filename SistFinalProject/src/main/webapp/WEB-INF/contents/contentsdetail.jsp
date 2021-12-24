<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="../css/contentsdetail.css">
</head>
<body>

<!-- 상단 타이틀 -->
<div class="contentsdetail-top-box">
	<div class="container" style="margin-top: 4%;">
		<div class="row">
			<div class="col-lg-12">
				<h5>Job히다의 다양한 커리어 팁을 알아보세요</h5>
			</div>
		</div>
	</div>
</div>
<!-- 상단 타이틀 끝 -->

<!-- 첫번째 블록 : 간단한 타이틀 , 유튜브 크게보기 -->
<div id="condetailblock1">
		<b id="subtitle">크게 보고 싶다면 👉</b>	<a href="${src}"><b id="subbtn">👩🧑</b></a>
</div>


<!-- 두번째 블록 : 유튜브 영상 -->
<div id="condetailblock1"> <iframe id="youtube" src="${src}" title="YouTube video player" 
frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
allowfullscreen></iframe> </div>


<!-- 세번째 블록 : subjects , contents 불러오기 , 이전버튼 -->
<div id="condetailblock2">
	<p id="subtxt"> ✔${subjects}✔ </p>
</div>

<div id="condetailblock2">
	<p id="contxt"> ${contents} </p>
	
	<button type="button" id="backbtn" onclick="history.back()">이전으로</button>
</div>


<!-- 네번째 블록 : 이미지 클릭하였을때 다른 유튜브 링크로 연결 (다른 영상보기) , 화면이 심심해보여서,,,,,,ㅎㅎ -->
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=uv_g0bbC7Oo"><img alt="" src="../images/con01.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">#1면접 준비 해보기</b>
</div>
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=0tLTEg-ftvI"><img alt="" src="../images/con02.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">취업준비 순서 5단계</b>
</div>
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=33Aw5HG56ro"><img alt="" src="../images/con03.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">좋은 중소기업 고르는 방법</b>
</div>
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=WRmCSUyMLsM"><img alt="" src="../images/con04.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">내 스펙으로 여의도 입사할 수 있을까?</b>
</div>

<!-- 더 추가해주던가 ! 해주기이 (위에 복붙한거임) -->
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=uv_g0bbC7Oo"><img alt="" src="../images/con01.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">#1면접 준비 해보기</b>
</div>
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=0tLTEg-ftvI"><img alt="" src="../images/con02.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">취업준비 순서 5단계</b>
</div>
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=33Aw5HG56ro"><img alt="" src="../images/con03.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">좋은 중소기업 고르는 방법</b>
</div>
<div id="condetailblock3">
	<a href="https://www.youtube.com/watch?v=WRmCSUyMLsM"><img alt="" src="../images/con04.jpg" id="anotherimg"></a>
	<span class="glyphicon glyphicon-pushpin job">Job히다TV</span> &nbsp;&nbsp;<b id="anothertxt">내 스펙으로 여의도 입사할 수 있을까?</b>
</div>

</body>
</html>