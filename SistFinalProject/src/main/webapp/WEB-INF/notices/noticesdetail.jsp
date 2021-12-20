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
	font-size: 1.3em;
}
table td{
	
}

div#dDay{
	border: 1px solid gray;
	border-radius: 20px;
	width: 270px;
	height: 180px;
	/* background-clip: content-box; */
}

div#genderRatio{
	margin-top: 50px;
	border: 1px solid gray;
	border-radius: 20px;
	width: 270px;
	height: 400px;
}

div#graph{
	border: 1px solid gray;
	border-radius: 10px;
	width: 250px;
	height: 250px;
	margin-top: 10px;
	margin-left: 10px;
	
}

div#man, div#woman{
	border: 1px solid #ddd;
	width: 40px;
	height: 180px;
	float: left;
	margin-left: 56px;
	margin-top: 20px;
	background-clip: content-box;
}

div#map{
	margin-top: 50px;
	border: 1px solid gray;
	border-radius: 20px;
	width: 270px;
	height: 200px;
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
                    	<img alt="" src="../images/${dto.logo }" style="border: 1px solid white; width: 80px; height:50px; ">
                    	${dto.name }
                    </h2>
                    <h4>${dto.intro }</h4>
                </div>
            </div>
        </div>
    </div>
    <!-- 상단 타이틀 끝 -->

<!-- ****************div height 나중에 지워주기 보기좋으라고일단해놓은거!***********************  -->
<div class="detail" style="height: 1500px;">
  <table id="wrap">
	<tr>
	  <th rowspan="6">지원분야</th>
	  <td width="700px;"><b>모집부분</b></td>
	  <td rowspan="24" style="vertical-align: top;">
	    <div id="dDay">
	    <div style="margin-top: 10px; " id="day">
	      <font style="color: #40e0d0; font-size: 40px; margin-left: 80px; ">D - ${dDay }</font>
	    </div>
	      <hr>
	      <div id="period" >
	      <table>
	        <tr>
	          <th rowspan="2" style="width: 100px; font-size: 15px;">접수기간</th>
	          <td>${dto.period_start} &nbsp;&nbsp;시작</td>
	        </tr>
	        <tr>
	          <td>${dto.period_end} &nbsp;&nbsp;마감</td>
	        </tr>
	      </table>
	      
	      </div>
	    </div>
	    
	    <div id="genderRatio">
	      <div style="margin-top: 20px;">
	        <b style="margin-left: 60px; margin-top: 40px; font-size: 20px;">지원자 성별 비율</b>
	      </div>
	      <div id="graph" >
	        <div id="man" style="padding-top: ${180-(manAppRatio*180)}px; background-color: #00bfff "></div>
	        <div id="woman" style="padding-top: ${180-(womanAppRatio*180)}px; background-color: #ffc0cb   "></div>
	        
	      </div>
	    </div>
	    
	    <div id="map" ></div>
	  </td>
	</tr>	
	<tr>
	  <td>${dto.section }<br><br></td>
	</tr>
	
	<tr>
	  <td><b>고용형태</b></td>
	</tr>
	<tr>
	  <td>${dto.type }<br><br></td>
	</tr>
	
	<tr>
	  <td><b>모집인원</b></td>
	</tr>
	<tr>
	  <td>${dto.personnel }명<br><br><br><br><br></td>
	</tr>
	
	<tr>
	  <th>업무내용</th>
	  <td>
	  <c:forTokens var="t" items="${dto.task }" delims="-"> 
	  	- ${t } <br>
	 </c:forTokens>
	 <br><br><br><br><br>
	  </td>
	</tr>
	
	<tr>
	  <th rowspan="4">지원자격</th>
	  <td><b>직무관련</b></td>
	</tr>
	
	<tr>
	  <td>
	  <c:forTokens var="q" items="${dto.qualification }" delims="-"> 
	  	- ${q } <br>
	 </c:forTokens>
	 <br><br>
	  </td>
	  
	</tr>
	
	<tr>
	  <td><b>우대사항</b></td>
	</tr>
	
	<tr>
	  <td>
	  <c:forTokens var="pre" items="${dto.preference }" delims="-"> 
	  	- ${pre } <br>
	 </c:forTokens>
	 <br><br><br><br><br>
	  </td>
	  
	</tr>
	
	<tr>
	  <th rowspan="6">지원서접수</th>
	  <td><b>접수기간</b></td>
	</tr>
	
	<tr>
	  <td>${dto.period_start } ~ ${dto.period_end }<br><br></td>
	</tr>
	
	<tr>
	  <td><b>사이트</b></td>
	</tr>
	
	<tr>
	  <td><a href="${dto.site }">${dto.site }</a><br><br></td>
	</tr>
	
	<tr>
	  <td><b>주소</b></td>
	</tr>
	
	<tr>
	  <td>${dto.addr} <br> (${dto.location }&nbsp;지사)<br><br><br><br><br><br></td>
	</tr>
	 

	<tr>
	  <td colspan="2" align="center" >
	    <button style="background-color: #40e0d0; border: 2px solid #fff; border-radius: 20px;
 		width: 700px; height: 40px; font-size: 10pt; color: white;" 
 		onclick="location.href='apply'"><b>지원하기</b></button>
	  </td>
	</tr>
	
  </table>
  
  <!-- 카카오맵 -->
<!-- <div class="kakao" style=" float: left; margin-top: 60px; margin-left: 50px;;
background-color: #ccc;">
  <div id="map" style="width:400px;height:300px;"></div>
</div> -->
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
  
</div>
</body>
</html>