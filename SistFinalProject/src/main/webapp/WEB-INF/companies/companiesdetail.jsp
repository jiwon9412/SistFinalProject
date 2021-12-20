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
				
<div style="border: 1px solid fff; float: left; width: 20%; height: 400px;">

	<p style="margin-left: 50px;">업계</p>
	<p style="margin-left: 50px;">대표자</p>
	<p style="margin-left: 50px;">설립일</p>
	<p style="margin-left: 50px;">사원수</p>
	<p style="margin-left: 50px;">업계</p>
	<p style="margin-left: 50px;">매출액</p>

</div>
<div style="border: 1px solid fff; float: left; width: 40%; height: 400px;">

	<p>${dto.industry}</p>
	<p>${dto.ceo}</p>
	<p>${dto.establishment}</p>
	<p>${dto.employees} 명</p>
	<p>${dto.sales}</p>
	<p>${dto.intro}</p>

</div>
<div style="border: 1px solid fff; float: left; width: 40%; height: 400px;">

	<img alt="" src="../images/${dto.photo}" style="width: 100%; height: 350px; border-radius: 20px; border: 4px solid lightgray;">

</div>
<!-- 기업소개,이미지 div 끝 -->

<!-- 기업 위치, aqi -->
<div style="border: 1px solid fff; float: left; width: 20%; height: 300px; background-color: #eeeeee;">
	<br><br>
	<b style="margin-left: 50px;"><a href="${dto.site}"><span class="glyphicon glyphicon-home" style="width: 50px; height: 50px;"></span></a>기업 위치</b>
	

</div>
<div style="border: 1px solid fff; float: left; width: 40%; height: 300px; background-color: #eeeeee;">
	<br><br>
	<p>${dto.addr}</p>
	

</div>
<div id="map" style="border: 1px solid fff; float: left; width: 40%; height: 300px; background-color: #eeeeee;">
</div>

<!-- 4대보험 -->
<div style="border: 1px solid fff; float: left; width: 40%; height: 300px; background-color: white">
	<br><br>
	<p style="margin-left: 50px;"> <span class="glyphicon glyphicon-plus" style="width: 50px; height: 50px;"></span> <b>복리후생</b></p>
</div>

<div style="border: 1px solid fff; float: left; width: 60%; height: 300px; background-color: white">
	<br><br>
	${dto.insurance}
</div>

<!-- 채용중인 리스트 -->
<table style="width: 1300px;">
<caption> <h3><b class="hiretitle" style="margin-top: 20px;">채용 공고</b></h3> </caption>
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



<script type="text/javascript">
/* 기업 상세로 이동하게 */
$("div.companies").click(function(){
	
	var id = $(this).attr("id");
	
	location.href="detail?id="+id;
});
</script> 

<!-- 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4fe90bf7dbc0b8a909c29abf8e342f1&libraries=services"></script>
<script>
/* var container = document.getElementById('map');
var options = {
	center: new kakao.maps.LatLng(33.450701, 126.570667),
	level: 3
};

var map = new kakao.maps.Map(container, options);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map); */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${dto.addr}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.name}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    

</script>
</body>
</html>