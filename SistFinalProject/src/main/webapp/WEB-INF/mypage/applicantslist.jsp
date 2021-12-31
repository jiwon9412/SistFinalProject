<%@page import="data.controller.MypageController"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        <c:if test="${sessionScope.logintype=='user'}">
							<li class="mypage_category"><a class="nav-link" href="${root }/mypage/main">이력서 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/applications">지원 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/scraps">스크랩 공고</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updatpassform">회원정보 수정</a></li>
						</c:if>
						<c:if test="${sessionScope.logintype=='corp'}">
							<li class="mypage_category"><a class="nav-link" href="${root }/mypage/main">공고 관리</a></li>
	                        <li class="mypage_category active"><a class="nav-link" style="color: #40e0d0;" href="${root }/mypage/applicants">지원자 현황</a></li>
	                        <li class="mypage_category active"><a class="nav-link" href="${root }/mypage/updatpassform">기업정보 수정</a></li>
						</c:if>
                    </ul>
			</div>
		</div>
	</div>
</div>
<!-- 상단 바 끝-->

    <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                        <caption>총 지원자 수: ${applicantsCount}명 </caption>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>공고 제목</th>
                                    <th>접수기간</th>
                                    <th>모집인원</th>
                                    <th>지원자 수</th>
                                    <th>상세 보기</th>
                                </tr>
                            </thead>
							<tbody>
							<c:forEach items="${noticesdtolist}" var="list" varStatus="n">
								<tr>
									<td align="center">${n.count}</td>
									<td><a style="color: black;" href="../notices/detail?num=${list.num}">${list.subject}</a></td>
									<td style="font-size: 0.9em;">${list.period_start} ~ ${list.period_end}</td>
									<td align="center">${list.personnel}</td>
									<td align="center">${list.app_cnt}</td>
										
									<td>
										<input type="hidden" id="nonum" name="nonum" value="${list.num}">
										<button type="button" class="btn btn-primary" style="background-color: #40e0d0;
										border: 0px; border-radius: 20px; height: 40px; font-weight: bold;"
										data-toggle="modal" data-target="#exampleModal" data-notifyid="${list.num}"
										name="detail_button" id="detail_button" value="${list.num}" onclick="location.href='/mypage/applicants_list'">
										지원자 목록 보기</button>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">지원자 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					 <table class="table">
                        <caption>(공고제목)</caption>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>이름</th>
                                    <th>나이</th>
                                    <th>대학교(전공)</th>
                                    <th>경력</th>
                                </tr>
                            </thead>
							<tbody>
							<tr>
							<td>
							<c:out value="${param.nonum}"/>
							</td>
							</tr>
							<c:forEach items="${applicantsByCompany}" var="li" varStatus="i" >
							<c:set var='nnn' value='5'/>
							<c:set var="search" value="${requestScope['search']}"/>
								<%-- <c:if test="${fn.contains(li.notice_num, '15')}"> --%>
								<c:if test="${li.notice_num eq param.nonum}">
								<tr>
									<td align="center">${i.count}</td>
									<td><a style="color: black;" href="#">${li.notice_num}</a></td>
									<td>${li.user_id} </td>
									<td align="center"></td>
									<td align="center"></td>
								</tr>
								</c:if>
							</c:forEach>
							</tbody>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="background-color: #40e0d0;">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
    /* $("#detail_button").click(function() {
        var notice_num = $(this).val();
        //alert("num: "+notice_num);
        $("#nonum").val(notice_num);
        var nonum = $("#nonum").val();
        alert("nonum: "+nonum);
        
    });
     */

    $(document).ready(function() {     
        $('#exampleModal').on('show.bs.modal', function(event) {          
            var NOTIFYID = $(event.relatedTarget).data('notifyid');
            var not = parseInt(NOTIFYID);
            //alert(not);
            //alert("NOTIFYID: "+NOTIFYID);

            //var notice_num = $("#detail_button").val();
            //alert("num: "+notice_num);
           /*  $("#nonum").val(NOTIFYID);
            var nonum = $("#nonum").val(); */
            //alert("nonum: "+nonum);
            
			/* var nonum2 = $("#nonum2").val();
            alert("nonum2: "+nonum2); */
            /* var s = "";
			s += "<table class='table'>";
			s += "<caption>(공고제목)</caption>";
			s += "<thead>";
			s += "<tr>";
			s += "<th>No.</th>";
			s += "<th>이름</th>";
			s += "<th>나이</th>";
			s += "<th>대학교(전공)</th>";
			s += "<th>경력</th>";
			s += "</tr>";
			s += "</thead>";
			s += "<tbody class='applicant'>";
			s += "<c:forEach items='${applicantsByCompany}' var='li' varStatus='i'>";
			s += "<input type='hidden' id='nonum2' name='nonum2' value='${li.notice_num}'>";
			s += "<c:set var='nnn' value='${";
			s += not
			s += "}' />";
			s += "<c:if test='${fn.contains(li.notice_num,nnn)}'>";
			s += "<tr>";
			s += "<td align='center'>${i.count}</td>";
			s += "<td><a style='color: black;' href='#'>${li.notice_num}</a></td>";
			s += "<td>${li.user_id}</td>";
			s += "<td align='center'></td>";
			s += "<td align='center'></td>";
			s += "</tr>";
			s += "</c:if>";
			s += "</c:forEach>";
			s += "</tbody>";
			s += "</table>";
			$("div.modal-body").html(s); */
			});
		});
</script>
 
</body>
</html>