<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="<%=request.getServletPath() %>" />
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/notices.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.notice{
	border-radius: 20px;
	border: solid 1px gray;
	width: 250px;
	height: 400px;
	cursor: pointer;
	margin-top: 30px;
	
	
}
div.logo>img{
	border-radius: 20px 20px 0px 0px;
	width: 250px;
	height: 200px; 	
}

div.cinfo{
	padding-top: 20px;
	padding-left: 20px;
	text-align: left;
	height: 140px;
}

div.period{
	padding-left: 20px;
}

button{
	border: solid 1px white;
	border-radius: 20px;
	font-size: 0.9em;
	width: 60px;
	height: 30px;
	
}

button.type{
	background-color: #6495ed     ;
	color: #0000cd  ;
}

button.loc{
	background-color: #fffacd    ;
	color: #deb887   ;
}

button.qual{
	background-color: #98fb98   ;
	color: #008080   ;
}

table{
	margin: 0 auto;
	
}


div.noticewrap{
	margin-top: 30px;
}

select option{
	
	font-size: 16px;
	/* font-weight: bolder;
	color: #40e0d0;  */
	/* font-family: Gamja Flower; */
}

/* a.hover{
	color: black;
	text-decoration: none;
}
a:link {
	color: gray;
    text-decoration: none;
} */

/* a:visited {
    text-decoration: none;
}

a:active {
    text-decoration: none;
} */

</style>
<title>Insert title here</title>
</head>
<c:set var="myid" value="${sessionScope.myid }"/>
<body>
<div class="noticewrap">
<!-- 상단 타이틀 시작 -->
    <div class="notices-top-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>채용 공고</h2>
                    <h4>다양한 채용 공고를 보며 원하는 회사에 지원할 수 있습니다.</h4>
                </div>
            </div>
        </div>
    </div>
    <!-- 상단 타이틀 끝 -->

<table style="width: 1300px;">
<caption class="form-inline">
<select class="form-control" style="width: 160px; height: 30px;" id="seltype">
	<option value="전체">고용선택 전체</option>
	<option value="신입">신입</option>
	<option value="경력">경력</option>
	<option value="인턴">인턴</option>
	<option value="무관">무관</option>
</select> 
&nbsp;&nbsp;&nbsp;
<button style="background-color: white; border: solid 1px #ddd; border-radius: 20px;
 width: 60px; height: 35px; font-size: 0.8em; color: gray;" id="btntype"><b>검색</b></button>
</caption>
  <tr>
  <c:if test="${totalCount==0 }">
  
    <td align="center">
      <h2><b>해당 채용 공고가 존재하지 않습니다</b></h2>
      <h4>다른 고용 형태를 검색해보세요</h4>
      <div style="border: 1px solid white; height: 300px;">
      
      </div>
      
    </td>
  
  </c:if>
  <c:if test="${totalCount>0 }">
  <c:forEach var="ndto" items="${list }" varStatus="i">
  
    <td>
		<div class="notice" num=${ndto.num }>
		  <div class="logo">
		    <img alt="" src="../images/${ndto.photo }">
		    
		  </div>
		  <div class="cinfo">
		    <b style="font-size: 1.1em;">${ndto.company_id }</b> <br>
		    ${ndto.subject }<br><br>
		    <button class="type"><b>${ndto.type }</b></button>
		    <button class="loc"><b>${ndto.location }</b></button>
		    <button class="qual"><b>${ndto.personnel }명</b></button>
		    
		  </div>
		  <div class="period">
		    <hr style="margin-bottom: 5px;">
		    <b style="color: gray; ">${ndto.period_start } ~ ${ndto.period_end }</b>
		  
		    
		    <c:if test="${ndto.check==0 }">
		    <span class="glyphicon glyphicon-heart-empty scrap" 
		    style="margin-left: 25px; font-size: 20px; color: gray;" 
		    num="${ndto.num }" userId="${myid }"></span>
		    </c:if>
		    
		    <c:if test="${ndto.check==1 }">
		    <span class="glyphicon glyphicon-heart scrapdel" 
		    style="margin-left: 25px; font-size: 20px; color: red;" 
		    num="${ndto.num }" userId="${myid }"></span>
		    </c:if>
		  </div>
		</div>
    </td>
    <c:if test="${i.count%4==0 }">
    </tr>
    <tr>
    </c:if>
    </c:forEach>
    </c:if>
    
  </tr>
</table>

<!-- 페이징 처리 -->

  <c:if test="${totalCount>0 }">
    <div style="width: 800px; text-align: center; margin: 0 auto;">
      <ul class="pagination">
      
      <!-- 이전 -->
      <c:if test="${startPage>1 }">
        <li><a href="main?currentPage=${startPage-1 }">이전</a></li>
      </c:if>
      
        <c:forEach var="pp" begin="${startPage }" end="${endPage }">
          <c:if test="${currentPage==pp }">
            <li><a href="main?currentPage=${pp}" 
            style="color: black; text-decoration: none; font-weight: bold;">${pp }</a></li>
          </c:if>
           <c:if test="${currentPage!=pp }">
            <li><a href="main?currentPage=${pp}" 
            style="color: gray; text-decoration: none;">${pp }</a></li>
          </c:if>
        </c:forEach>
        
        <!-- 다음 -->
        <c:if test="${endPage<totalPage }">
        <li><a href="main?currentPage=${endPage+1 }">다음</a></li>
      </c:if>
      
      </ul>
    
    </div>
  </c:if>

</div>



<script type="text/javascript">

$(document).on('click','span.scrap',function(){
	
	var tag = $(this);
	var user_id = $(this).attr("userId");
	var notice_num = $(this).attr("num");
	//alert(user_id+","+notice_num);
	
	if(${sessionScope.myid==null}){
		 alert("로그인이 필요한 서비스입니다");
		 location.href='/login/main';
		 return;
	}
	
	$.ajax({
		
		type: "get",
		url: "insertscrap",
		data: {"user_id":user_id,"notice_num":notice_num},
		success: function(data){
			
			//ajax로 스크랩이 되면서 success에서 이거 실행하기
			tag.attr("class","glyphicon glyphicon-heart scrapdel");
			tag.css("color","red");
				
			
		}
		
	});
	
	

});

$(document).on('click','span.scrapdel',function(){
	var tag = $(this);
	var user_id = $(this).attr("userId");
	var notice_num = $(this).attr("num");
	
	$.ajax({
		
		type: "get",
		url: "deletetscrap",
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
		location.href='typelist?type='+hireType;
		return;
	}
	
	
	
	//alert(hireType);

});

$("div.notice").click(function(){
	
	var num = $(this).attr("num");
	
	location.href="detail?num="+num;
});


</script>
</body>
</html>