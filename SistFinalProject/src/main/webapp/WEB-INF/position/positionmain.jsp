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

<title>Insert title here</title>
</head>
<body>

	<!-- 로그인 안됐을 경우 컨트롤러에서 login으로 이동-->
	
	<!-- 개인회원 로그인했을 경우 -->

    <!-- 상단 타이틀 시작 -->
    <div class="potision-top-box">
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
	<div class="suggestion">
         <div class="title-left">
             <h3 style="display: inline;">포지션 제안</h3>
             <c:if test="${totalPosition>0}">
             	<h5 id="totPo"><b>총 ${totalPosition}건의 제안이 도착했습니다</b></h5>
             </c:if>
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
					<td><b>${list.name}</b></td>
					<td>${list.major}</td>
					<td>${list.content}</td>
					<td>
						<button type="button" class="btn btn-default" style="width: 100px;"
						onclick="location.href='#'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>	
		</table>
	</div>


    <!-- Start My Account  -->	
    <div class="my-account-box-main">
        <div class="container">
            <div class="my-account-page">
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fa fa-gift"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Your Orders</h4>
                                    <p>Track, return, or buy things again</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"><i class="fa fa-lock"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Login &amp; security</h4>
                                    <p>Edit login, name, and mobile number</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fa fa-location-arrow"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Your Addresses</h4>
                                    <p>Edit addresses for orders and gifts</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fa fa-credit-card"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Payment options</h4>
                                    <p>Edit or add payment methods</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fab fa-paypal"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>PayPal</h4>
                                    <p>View benefits and payment settings</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fab fa-amazon"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Amazon Pay balance</h4>
                                    <p>Add money to your balance</p>
                                </div>
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
</body>
</html>