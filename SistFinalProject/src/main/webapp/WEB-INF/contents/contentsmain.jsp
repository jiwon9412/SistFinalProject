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
<link rel="stylesheet" href="../css/contents.css">
<script type="text/javascript">
/* 상단 이미지 슬라이드 */
window.onload = function() {
		slide_contents();
}
	var i = 1;
	
	function slide_contents() {	
		if(i > 5)
			i = 1;
		
		document.getElementById("slide_pic").src = "../images/con_slide_" + i + ".jpg";
		
		setTimeout(slide_contents, 2000);
		i++;
}
</script>

</head>
<body onload="slide_contents()">
<img id="slide_pic" src="image/con_slide_1.jpg" style="text-align: center;">

<div class="contentswrapper" style="width: 100%"><!-- contentswrapper 시작 -->

<!-- 제목 넣기 -->


<div id="contents"><!-- 공백 contents -->
</div>

<div id="contents">
<a href="https://youtu.be/PQG-vZuaHHk">youtube</a>

</div>

<div id="contents">
<iframe id="youtube" src="https://www.youtube.com/embed/PQG-vZuaHHk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>

<div id="contents">
<iframe id="youtube" src="https://www.youtube.com/embed/PQG-vZuaHHk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>

<div id="contents"><!-- 공백 contents -->
</div>


</div><!-- contentswrapper 끝 -->


</body>
</html>