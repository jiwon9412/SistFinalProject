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

<style type="text/css">
/* notice에서 가져온 리스트 css */
div.notice{
	border-radius: 20px;
	border: solid 1px lightgray;
	width: 300px;
	height: 400px;
	margin-top: 10px;
	
}
div.godetail{
	cursor: pointer;
}
div.logo>img{
	border-radius: 20px 20px 0px 0px;
	width: 300px;
	height: 200px; 	
}
div.cinfo{
	padding-top: 20px;
	padding-left: 20px;
	text-align: left;
	height: 140px;
}
div.period{
	padding-left: 20px;
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
/* notice에서 가져온 리스트 css 끝 */
</style>

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


<div class="companywrapper">
<br><br>

<!-- 기업소개,이미지 div -->
<h4 class="companytitle" style="margin-left: 50px;"><b>기업 소개</b></h4>
				
<div style="border: 1px solid fff; float: left; width: 20%; height: 400px;">

	<p style="margin-left: 50px;">업계</p>
	<p style="margin-left: 50px;">대표자</p>
	<p style="margin-left: 50px;">설립일</p>
	<p style="margin-left: 50px;">사원수</p>
	<p style="margin-left: 50px;">매출액</p>

</div>

<div style="border: 1px solid fff; float: left; width: 40%; height: 400px;">

	<p>${dto.industry}</p>
	<p>${dto.ceo}</p>
	<p>${dto.establishment}</p>
	<p>${dto.employees} 명</p>
	<p>${dto.sales}</p> <br>
	<p>#${dto.intro}</p>

</div>

<div style="border: 1px solid fff; float: left; width: 40%; height: 400px;">

	<img alt="" src="../images/${dto.photo}" style="width: 100%; height: 390px; border-radius: 20px; border: 4px solid lightgray;">

</div>




<!-- 기업 위치, aqi -->
<div style="border: 1px solid fff; float: left; width: 20%; height: 300px;">

	<b style="margin-left: 50px;"><a href="${dto.site}"><span class="glyphicon glyphicon-home" style="width: 50px; height: 50px; color: gray; cursor: pointer;"></span></a>기업 위치</b>
	

</div>

<div style="border: 1px solid fff; float: left; width: 40%; height: 300px;">

	[ 17305 ] <!-- zipcode -->
	<p>${dto.addr}</p> <!-- addr -->
	[ 상세주소 ] <!-- addr_detail -->
	[ 번호 ] <!-- hp -->
	

</div>

<div id="map" style="border-radius: 20px; border: 4px solid lightgray; float: left; width: 40%; height: 300px;">
</div>




<!-- 4대보험 -->
<div style="border: 1px solid fff; float: left; width: 20%; height: 300px; background-color: #eeeeee;">
	<br><br>
	<p style="margin-left: 50px;"> <span class="glyphicon glyphicon-plus" style="width: 50px; height: 50px;"></span> <b>복리 후생</b></p>
</div>

<div style="border: 1px solid fff; float: left; width: 80%; height: 300px; background-color: #eeeeee">
	<br><br>
	<button type="button" style="width: 300px; height: 200px; border: 5px solid #eeeeee; background-color: white; border-radius: 70px; ">
	${dto.insurance}</button>
	
	
	<img alt="" src="../images/${dto.logo}" style="width: 300px; height: 200px; border-radius: 70px; border: 5px solid #eeeeee;">
	
	<img alt="" src="../images/${dto.photo}" style="width: 300px; height: 200px; border-radius: 70px; border: 5px solid #eeeeee;">
	
	<img alt="" src="../images/com_image.jpg" style="width: 300px; height: 200px; border-radius: 70px; border: 5px solid #eeeeee;">
</div>




<!-- 채용중인 리스트 -->
<table style="width: 1300px;">
	<caption style="text-align: center; font-size: 1.2em; font-weight: bold; color: gray; margin-top: 20px; margin-bottom: 20px;">Job히다의 채용중인 공고를 확인하세요</caption>
	<tr>
		<c:forEach var="hdto" items="${hlist}" varStatus="i">
		<td>
	<div class="companies" id=${hdto.id}>
		<div class="pic">
			<img alt="" src="../images/${hdto.logo}">
		</div>
		<hr>
		<div class="txt">
			<button class="hirebtn" type="button">채용중</button>
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



<!-- 해당 기업의 해당 공고리스트 가져오기 notice에서 가져옴-->

<table style="width: 1300px; margin-bottom: 30px;">
<tr>
    
    <c:if test="${onesize==0}">
    <td align="center">
      <div style="width: 100%; height: 200px; background: #eeeeee; border-radius: 70px; border: 5px solid white">
      <b style="margin-top: 100px;"><b style="color: #40e0d0; line-height: 200px;">${dto.name}</b>의 채용중인 공고가 없습니다</b>
      </div>
    </td>
	</c:if>
    
    <c:if test="${onesize>0}">
    	<h5 style="text-align: center; font-size: 1.2em; font-weight: bold; color: gray;">${dto.name}의 채용중인 공고를 알아보세요</h5>
    </c:if>
    
    <c:forEach var="hdto" items="${onelist }" varStatus="i" end="3">
  
  	 <td>
		<div class="notice">
		<div class="godetail" num=${hdto.num }>
		  <div class="logo">
		    <img alt="" src="../images/${hdto.photo }">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">${hdto.name }</b> <br>
		    ${hdto.subject }<br><br>
		    <button class="type"><b>${hdto.type }</b></button>
		    <button class="loc"><b>${hdto.location }</b></button>
		    <button class="qual"><b>${hdto.personnel }명</b></button>
		    
		  </div>
		  </div>
		  <div class="period">
		    <hr style="margin-bottom: 5px;">
		    <b style="color: gray; ">${hdto.period_start } ~ ${hdto.period_end }</b>
		  </div>
		</div>
    </td>
    <c:if test="${i.count==4 }">
    </tr>
    <tr>
    </c:if>
    </c:forEach>
    
</tr>
</table>


</div><!-- wrapper 끝 -->



<script type="text/javascript">
/* 기업 상세로 이동하게 */
$("div.companies").click(function(){
	
	var id = $(this).attr("id");
	
	location.href="detail?id="+id;
});

/* 채용 공고로 이동하게 */
$("div.godetail").click(function(){
	
	var num = $(this).attr("num");
	
	location.href="../notices/detail?num="+num;
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