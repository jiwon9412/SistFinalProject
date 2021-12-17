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
	border: 1px solid #40e0d0;
	border-radius: 20px;
	width: 270px;
	height: 180px;
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
                    	${dto.company_id }
                    </h2>
                    <h4>회사설명</h4>
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
	  <td rowspan="10" style="vertical-align: top;">
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
	  <td>${dto.site }<br><br></td>
	</tr>
	
	<tr>
	  <td><b>주소</b></td>
	</tr>
	
	<tr>
	  <td>${dto.addr} &nbsp;&nbsp;&nbsp; ${dto.location }&nbsp;지사<br><br><br><br><br><br></td>
	</tr>
	 

	<tr>
	  <td colspan="2" align="center" >
	    <button style="background-color: #40e0d0; border: 2px solid #fff; border-radius: 20px;
 		width: 700px; height: 40px; font-size: 10pt; color: white;" id="btntype"><b>지원하기</b></button>
	  </td>
	</tr>
	
  </table>
</div>
</body>
</html>