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
<style type="text/css">
tr.ro:hover {
	background-color: lightyellow;
	cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<caption>${noticeSubject} (공고번호: ${noticeNum}) <br></caption>
		
		<c:if test="${appcnt==0}">
			<tr>
				<td><span style="font-size: 2em; font-weight: bold; color: #40e0d0; padding-left: 185px;">지원자가 없습니다.</span></td>
			</tr>
		</c:if>
		
		<c:if test="${appcnt>0}">
			<thead style="background-color: #40e0d0; color: white;">
				<tr>
					<th width="20" class="text-center">No.</th>
					<th width="70" class="text-center">이름</th>
					<th width="50" class="text-center">나이</th>
					<th width="120" class="text-center">대학교(전공)</th>
					<th class="text-center">경력</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${applicants_info}" var="li" varStatus="i">
						<tr onclick="goIntroduce('${li.user_id}')" class="ro">
							<td align="center">${i.count}</td>
							<td align="center">${li.name}</td>
							<td align="center">${li.birth}</td>
							<td align="center">${li.college}</td>
							<td>${li.career}</td>
						</tr>
				</c:forEach>
			</tbody>
		</c:if>
	</table>

	<script type="text/javascript">
	
	//이력서 페이지 오픈
	function goIntroduce(user_id){

		//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음		
		var popupX = (document.body.offsetWidth / 2) - (1200 / 2);

		//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height / 2) - (1000 / 2);
		
		//파라미터 검산용
		console.log(user_id);
		
		//window.onload로 컨트롤러에 파라미터 전달
		window.open("/position/popIntroduce?user_id="+user_id,"new","width=1250, height=1000, left="+ popupX +", top="+ popupY +", resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}

	</script>
</body>
</html>