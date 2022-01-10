<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="../css/potision.css">

<style type="text/css">

span.content, #list_company_name{
	cursor: pointer;
}

</style>

<title>Insert title here</title>
</head>
<body>

	<!-- 로그인 안됐을 경우 컨트롤러에서 login으로 이동-->
	
	<!-- 개인회원 로그인했을 경우 -->

    <!-- 상단 타이틀 시작 -->
    <div class="potision-top-box" id="suggestion">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>포지션 제안</h2>
                    <h4>기업에서 도착한 제안을 확인할 수 있습니다</h4>
                </div>
            </div>
        </div>
    </div>
    <!-- 상단 타이틀 끝 -->
    
	
	<!-- 도착한 Offer 갯수 -->
	<br>
	
	<div class="suggestion">
         <div class="title-left">
             <h3 style="display: inline;">포지션 제안</h3>
             
             <c:if test="${totalPosition>0}">
             	<h5 id="totPo"><b>총 ${totalPosition}건의 제안이 도착했습니다</b></h5>
             </c:if>

             <!-- 포지션 제안받기 버튼: 나중에 default값 주고 window함수로 자동 클릭시켜야 할듯 -->             
	         <h4 style="display: inline; margin-left: 50%;"><b>포지션 제안 받기</b></h4>
	          
             <label style="float: right;" class="switch-button">
	            <input type="checkbox">
	            <span class="onoff-switch"></span>
             </label>
         </div>
         
        <!-- 총갯수에 따른 변화 -->
		<table id="position-table" style="border-top: #00e1ff">
			<tr bgcolor="#40e0d0">
				<th width="100"><center>회사명</center></th>
				<th width="200"><center>업종</center></th>
				<th width="350"><center>제안</center></th>
				<th width="30"><center>관리</center></th>				
			</tr>
			
			 <!-- 받은 제안이 0개일때 -->
	         <c:if test="${totalPosition==0}">
				<tr height="50">
					<td colspan="4" align="center">
						<h4><b>도착한 제안이 없습니다</b></h4>
					</td>
				</tr>
			</c:if>
			
		<!-- 받은 제안이 존재할때 -->
		<c:if test="${totalPosition>0}">
			<c:forEach var="list" items="${list}">
				<tr align="center">
					<td><b id="list_company_name" onclick="location.href='../companies/detail?id=${list.company_id}'">${list.name}</b></td>
					<td>${list.major}</td>
					<td><span class="content" notice_num = "${list.notice_num }" content = "${list.content }" company_name = "${list.name }" logo = "${list.logo }">${list.content}</span></td>
					<td>
						<button type="button" class="btn btn-default btndel" style="width: 100px;" 
						company_id="${list.company_id}">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>	
		</table>
	</div>



    <!-- 이런 제안은 어떠신가요?  -->	
    <div style="margin-top: 100px;">
         <div class="title-left suggestion">
             <h3 style="margin-bottom: 5px;">이런 기업은 어떠세요?</h3>
         </div>
         
         <div class="container">
            <div class="my-account-page">
                <div class="row">
                	<!-- 회사정보 반복해서 뿌려주기 -->
	                    <div class="wrapper">
							<table style="width: 130%; margin-left: 3%;">
								<tr>
									<c:forEach var="dto" items="${list2}" varStatus="i" begin="0" end="5">
										<td>
											<div class="companies" id=${dto.id} onclick="location.href='../companies/detail?id=${dto.id}'">
												<div class="pic">
													<img alt="" src="../images/${dto.logo}">
												</div>
												
												<hr>
												
												<div class="txt">
													<p>${dto.major}</p>
												
														<p style="font-weight: bold;">${dto.name}</p>
														<p>${dto.addr}</p>
												</div>
											</div>
										</td>
									<c:if test="${i.count%3==0 }">
										</tr>
										<tr>
									</c:if>
								</c:forEach>
							</tr>	
						</table>	
					</div>  
                </div>
            </div>
            </div>
        </div>
    </div>
    
    

    	
    
    <div class="how-about">
        <div class="container">
          <h4><b>더 둘러보기</b></h4>
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../notices/main"> <i class="fa fa-gift"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>채용공고</h4>
                                    <p><b>선물같은 구직소식이 한가득</b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../mypage/main"><i class="fa fa-lock"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>마이페이지</h4>
                                    <p><b>이력서 수정하고 경쟁력높이기</b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../contents/main"> <i class="fa fa-location-arrow"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>콘텐츠</h4>
                                    <p><b>취업을 위해서 가장 내게 필요한 것은?</b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <!-- End My Account -->



    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
    
    
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
	        
	        <button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
	      </div>
	
	    </div>
	  </div>
	</div>
    
    
    <script type="text/javascript">
	//댓글 삭제
	$("button.btndel").click(function(){
		
		//삭제 버튼에 id값을 넣어놓는다.
		var company_id= $(this).attr("company_id");
		
		console.log(company_id);

		
		//Ajax로 비동기 삭제처리
		$.ajax({
			
			type:"get",
			url:"delete",
			data : {"company_id" : company_id},
			success:function(){		
				 location.reload();
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);   
		    }
		});
	});
    
	
	//모달 나오게 하기
	$("span.content").click(function(){
		
		var company_id = $(this).attr("company_id");
		var user_id = $(this).attr("myid");
		var content = $(this).attr("content");
		var company_name = $(this).attr("company_name");
		var logo = $(this).attr("logo");
		$("#offer_subject").html("<span style='font-size:1.5em; display:inline;'><b>" + company_name + "</b><img src='../images/"+logo+"' style='width:100px; display:inline; float:right;'><br></span>");
		
		var s = "";
		s += "<span>"+content+"</span>";
		$("#modal-body").html(s);
		
		var notice_num = $(this).attr("notice_num");
		/* alert(notice_num); */
		
		
		
	/* 	$.ajax({
			type: "get",
			dataType: "json",
			url: "getOffer",
			data: {"user_id":user_id, "company_id":company_id},
			success:function(data) {
				$("#offercontent").val(data.content);
				$.each(data, function (index, item) {
					
				});
			}
		}); */
		$("#myModal").modal();
	});
		
    </script>
</body>
</html>