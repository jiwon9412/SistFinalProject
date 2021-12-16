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
                        <%-- <c:if test="${sessionScope.logintype=='user'}"> --%>
							<li class="mypage_category"><a class="nav-link" style="color: #40e0d0;" href="${root }/mypage/main?user_id=${myid}&loginok=${loginok}">이력서 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/applications">지원 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/scraps">스크랩 공고</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updateuser">회원정보 수정</a></li>
						<%-- </c:if> --%>
						<c:if test="${sessionScope.logintype=='corp'}">
							<li class="mypage_category"><a class="nav-link" href="${root }/mypage/notice">공고 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/applicants">지원자 현황</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updatecompany">기업정보 수정</a></li>
						</c:if>
                    </ul>
			</div>
		</div>
	</div>
</div>
<!-- 상단 바 끝-->
	
	<!-- 수정 페이지 구분 위해 표시 -->
    <div style=" position: absolute; left: 50%; width: 300px; margin-left: -150px; text-align: center;">
    	<h4>이력서 수정</h4>
    </div>
    
    <!-- Start Cart  -->
    <div class="cart-box-main">
    	<form action="resume_insert" method="post" enctype="multipart/form-data">
        <div class="container">
            <div class="row new-account-login">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3 class="resume_mini_title">인적사항</h3>
                    </div>
                    <table style="border-collapse: collapse; margin-bottom: 50px;" class="resume_table">
						<tr>
							<th width="90">이름</th>
							<td width="310">홍길동</td>
							<td rowspan="5">
									<span class="glyphicon glyphicon-camera photo"></span>
								<div class="resumephoto" style="width: 120px; height: 160px; border: 1px solid lightgray;" >
									<input type="file" name="photoo" id="photoo" style="display: none;">
									<img alt="" src="" id="photoo_preview" style="width: 115px; height: 155px;">
								</div>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>1990.01.01.</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>여</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>010-1111-1111</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>example@gmail.com</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>user테이블에서 가져올것</td>
						</tr>
			
					</table>
                </div>
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">어학/자격증</h3>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="license">어학시험/자격증</label> <input type="text" class="form-control" id="license1"
								placeholder="어학시험/자격증 이름 입력" value="">
							</div>
							<div class="col-md-6 mb-3">
								<label for="license">급수/점수</label> <input type="text" class="form-control" id="license2"
								placeholder="급수/점수 입력" value="">
							</div>
							<div class="col-md-6 mb-3">
								<label for="license">취득월</label> <input type="text" class="form-control" id="license3"
								placeholder="취득월 입력" value="" onfocus="(this.type='month')" style="width: 100px;">
							</div>
						</div>
					</div>
				</div>
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3 class="resume_mini_title">학력/병역사항</h3>
                        </div>
                            <div class="row">
                                <div style="width: 180px; margin-left: 20px; margin-right: 20px;">
                                    <label for="highschool">고등학교 *</label>
                                    <input type="text" class="form-control" id="highschool1" placeholder="출신 고등학교 입력" value="">
                                </div>
                                    <!-- <label for="firstName">기간 *</label>
                                    <input type="text" class="form-control" id="highschool2" placeholder="입학" value=""
                                    onfocus="(this.type='month')" style="width: 100px;"> ~
                                    <input type="text" class="form-control" id="highschool3" placeholder="졸업" value=""
                                    onfocus="(this.type='month')" style="width: 100px;"> -->
                                    
                                <div style="width: 160px; margin-right: 10px;">
                                    <label for="highschool">입학 *</label>
                                    <input type="text" class="form-control" id="highschool2" placeholder="입학월" value=""
                                    onfocus="(this.type='month')">
                                </div>                                
                                <div style="width: 160px;">
                                    <label for="highschool">졸업 *</label>
                                    <input type="text" class="form-control" id="highschool3" placeholder="졸업월" value=""
                                    onfocus="(this.type='month')">
                                </div>
                                <div style="width: 180px; margin-left: 20px; margin-right: 20px; margin-top: 30px;">
                                    <label for="college">대학교 *</label>
                                    <input type="text" class="form-control" id="college1" placeholder="출신 대학교 입력"" value="">
                                </div>
                                <div style="width: 160px; margin-right: 10px; margin-top: 30px;">
                                    <label for="college">입학 *</label>
                                    <input type="text" class="form-control" id="college2" placeholder="입학월" value=""
                                    onfocus="(this.type='month')">
                                </div>
                                <div style="width: 160px; margin-top: 30px;">
                                    <label for="college">졸업(예정) *</label>
                                    <input type="text" class="form-control" id="college3" placeholder="졸업월" value=""
                                    onfocus="(this.type='month')">
                                </div>
                                <div style="margin-left: 20px; margin-right: 20px; margin-top: 30px;">
                                    <label for="military">병역 *</label>
                                    <select class="form-control" id="military" style="height: 30px;">
										<option value="" selected disabled hidden>병역사항</option>
										<option value="군필">군필</option>
										<option value="미필">미필</option>
										<option value="면제">면제</option>
										<option value="해당없음">해당없음</option>
									</select>
									<small class="text-muted">여성의 경우 '해당없음'을 선택해주세요.</small>
                                </div>
                            </div>
                    </div>
                </div>
                
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">대외활동</h3>
						</div>
						<div class="row">
                                <div style="width: 180px; margin-left: 20px; margin-right: 20px;">
                                    <label for="activity">대외활동명</label>
                                    <input type="text" class="form-control" id="activity1" placeholder="출신 대학교 입력"" value="">
                                </div>
                                <div style="width: 160px; margin-right: 10px;">
                                    <label for="activity">시작일</label>
                                    <input type="text" class="form-control" id="activity2" placeholder="입학월" value=""
                                    onfocus="(this.type='month')">
                                </div>
                                <div style="width: 160px;">
                                    <label for="activity">종료일</label>
                                    <input type="text" class="form-control" id="activity3" placeholder="졸업월" value=""
                                    onfocus="(this.type='month')">
                                </div>
						</div>
					</div>
					
					<div class="col-sm-6 col-lg-6 mb-3">
						<div class="title-left">
							<h3 class="resume_mini_title">경력</h3>
						</div>
						<div class="row">
                                <div style="width: 180px; margin-left: 20px; margin-right: 20px;">
                                    <label for="career">회사명</label>
                                    <input type="text" class="form-control" id="career1" placeholder="회사명" value="">
                                </div>
                                <div style="width: 160px;">
                                    <label for="career">부서명</label>
                                    <input type="text" class="form-control" id="career2" placeholder="부서명" value="">
                                </div>
                                <div style="width: 180px; margin-left: 20px; margin-right: 20px; margin-top: 30px;">
                                    <label for="career">직급/직책</label>
                                    <input type="text" class="form-control" id="career3" placeholder="직급/직책" value="">
                                </div>
                                <div style="width: 160px; margin-right: 10px; margin-top: 30px;">
                                    <label for="career">입사월</label>
                                    <input type="text" class="form-control" id="career4" placeholder="입사월" value=""
                                    onfocus="(this.type='month')">
                                </div>
                                <div style="width: 160px; margin-top: 30px;">
                                    <label for="career">퇴사월</label>
                                    <input type="text" class="form-control" id="career5" placeholder="퇴사월" value=""
                                    onfocus="(this.type='month')">
                                </div>
						</div>
					</div>
					
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3 class="resume_mini_title">자기소개서</h3>
                                </div>
                                <div class="rounded p-2 bg-light">
                                    <div class="media mb-2 border-bottom">
                                        <textarea class="form-control" style="height: 200px;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3 class="resume_mini_title">포트폴리오</h3>
                                </div>
                                <div class="mb-4">
                                	<input type="file" class="form-control" name="uploadportfolio" style="height: 40px;">
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary" style="background-color: #40e0d0; border: 0px;
                        border-radius: 20px; width: 110px; height: 50px; font-weight: bold; margin-left: 450px;
                        margin-top: 60px;">이력서 저장</button>
                    </div>
                </div>
            </div>

        </div>
        </form>
    </div>
    <!-- End Cart -->

    <!-- Start Instagram Feed  -->
    <!-- <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-01.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-02.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-03.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-04.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-06.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-07.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-08.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-09.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- End Instagram Feed  -->
<%-- 
	<form action="insert_resume" method="post" enctype="multipart/form-data">
		<h1 style="margin-top: 24px; margin-bottom: 24px; color: #40e0d0; font-weight: bold;">이력서 작성 및 수정</h1>
		<input type="text" name="subject" style="width: 700px;" class="form-control" required="required"
		autofocus="autofocus" placeholder="이력서 제목을 입력해주세요"><br>
		
		<table class="table table-bordered" style="width: 800px;">
			<caption>인적사항</caption>
			<tr>
				<th width="130" rowspan="4">프로필사진
					<div style="width: 120px; height: 160px; border: 1px solid gray;" >
						<input type="file" name="photos" id="photos"
							style="display: none;" multiple="multiple">&nbsp; <span
							class="glyphicon glyphicon-camera photo"></span>
					</div>
				</th>
			</tr>	
			<tr>
				<th width="70">이름</th>
				<td>홍길동</td>
				<th>생년월일</th>
				<td width="150">1990-01-01</td>
				<th width="50">성별</th>
				<td>여</td>
			</tr>
			<tr>
				<th width="100">연락처</th>
				<td>010-1111-1111</td>
				<th width="70">이메일</th>
				<td>example@gmail.com</td>
			</tr>

		</table>
		<button type="submit" class="btn btn-default" style="width: 100px;">등록</button>
		<button type="button" class="btn btn-default" style="width: 100px;"
		onclick="location.href='list'">목록</button>
	</form>


	<div style="width: 900px;">
		<h1 style="margin-top: 24px; margin-bottom: 24px; color: #40e0d0; font-weight: bold;">이력서 작성 및 수정</h1>

		<form accept-charset="UTF-8"
			action="https://getform.io/f/{your-form-endpoint-goes-here}"
			method="POST" enctype="multipart/form-data" target="_blank">

			<div class="form-group">
				<label for="exampleInputName">Full Name</label> <input type="text"
					name="fullname" class="form-control" id="exampleInputName"
					placeholder="Enter your name and surname" required="required">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <input
					type="email" name="email" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					placeholder="Enter your email address" required="required">
			</div>
			<div class="form-group">
				<label for="inputAddress">Address</label> <input type="text"
					name="address" class="form-control" id="inputAddress"
					placeholder="1234 Main St">
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">City</label> <input type="text" name="city"
						class="form-control" id="inputCity" placeholder="Istanbul">
				</div>
				<div class="form-group col-md-2">
					<label for="inputZip">Zip</label> <input type="text" name="zip"
						class="form-control" id="inputZip" placeholder="34000">
				</div>
			</div>
			<div class="form-group">
				<label for="example-tel-input" class="col-2 col-form-label">Telephone</label>
				<div class="col-10">
					<input class="form-control" name="tel" type="tel"
						id="example-tel-input">
				</div>
			</div>
			<div class="form-group">
				<label for="example-date-input" class="col-3 col-form-label">Start
					Date</label>
				<div class="col-10">
					<input class="form-control" name="starting_date" type="date"
						value="2020-02-01" id="example-date-input">
				</div>
			</div>
			<div class="form-group mt-3">
				<label class="mr-4">Upload your CV:</label> <input type="file"
					name="file">
			</div>
			<button type="submit" class="btn btn-primary"
				style="background-color: #40e0d0; border: 0px; border-radius: 20px; font-size: 0.9em; width: 100px; height: 40px;">이력서
				저장</button>

		</form>

	</div> --%>

</body>
</html>