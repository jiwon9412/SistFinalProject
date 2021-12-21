<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src = "https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<script type="text/javascript">

$(function () {
	
	//input file
	$("span.logofile").click(function () {
		
		$("#logofile").trigger("click");
	});
	$("span.photofile").click(function () {
		
		$("#photofile").trigger("click");
	});
	
	//4대보험 기존값 비교 후 체크
	var ins1 = document.getElementById("ins1").value;
	var insChk1 = document.getElementById("insChk1").value;
	var ins2 = document.getElementById("ins2").value;
	var insChk2 = document.getElementById("insChk2").value;
	var ins3 = document.getElementById("ins3").value;
	var insChk3 = document.getElementById("insChk3").value;
	var ins4 = document.getElementById("ins4").value;
	var insChk4 = document.getElementById("insChk4").value;
	
	if(ins1 == insChk1)
		$("input:checkbox[id='ins1']").prop("checked", true);
	if(ins2 == insChk2)
		$("input:checkbox[id='ins2']").prop("checked", true);
	if(ins3 == insChk3)
		$("input:checkbox[id='ins3']").prop("checked", true);
	if(ins4 == insChk4)
		$("input:checkbox[id='ins4']").prop("checked", true);
	
	var indChk = document.getElementById("indChk").value;
	
	var birthChk2 = document.getElementById("birthChk2").value;
	$("#birth2 option:eq(" + birthChk2 + ")").prop("selected", true);
	
});

//logo 이미지 미리보기
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
//input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});

//주요산업 2중 select
function idnChange(e) {
	
	//서비스업
	var idn_1 = ["호텔·여행·항공", "음식료·외식·프렌차이즈", "스포츠·여가·레저", "뷰티·미용", "서치펌·헤드헌팅"];
	
	//금융은행업
	var idn_2 = ["은행·금융", "캐피탈·대출", "증권·보험·카드"];
	
	//IT·정보통신산업
	var idn_3 = ["솔루션·SI·RM·ERP", "웹에이전시", "쇼핑몰·오픈마켓·소셜커머스", "포털·컨텐츠·커뮤니티", 
		"네트워크·통신·서비스", "정보보안", "컴퓨터·하드웨어·장비", "게임·애니메이션", "모바일·APP", "IT컨설팅"];
	
	//판매·유통업
	var idn_4 = ["백화점·유통·도소매", "무역·상사", "물류·운송·배송"];
	
	//제조생산·화학업
	var idn_5 = ["전기·전자·제어", "반도체·디스플레이·광학", "기계·기계설비", "자동차·조선·철강·항공", "금속·재료·자재", 
		"화학·에너지·환경", "섬유·의류·패션", "생활화학·화장품", "생활용품·소비재·기타",
		"목재·제지·가구", "식품가공", "농축산·어업·임업"];
	
	//미디어·광고업
	var idn_6 = ["방송·케이블·프로덕션", "신문·잡지·언론사", "광고·홍보·전시", "영화·음반·배급",
		"연예·엔터테인먼트", "출판·인쇄·사진"];
	
	//기관·협회
	var idn_7 = ["공기업·공공기관", "협회·단체", "컨설팅·연구조사", "회계·세무·법무"];
	
	
	var target = document.getElementById("idnResult");
	
	if(e.value == "1") var result = idn_1;
	else if (e.value == "2") var result = idn_2;
	else if (e.value == "3") var result = idn_3;
	else if (e.value == "4") var result = idn_4;
	else if (e.value == "5") var result = idn_5;
	else if (e.value == "6") var result = idn_6;
	else if (e.value == "7") var result = idn_7;
	
	
	
	target.options.length = 0;
	
	for (x in result) {
		var opt = document.createElement("option");
		opt.value = result[x];
		opt.innerHTML = result[x];
		target.appendChild(opt);
	}
	
	
	
}
</script>

<c:set var="root" value="<%=request.getContextPath() %>"/>

<title>Insert title here</title>
</head>
<body>
<div style="display: inline;">
<form action="updatecorpproc" method="post" enctype="multipart/form-data" style="width: 800px; margin: auto; margin-top: 50px;">

	<!-- hidden DB에 저장되어있는 값 -->
	<!-- 4대보험 -->
	<input type="hidden" id="insChk1" value="${dto.ins1 }">
	<input type="hidden" id="insChk2" value="${dto.ins2 }">
	<input type="hidden" id="insChk3" value="${dto.ins3 }">
	<input type="hidden" id="insChk4" value="${dto.ins4 }">
	
	<!-- 산업군 -->
	<input type="hidden" id="indChk" value="${dto.industry }">
	<input type="hidden" id="major" value="${dto.major }">
	
	<!-- 설립일 -->
	<input type="hidden" id="birthChk1" value="${dto.birth1 }">
	<input type="hidden" id="birthChk2" value="${dto.birth2 }">
	<input type="hidden" id="birthChk3" value="${dto.birth3 }">


	<span style="font-size: 1.5em; font-weight: bold; float: left;">기업정보 수정</span>
	<table class="table table-bordered">
		<caption> <span style="font-size: 8pt;">기업의 정보를 수정·확인하실 수 있습니다.</span> </caption>
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; border-top-width: thick; border-top-color: gray;">
				아이디
			</th>
			<td style="vertical-align: middle; border-top-width: thick; border-top-color: gray;">
				<span style="font-weight: bold;">${sessionScope.myid }</span>
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				상호명
			</th>
			<td>
				<input type="text" name="name" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="100" style="vertical-align: middle; background-color: #F7F7F7; ">
				기업 로고
			</th>
			<td>
				<input type="file" name="logoimage" id="logofile" accept="image/*" onchange="setThumbnail(event);"
					style="width: 100px; height: 40px; display: none;">
				<span class="logofile" style="cursor: pointer; width: 100px;">
				<button type="button" class="btn btn-default">사진 선택</button>
				</span>
				<div id="image_container" style="float: right;">
					<img alt="" src="${root }/images/${dto.logo}" id="img" style="width: 80px; margin-right: 450px;">
				</div>
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				기업 사진
			</th>
			<td>
				<input type="file" name="photoimage" id="photofile" style="width: 100px; height: 40px; display: none;">
				<span class="photofile" style="cursor: pointer; width: 100px;">
				<button type="button" class="btn btn-default">사진 선택</button>
				</span>
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				소개글
			</th>
			<td>
				<textarea name="intro" style="width: 400px; height: 100px;" class="form-control">${dto.intro }</textarea>
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				회사주소
			</th>
			<td>
				<input type="text" name="addr" class="form-control" style="width: 400px; height: 30px;" value="${dto.addr }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				연락처
			</th>
			<td>
				<input type="text" name="hp1" class="form-control"
				style="width: 100px; height: 30px; display: inline;" value="${dto.hp1 }">
				<b>-</b>
				<input type="text" name="hp2" class="form-control"
				style="width: 100px; height: 30px; display: inline;" value="${dto.hp2 }">
				<b>-</b>
				<input type="text" name="hp3" class="form-control"
				style="width: 100px; height: 30px; display: inline;" value="${dto.hp3 }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				대표자
			</th>
			<td>
				<input type="text" name="ceo" class="form-control" style="width: 200px; height: 30px;" value="${dto.ceo }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				사원수
			</th>
			<td>
				<input type="text" name="employees" class="form-control" style="width: 200px; height: 30px;" value="${dto.employees }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				매출액
			</th>
			<td>
				<input type="text" name="sales" class="form-control" style="width: 200px; height: 30px;" value="${dto.sales }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				주요산업
			</th>
			<td>
				<select name="industry" id="industry" class="form-control" style="display: inline; width: 190px; height: 30px;" required="required"
				onchange="idnChange(this)">
					<option>산업 선택</option>
					<option value="1" id="ind1">서비스업</option>
					<option value="2">금융은행업</option>
					<option value="3">IT·정보통신산업</option>
					<option value="4">판매·유통업</option>
					<option value="5">제조·생산·화학업</option>
					<option value="6">미디어·광고업</option>
					<option value="7">기관·협회</option>
			</select>
			<select name="major" id="idnResult" class="form-control" required="required"
			style="width: 190px; height: 30px; display: inline; margin-left: 10px;">산업 상세</select>
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				4대보험
			</th>
			<td>
				<label><input type="checkbox" name="insurance" id="ins1" class="form-control" 
				style="width: 20px; height: 20px; display: inline; " value="국민연금">
				국민연금</label>
				<label><input type="checkbox" name="insurance" id="ins2" class="form-control" 
				style="width: 20px; height: 20px; display: inline; margin-left: 20px;" value="건강보험">
				건강보험</label><label><input type="checkbox" id="ins3" name="insurance" class="form-control" 
				style="width: 20px; height: 20px; display: inline; margin-left: 20px;" value="고용보험">
				고용보험</label><label><input type="checkbox" id="ins4" name="insurance" class="form-control" 
				style="width: 20px; height: 20px; display: inline; margin-left: 20px;" value="산재보험">
				산재보험</label>
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				설립일
			</th>
			<td>
				<input type="text" name="birth1" id="birth1" class="form-control"
				style="width: 125px; height: 30px; display: inline;" required="required" value="${dto.birth1 }">
				<select name="birth2" id="birth2" class="form-control" style="width: 125px; height: 30px; display: inline; margin-left: 10px;" required="required">
					<option value="">월</option>
					<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
					<option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
					<option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>		
				</select>
				<input type="text" name="birth3" id="birth3" class="form-control"
				style="width: 125px; height: 30px; display: inline; margin-left: 10px;" required="required" value="${dto.birth3 }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				기업 홈페이지
			</th>
			<td>
				<input type="text" name="site" class="form-control" style="width: 200px; height: 30px;" value="${dto.site }">
			</td>
		</tr>
		
		
	</table>
	<div style="text-align: center; margin: auto;">
		<button type="submit" class="btn btn-normal" style="background-color: #40e0d0; color: white; font-weight: bold;
		width: 80px; height: 50px;">확인</button>
		<button type="button" class="btn btn-normal" style="background-color: #808080; color: white; font-weight: bold;
		width: 80px; height: 50px;" onclick="history.back()">취소</button>
	</div>
	<br><br><br><br><br>
</form>
</div>

<script type="text/javascript">
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.getElementById("img");
		img.removeAttribute("src");
		img.setAttribute("src", event.target.result);
		
		document.querySelector("div#image_container").appendChild(img);
	}; 
	reader.readAsDataURL(event.target.files[0]);
}
</script>

</body>
</html>