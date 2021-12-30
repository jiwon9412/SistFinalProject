<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/potision.css">

<style type="text/css">

	.introduce{
		cursor: pointer;
	}

</style>

<title>Insert title here</title>
</head>
<body>

    <!-- 상단 타이틀 시작 -->
    <div class="potision-top-box" id="suggestion">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>포지션 제안</h2>
                    <h4>직군에 따른 포지션을 제안할 수 있습니다</h4>
                </div>
            </div>
        </div>
    </div>
    <!-- 상단 타이틀 끝 -->
    
	
	<!-- 도착한 Offer 갯수 -->
	<br>
	
	<div class="suggestion" style="margin-bottom: 5%;">
         <div class="title-left">
             <h3 style="display: inline;">포지션 제안</h3>
             
             <c:if test="${totalPosition>0}">
             	<h5 id="totPo"><b>총 ${totalPosition}건의 제안이 도착했습니다</b></h5>
             </c:if>
         </div>
         
        <!-- 총갯수에 따른 변화 -->
		<table id="position-table" style="border-top: #00e1ff">
			<tr bgcolor="#40e0d0">
				<th width="70"><center>회원명</center></th>
				<th width="100"><center>직종</center></th>
				<th width="180"><center>자기소개서</center></th>
				<th width="100"><center>포지션 제안</center></th>			
			</tr>
			
		
		<c:forEach var="user" items="${user_list}">
			<tr align="center">
				<td><b>${user.name }</b></td>
				<td>${user.job }</td>
				<td><span class="introduce" onclick="goIntroduce('${user.id}')">${user.introduce}</span></td>
				<td>
					<button type="button" class="btn btn-default btndel" style="width: 100px;" onclick="insertOffer()">포지션 제안</button>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>	


    <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	   
		<!-- Modal Content -->
	    <div class="modal-content">
	      <div class="modal-header">
	      	<div class="modal-title" id="offer_subject" style="display:inline; width: 650px;"></div>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" id="modal-body">
	         
	         
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" data-dismiss="modal" style="background-color: #40e0d0"><b>제안하기</b></button>
	      </div>
	
	    </div>
	  </div>
	</div>



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
		window.open("popIntroduce?user_id="+user_id,"new","width=1250, height=1000, left="+ popupX +", top="+ popupY +", resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}	
	
	
	//포지션 제안 modal창 오픈
	function insertOffer(){
		
		
		$("#myModal").modal();
	}
	
</script>

</body>
</html>