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

 a:link { color: gray; text-decoration: underline;}
 a:visited { color: gray; text-decoration: underline;}
 a:hover { color: gray; text-decoration: underline;}



div.detail{
	margin-top: 50px;
	margin-bottom: 50px;
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
	height: 280px;
	margin-top: 10px;
	margin-left: 10px;
	
}

div#man, div#woman{
	border: 1px solid #ddd;
	width: 40px;
	height: 180px;
	float: left;
	margin-left: 32px; 
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

/* 아래 채용 리스트 */
div.notice{
	border-radius: 20px;
	border: solid 1px gray;
	width: 250px;
	height: 400px;
	
	margin-top: 30px;
	
	
}

div.godetail{
	cursor: pointer;
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

<div class="detail" >
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
	      <table style="width: 200px;">
	        <tr>
	          <td align="center">${manAppCnt }</td>
	          <td align="center">${womanAppCnt }</td>
	        </tr>
	        <tr>
	        <td align="center">
	          <div id="man" style="padding-top: ${180-(manAppRatio*180)}px; background-color: #00bfff "></div>
	        </td>
	        <td align="center">
	          <div id="woman" style="padding-top: ${180-(womanAppRatio*180)}px; background-color: #ffc0cb   "></div>
	        </td>
	        </tr>
	        
	        <tr height="30px;" style="vertical-align: bottom;">
	          <td align="center"><b>남자</b></td>
	          <td align="center"><b>여자</b></td>
	        </tr>
	      </table>
	        
	        
	      </div>
	      <div style="margin-top: 20px;">
	        <b style="margin-left: 80px; margin-top: 40px; font-size: 15px;">총 지원자수 : ${totalAppCnt }명</b>
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
 		onclick="location.href='apply?notice_num=${dto.num}&company_id=${dto.company_id}'"><b>지원하기</b></button>
	  </td>
	</tr>
	
  </table>
 
 <hr>
 
 
  <table style="width: 1100px;">
  <caption>
  	<b>채용 중인 공고</b>
  	<a href="main" style="float: right; "><b>더보기</b></a>
  </caption>
    <tr>
    <c:forEach var="hdto" items="${hlist }" varStatus="i" end="3">
  
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
		  
		    
		    <c:if test="${hdto.check==0 }">
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray; cursor: pointer;" 
		    num="${hdto.num }" userId="${myid }"></span>
		    </c:if>
		    
		    <c:if test="${hdto.check==1 }">
		    <span class="glyphicon glyphicon-heart scrapdel" 
		    style="margin-left: 25px; font-size: 20px; color: red; cursor: pointer;" 
		    num="${ndto.num }" userId="${myid }"></span>
		    </c:if>
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
  

</div>
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
	
	$(document).on('click','span.scrap',function(){
		
		var tag = $(this);
		var user_id = $(this).attr("userId");
		var notice_num = $(this).attr("num");
		//alert(user_id+","+notice_num);
		
		
		if(${sessionScope.myid==null}){
			 alert("로그인이 필요한 서비스입니다");
			 location.href='/login/main';
			 return;
		}
		
		$.ajax({
			
			type: "get",
			url: "insertscrap",
			data: {"user_id":user_id,"notice_num":notice_num},
			success: function(data){
				
				//ajax로 스크랩이 되면서 success에서 이거 실행하기
				tag.attr("class","glyphicon glyphicon-heart scrapdel");
				tag.css("color","red");
					
				
			}
			
		});
		
		

	});

	$(document).on('click','span.scrapdel',function(){
		var tag = $(this);
		var user_id = $(this).attr("userId");
		var notice_num = $(this).attr("num");
		
		$.ajax({
			
			type: "get",
			url: "deletetscrap",
			data: {"user_id":user_id,"notice_num":notice_num},
			success: function(data){
				
				//ajax로 스크랩이 삭제되면서 success에서 이거 실행하기
				tag.attr("class","glyphicon glyphicon-heart-empty scrap");
				tag.css("color","gray");
					
				
			}
			
		});
		
		

	});


	$("div.godetail").click(function(){
		
		var num = $(this).attr("num");
		
		location.href="detail?num="+num;
	});
	
	</script>
  
</body>
</html>