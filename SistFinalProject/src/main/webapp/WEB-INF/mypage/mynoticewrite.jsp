<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="<%=request.getContextPath() %>" />
<c:set var="loginok" value="${sessionScope.loginok }" />
<c:set var="myid" value="${sessionScope.myid }" />
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap"
rel="stylesheet">

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="${root }/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="${root }/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="${root }/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${root }/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${root }/css/custom.css">
    
<script type="text/javascript">
	
$(function(){
	$("span.photo").click(function(){
		$("#photoo").trigger("click");
	});
	$("small.photo").click(function(){
		$("#photoo").trigger("click");
	});
	
	$('#photoo').change(function(){
		setImageFromFile(this, '#photoo_preview');
		});
		 
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0])
	    {
	        var reader = new FileReader();
	 
	            reader.onload = function (e) {
	                $(expression).attr('src', e.target.result);
	           }
	           reader.readAsDataURL(input.files[0]);
	     }
	}
});
</script>

<style type="text/css">
.resume_mini_title {
	color: #40e0d0;
}

.resume_table tr{
	height: 35px;
}
ul.mypage_category {
　　　list-style-type: none;
	text-align: center;
}

li.mypage_category {
	display: inline-block;
	font-weight: bold;
}
a.nav-link{
	color: white;	
}
small.photo, span.photo{
	cursor: pointer;
}
</style>

<title>Insert title here</title>
</head>
<body>
<!-- 상단 바 -->
<div class="mypage-top-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>마이페이지</h2>
                    <ul class="mypage_category">
                        <c:if test="${sessionScope.logintype=='user'}">
							<li class="mypage_category"><a class="nav-link" href="${root }/mypage/main">이력서 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/applications">지원 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/scraps">스크랩 공고</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updatpassform">회원정보 수정</a></li>
						</c:if>
						<c:if test="${sessionScope.logintype=='corp'}">
							<li class="mypage_category"><a class="nav-link" style="color: #40e0d0;" href="${root }/mypage/main">공고 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/applicants">지원자 현황</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updatpassform">기업정보 수정</a></li>
						</c:if>
                    </ul>
			</div>
		</div>
	</div>
</div>
<!-- 상단 바 끝-->
	
	<!-- 작성/수정 페이지 구분 위해 표시 -->
    <!-- <div style=" position: absolute; left: 50%; width: 300px; margin-left: -150px; text-align: center;">
    	<h4>공고 작성</h4>
    </div> -->
    
    <div class="cart-box-main">
    	<form action="notice_insert" method="post">
        <div class="container">
            <div class="row new-account-login">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3 class="resume_mini_title">지원분야</h3>
                    </div>
						<div class="row">
                                <div style="width: 100%; margin-left: 20px; margin-right: 20px;">
                                    <label for="subject">공고제목</label>
                                    <input type="text" class="form-control" id="subject" name="subject" placeholder="공고제목" value="">
                                </div>
                                <div style="width: 100%; margin-left: 20px; margin-right: 20px; margin-top: 30px;">
                                    <label for="section">모집부문</label>
                                    <input type="text" class="form-control" id="section" name="section" placeholder="모집부문" value="">
                                </div>
                                <div style="width: 28.6%; margin-left: 20px; margin-right: 20px; margin-top: 30px;">
                                    <label for="type">고용형태 *</label>
                                    <select class="form-control" id="type" name="type" style="height: 34px;">
										<option value="" selected disabled hidden>고용형태</option>
										<option value="경력">경력</option>
										<option value="신입">신입</option>
										<option value="무관">무관</option>
										<option value="인턴">인턴</option>
									</select>
                                </div>
                                <div style="width: 28.6%; margin-right: 20px; margin-top: 30px;">
                                    <label for="type">지점 *</label>
                                    <input type="text" class="form-control" id="location" name="location" placeholder="지점" value="">
                                </div>
                                <div style="width: 28.6%; margin-right: 20px; margin-top: 30px;">
                                    <label for="personnel">모집인원 *</label>
                                    <input type="text" class="form-control" id="personnel" name="personnel" placeholder="모집인원" value="">
                                </div>
						</div>
                </div>
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">지원서 접수</h3>
						</div>
						<div class="row">
                                <div style="width: 30%; margin-left: 20px; margin-right: 15px;">
                                    <label for="period_start">접수 시작일 *</label>
                                    <input type="text" class="form-control" id="period_start" name="period_start" placeholder="시작" value=""
                                    onfocus="(this.type='date')">
                                </div>
                                <div style="width: 5%; margin-top: 30px;">
                                    <span style="font-size: 20px;">~</span>
                                </div>
                                <div style="width: 30%; margin-left: 2px; margin-right: 20px;">
                                    <label for="period_end">접수 종료일 *</label>
                                    <input type="text" class="form-control" id="period_end" name="period_end" placeholder="종료" value=""
                                    onfocus="(this.type='date')">
                                </div>
						</div>
					</div>
				</div>
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3 class="resume_mini_title">지원자격</h3>
                        </div>
						<div class="row">
							<div>
                                <div style="width:530px; margin-left: 20px; margin-right: 20px;" id="plus_qualification">
								<label for="qualification">지원자격을 작성해주세요.</label>
									<input type="text" class="form-control" id="qualification" name="qualification"
									style="margin-top: 15px;" placeholder="지원자격" value="">
									<!-- <input type='text' class='form-control' id='qualification' name='qualification1' style='margin-top: 15px;' placeholder='지원자격' value=''> -->
                                </div>
                            </div>
							<button type="button" id="btnPlusQualification" style="border: 0; background-color: transparent;">
								<span class="glyphicon glyphicon-plus-sign" style="font-size:40px; color: #40e0d0;
								margin-top: 20px; margin-left: 235px;"></span>
							</button>
							
							<div>
                                <div style="width:530px; margin-left: 20px; margin-right: 20px; margin-top: 40px;" id="plus_preference">
								<label for="preference">우대사항을 작성해주세요.</label>
									<input type="text" class="form-control" id="preference" name="preference"
									style="margin-top: 15px;" placeholder="우대사항" value="">
									<!-- <input type='text' class='form-control' id='preference' name='preference1' style='margin-top: 15px;' placeholder='우대사항' value=''> -->
                                </div>
                            </div>
							<button type="button" id="btnPlusPreference" style="border: 0; background-color: transparent;">
								<span class="glyphicon glyphicon-plus-sign" style="font-size:40px; color: #40e0d0;
								margin-top: 20px; margin-left: 235px;"></span>
							</button>
						</div>
                    </div>
                </div>
                
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">업무내용</h3>
						</div>
						<div class="row">
                                <div style="width:530px; margin-left: 20px; margin-right: 20px;" id="plus_task">
								<label for="task">업무내용을 작성해주세요.</label>
									<input type="text" class="form-control" id="task" name="task" style="margin-top: 15px;" placeholder="업무내용" value="">
									<!-- <input type='text' class='form-control' id='task1' name='task1' style='margin-top: 15px;' placeholder='업무내용' value=''> -->
                                </div>
						</div>
						<button type="button" id="btnPlusTask" style="border: 0; background-color: transparent;">
							<span class="glyphicon glyphicon-plus-sign" style="font-size:40px; color: #40e0d0;
							margin-top: 20px; margin-left: 235px;"></span>
						</button>
                        <button type="submit" class="btn btn-primary" style="background-color: #40e0d0; border: 0px;
                        border-radius: 20px; width: 110px; height: 50px; font-weight: bold; margin-left: 450px;
                        margin-top: 60px;">공고 추가</button>
					</div>
					
            </div>

        </div>
        </form>
    </div>

<script type='text/javascript'>
      $('#btnPlusQualification').click(function() {
    	  $('#plus_qualification').append("<input type='text' class='form-control' id='qualification' name='qualification' style='margin-top: 15px;' placeholder='지원자격' value=''>")
      });
      
      $('#btnPlusPreference').click(function() {	    
		  $('#plus_preference').append("<input type='text' class='form-control' id='preference' name='preference' style='margin-top: 15px;' placeholder='우대사항' value=''>")
      });
  
      $('#btnPlusTask').click(function() {
		  $('#plus_task').append("<input type='text' class='form-control' id='task' name='task' style='margin-top: 15px;' placeholder='업무내용' value=''>")
      });
</script>
</body>
</html>