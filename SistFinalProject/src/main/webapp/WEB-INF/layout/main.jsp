<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->

<head>
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
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Notices CSS -->
    <link rel="stylesheet" href="css/mainnotices.css">
   <!-- Slide CSS -->
   <link rel="stylesheet" href="css/slidelist.css">
   <!-- Divs CSS -->
   <link rel="stylesheet" href="css/maindiv.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    

</head>
<c:set var="myid" value="${sessionScope.myid }"/>
<c:set var="logintype" value="${sessionScope.logintype }"/>



<body>

    
    <!-- End Main Top -->

    

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides" style="height: 500px;">
        <ul class="slides-container">
            <li class="text-left">
                <img src="images/mainSlideImg3.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Job히다</strong></h1>
                            <p class="m-b-40">We light up your future.<br> Our site will be your lighthouse. We cheer for your future.</p>
                            <p><a class="btn hvr-hover" href="/notices/main" style="border: 2px solid #98ebe2">채용공고 보러가기</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/mainSlideImg2.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Job히다</strong></h1>
                            <p class="m-b-40">We light up your future. <br> Our site will be your lighthouse. We cheer for your future.</p>
                            <p><a class="btn hvr-hover" href="/companies/main" style="border: 2px solid #98ebe2">기업 탐색하기</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="images/mainSlideImg4.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Job히다</strong></h1>
                            <p class="m-b-40">We light up your future. <br> Our site will be your lighthouse. We cheer for your future.</p>
                            <p><a class="btn hvr-hover" href="/contents/main" style="border: 2px solid #98ebe2">취뽀 꿀팁이 궁금하다면?</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->

<!-- Start Search -->
<form action="notices/searchlist" method="get">
   <div class="container" style="margin-top: 30px;">
      <input type="text" name="search" style="position: relative; outline:none; vertical-align: middle;
      border: 2px solid #40e0d0; border-radius: 50px; width: 950px; height: 60px; font-size: 15pt; 
      padding-left: 30px;" placeholder="기업과 직무, 위치를 입력해 보세요">
        <button type="submit" id="searchgo" style="outline: none; float: right; position: absolute; 
        margin-left: 10px; background-color: #40e0d0; width: 60px; height: 60px; border: none; 
        border-radius: 80px; color: white;">
           <i class="fa fa-search" style="display: inline; font-size: 20pt;"></i>
        </button>
    </div>
</form>
<!-- End Search -->

<!-- Start Slide Notice List -->
  <div class="slide_title">
    <b style="font-size: 18px; color: black">마감 임박 공고</b>
    <a href="notices/appcntlist" style="float: right; "><b>더보기</b></a>
  </div>
  <div style="position: relative;">
  <div class="pre_wrap">
     <span class="glyphicon glyphicon-chevron-left pre1"></span>
  </div>
  <div class="slide_wrapper">
  
    <ul class="slides1">
      
      <c:forEach var="ddto" items="${dlist }" varStatus="i" end="7">
         <li>
         <div class="notice">
      <div class="godetail" num=${ddto.num }>
        <div class="logo">
          <img alt="" src="../images/${ddto.photo }">
          
        </div>
        <div class="cinfo">
          <b style="font-size: 15px;">${ddto.name }</b> <br>
          ${ddto.subject }<br><br>
          <button class="type"><b>${ddto.type }</b></button>
          <button class="loc"><b>${ddto.location }</b></button>
          <button class="perso"><b>${ddto.personnel }명</b></button>
        </div>
        
          
       
        </div>
        
        <div class="period">
          <hr style="margin-bottom: 5px;">
          <b style="color: gray; ">${ddto.period_start } ~ ${ddto.period_end }</b>
        
          
          <c:if test="${ddto.check==0 }">
          <span class="glyphicon glyphicon-heart-empty scrap" 
          style="margin-left: 25px; font-size: 20px; color: gray; cursor: pointer;" 
          num="${ddto.num }" userId="${myid }" logintype="${logintype }"></span>
          </c:if>
          
          <c:if test="${ddto.check==1 }">
          <span class="glyphicon glyphicon-heart scrapdel" 
          style="margin-left: 25px; font-size: 20px; color: red; cursor: pointer;" 
          num="${ddto.num }" userId="${myid }" logintype="${logintype }"></span>
          </c:if>
        </div>
      </div>
        </li>
      
      </c:forEach>
      
    </ul>
    
    
  
  </div>
  <div class="next_wrap">
     <span class="glyphicon glyphicon-chevron-right next1"></span>
  </div>
  </div>
  
 
  
  <hr width="1100px" align="center" style="margin-top: 30px;">
  
  
  <div class="slide_title">
    <b style="font-size: 18px; color: black">지원자가 많은 공고</b>
    <a href="notices/appcntlist" style="float: right; "><b>더보기</b></a>
  </div>
  <div style="position: relative;">
  <div class="pre_wrap">
     <span class="glyphicon glyphicon-chevron-left pre"></span>
  </div>
  <div class="slide_wrapper">
  
    <ul class="slides">
      
      <c:forEach var="appdto" items="${applist }" varStatus="i" end="7">
         <li>
         <div class="notice">
      <div class="godetail" num=${appdto.num }>
        <div class="logo">
          <img alt="" src="../images/${appdto.photo }">
          
        </div>
        <div class="cinfo">
          <b style="font-size: 15px;">${appdto.name }</b> <br>
          ${appdto.subject }<br><br>
          <button class="type"><b>${appdto.type }</b></button>
          <button class="loc"><b>${appdto.location }</b></button>
          <button class="perso"><b>${appdto.personnel }명</b></button>
        </div>
        
          
       
        </div>
        
        <div class="period">
          <hr style="margin-bottom: 5px;">
          <b style="color: gray; ">${appdto.period_start } ~ ${appdto.period_end }</b>
        
          
          <c:if test="${appdto.check==0 }">
          <span class="glyphicon glyphicon-heart-empty scrap" 
          style="margin-left: 25px; font-size: 20px; color: gray; cursor: pointer;" 
          num="${appdto.num }" userId="${myid }" logintype="${logintype }"></span>
          </c:if>
          
          <c:if test="${appdto.check==1 }">
          <span class="glyphicon glyphicon-heart scrapdel" 
          style="margin-left: 25px; font-size: 20px; color: red; cursor: pointer;" 
          num="${appdto.num }" userId="${myid }" logintype="${logintype }"></span>
          </c:if>
        </div>
      </div>
        </li>
      
      </c:forEach>
      
    </ul>
    
    
  
  </div>
  <div class="next_wrap">
     <span class="glyphicon glyphicon-chevron-right next"></span>
  </div>
  </div>
  <!-- End Slide Notice List -->
  <hr width="1100px" align="center" style="margin-top: 30px;">
  <!-- Start Slide Company List -->
  <div class="slide_title">
    <b style="font-size: 18px; color: black">채용중인 기업</b>
    <a href="companies/main" style="float: right; "><b>더보기</b></a>
  </div>
  <div style="position: relative; height: 320px;">
  <div class="pre_wrap">
     <span class="glyphicon glyphicon-chevron-left pre2"></span>
  </div>
  <div class="slide_wrapper" style="margin-top: 20px;">
  
    <ul class="slides2">
      
      <c:forEach var="comdto" items="${comlist }" varStatus="i" end="7">
         <li>
            <div class="companies" id=${comdto.id}>
            <div class="pic">
               <img alt="" src="../images/${comdto.logo}">
            </div>
            <hr id="comhr">
            <div class="txt">
               <p style="color: #80cbc4">${comdto.major}</p>
               <p style="font-weight: bold;">${comdto.name}</p>
               <p>${comdto.addr}</p>
            </div>
         </div>
        </li>
      
      </c:forEach>
      
    </ul>
    
    
  
  </div>
  <div class="next_wrap">
     <span class="glyphicon glyphicon-chevron-right next2"></span>
  </div>
  </div>
  
<!-- End Slide Company List -->
  
  
  <!-- Start Contents Div -->
  <div class="contents_wrap form-inline">
     <div class="intro">
        <h2><b>취준생에게 필요한 커리어 정보</b></h2>
        <br>
        <b>취업에 필요한 정보가 필요하세요?<br>
        Job히다 에서 제공하는 다양한 커리어 팁과
        취준생들을 위한 꿀 영상들!! 콘텐츠에서 확인하세요!<br><br>
        <button style="background-color: #40e0d0; border: solid 1px white; border-radius: 15px;
      color: white; width: 160px; height: 40px; font-size: 0.9em" onclick="location.href='contents/main'"
      ><b>콘텐츠 바로가기</b></button>
        </b>
     </div>
     <div class="imgs">
     <img alt="" src="images/maincontents11.png" style="width: 400px;">
     </div>
     
  </div>
  <!-- End Contents Div -->
  
 
  
<!-- Start Position Div -->
   <div class="position_wrap form-inline">
   <div class="imgs">
     <img alt="" src="images/mainposition11.png" style="width: 340px;">
     </div>
     <div class="intro1">
        <h2><b>포지션 제안 확인</b></h2>
        <br>
        <b>기업으로 부터 제안을 받고 싶으신가요?<br>
        원하는 지원자에게 포지션 제안을 보내고 싶나요?<br>
        Job히다의 유용한 시스템! 포지션 제안을 이용하세요!!<br><br>
        <button style="background-color: #40e0d0; border: solid 1px white; border-radius: 15px;
      color: white; width: 190px; height: 40px; font-size: 0.9em" onclick="location.href='position/main'"
      ><b>포지션 제안 바로가기</b></button>
        </b>
     </div>
     
     
  </div>
<!-- End Position Div -->  
  
  <div style="height: 10px;">
  
  </div>
  

  

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

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
   <script type="text/javascript">

$(document).on('click','span.scrap',function(){
   
   var tag = $(this);
   var user_id = $(this).attr("userId");
   var notice_num = $(this).attr("num");
   var logintype = $(this).attr("logintype");
   //alert(user_id+","+notice_num);
   
   
   if(${sessionScope.loginok==null}){
       alert("로그인이 필요한 서비스입니다");
       location.href='/login/main';
       return;
   }else if(logintype=="corp"){
      alert("개인 회원만 이용 가능한 서비스입니다");
      return;
   }else{
      $.ajax({
         
         type: "get",
         url: "notices/insertscrap",
         data: {"user_id":user_id,"notice_num":notice_num},
         success: function(data){
            
            //ajax로 스크랩이 되면서 success에서 이거 실행하기
            tag.attr("class","glyphicon glyphicon-heart scrapdel");
            tag.css("color","red");
               
            
         }
         
      });
   }
   
   
   
   

});

$(document).on('click','span.scrapdel',function(){
   var tag = $(this);
   var user_id = $(this).attr("userId");
   var notice_num = $(this).attr("num");
   
   $.ajax({
      
      type: "get",
      url: "notices/deletetscrap",
      data: {"user_id":user_id,"notice_num":notice_num},
      success: function(data){
         
         //ajax로 스크랩이 삭제되면서 success에서 이거 실행하기
         tag.attr("class","glyphicon glyphicon-heart-empty scrap");
         tag.css("color","gray");
            
         
      }
      
   });
   
   

});

$("#btntype").click(function(){
   
   var idx = $("#seltype option").index($("#seltype option:selected"));
   if(idx==0){
      location.href='main';
      return;
   }else{
      var hireType=$("#seltype option:selected").text();
      location.href='notices/typelist?type='+hireType;
      return;
   }
   
   
   
   //alert(hireType);

});

$("div.godetail").click(function(){
   
   var num = $(this).attr("num");
   
   location.href="notices/detail?num="+num;
});

var slides = document.querySelector('.slides');
var slide = document.querySelectorAll('.slides li');
var currentIdx = 0;
var slideCount = slide.length;
var slideWidth = 250;
var slideMargin = 30;

slides.style.width = (slideWidth+slideMargin)*slideCount - slideMargin + 'px';

function moveSlide(num){
     slides.style.left = - 280*num + 'px';
     currentIdx = num;
}  

$("span.next").click(function(){
     if(currentIdx < slideCount-4){
        
        moveSlide(currentIdx+1); 
     }else{
        moveSlide(0);
     }
     
});

$("span.pre").click(function(){
     if(currentIdx > 0){
        moveSlide(currentIdx-1); 
     }else{
        moveSlide(slideCount-4);
     }
     
});

var slides1 = document.querySelector('.slides1');
var slide1 = document.querySelectorAll('.slides1 li');
var currentIdx1 = 0;
var slideCount1 = slide1.length;
var slideWidth1 = 250;
var slideMargin1 = 30;

slides1.style.width = (slideWidth1+slideMargin1)*slideCount1 - slideMargin1 + 'px';

function moveSlide1(num){
     slides1.style.left = - 280*num + 'px';
     currentIdx1 = num;
}  

$("span.next1").click(function(){
     if(currentIdx1 < slideCount1-4){
        
        moveSlide1(currentIdx1+1); 
     }else{
        moveSlide1(0);
     }
     
});

$("span.pre1").click(function(){
     if(currentIdx1 > 0){
        moveSlide1(currentIdx1-1); 
     }else{
        moveSlide1(slideCount1-4);
     }
     
});

var slides2 = document.querySelector('.slides2');
var slide2 = document.querySelectorAll('.slides2 li');
var currentIdx2 = 0;
var slideCount2 = slide2.length;
var slideWidth2 = 300;
var slideMargin2 = 95;

slides2.style.width = (slideWidth2+slideMargin2)*slideCount2 - slideMargin2 + 'px';

function moveSlide2(num){
     slides2.style.left = - 395*num + 'px';
     currentIdx2 = num;
}  

$("span.next2").click(function(){
     if(currentIdx2 < slideCount2-4){
        
        moveSlide2(currentIdx2+1); 
     }else{
        moveSlide2(0);
     }
     
});

$("span.pre2").click(function(){
     if(currentIdx2 > 0){
        moveSlide2(currentIdx2-1); 
     }else{
        moveSlide2(slideCount2-4);
     }
     
});

$("div.companies").click(function(){
   
   var id = $(this).attr("id");
   
   location.href="companies/detail?id="+id;
});
</script>
</body>

</html>