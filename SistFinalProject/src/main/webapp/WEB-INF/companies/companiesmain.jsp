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
<link rel="stylesheet" href="../css/companies.css">
</head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<body>

<!-- 상단 타이틀 -->
<div class="company-top-box">
	<div class="container" style="margin-top: 4%;">
		<div class="row">
			<div class="col-lg-12">
				<h2>기업 탐색</h2>
				<h4 style="color: #ffffff; font-weight: bold;">Job히다에서 추천드리는 기업정보 및 기업문화를 알아보세요</h4>
			</div>
		</div>
	</div>
</div>
<!-- 상단 타이틀 끝 -->


<div class="wrapper">

<!-- 기업 랜덤 리스트 -->
<table style="width: 1300px;">
<caption class="form-inline">
<select class="form-control" style="width: 200px; height: 30px; border-radius: 20px; border: 1px solid #80cbc4;" id="selmajor">
	<option value="전체">산업군 전체</option>
	<option value="서비스업">서비스업</option>
    <option value="금융은행업">금융은행업</option>
    <option value="IT·정보통신산업">IT·정보통신산업</option>
    <option value="판매·유통업">판매·유통업</option>
    <option value="제조·생산·화학업">제조·생산·화학업</option>
    <option value="미디어·광고업">미디어·광고업</option>
    <option value="기관·협회">기관·협회</option>
</select>
&nbsp;&nbsp;&nbsp;
<button style="background-color: #80cbc4; border: 2px solid #fff; border-radius: 20px;
width: 90px; height: 40px; font-size: 10pt; color: white;" id="btnmajor"><b>검색</b></button>
</caption>
	<tr>
	
	<c:if test="${totalCount==0}">
    <td align="center">
      <div style="width: 100%; height: 200px; background: #eeeeee; border-radius: 70px; border: 5px solid white">
      <b style="line-height: 200px;">해당 산업별 공고가 없습니다</b>
      </div>
    </td>
	</c:if>
	
	<c:forEach var="dto" items="${list}" varStatus="i">
		<td>
	<div class="companies" id=${dto.id}>
		<div class="pic">
			<img alt="" src="../images/${dto.logo}">
		</div>
		<hr id="comhr">
		<div class="txt">
			<p style="color: #80cbc4">${dto.major}</p>
			<p style="font-weight: bold;">${dto.name}</p>
			<p>${dto.addr}</p>
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

<!-- 채용중인 리스트 -->
<table style="width: 1300px;" id="hirelist">
<caption style="text-align: center; font-size: 1.2em; font-weight: bold; color: gray; margin-top: 20px; margin-bottom: 20px;"> <b>Job 히다의 채용중인 기업을 알아보세요</b> </caption>
	<tr>
		<c:forEach var="hdto" items="${hlist}" varStatus="i">
		<td>
	<div class="companies" id=${hdto.id}>
		<div class="pic">
			<img alt="" src="../images/${hdto.logo}">
		</div>
		<hr id="comhr">
		<div class="txt">
			<button class="hirebtn" type="button">채용중</button>
			<p style="color: #80cbc4">${hdto.major}</p>
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

<!-- 페이징 -->

<c:if test="${totalCount>0}">
	<div style="width: 800px; text-align: center;" class="container">
	<ul class="pagination">
	
	<!-- 이전 -->
	<c:if test="${startPage>1}">
		<li><a href="main?currentPage=${startPage-1}">⬅</a></li>
	</c:if>
	
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<c:if test="${currentPage==pp}">
				<li><a href="main?currentPage=${pp}">${pp}</a></li>
			</c:if>
			<c:if test="${currentPage!=pp}">
				<li><a href="main?currentPage=${pp}">${pp}</a></li>
			</c:if>
		</c:forEach>
		
	<!-- 다음 -->
	<c:if test="${endPage<totalPage}">
		<li><a href="main?currentPage=${endPage+1}">➡</a></li>
	</c:if>
		
	</ul>
	</div>
</c:if>

<script type="text/javascript">
/* 산업군별 select 검색되게 */
$("#btnmajor").click(function(){
	
	var idx = $("#selmajor option").index($("#selmajor option:selected"));
	if(idx==0){
		location.href='main';
		return;
	}else{
		var industryType=$("#selmajor option:selected").text();
		location.href='industrylist?industry='+industryType;
		return;
		
		
	}
		
});
/* 기업 상세로 이동하게 */
$("div.companies").click(function(){
	
	var id = $(this).attr("id");
	
	location.href="detail?id="+id;
});
</script>

</body>
</html>