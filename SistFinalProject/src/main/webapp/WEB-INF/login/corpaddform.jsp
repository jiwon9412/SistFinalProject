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
	$("span.photo").click(function () {
		
		$("#image").trigger("click");
	});
	
	//이메일 선택 이벤트
	$("#selemail").change(function () {
		if($(this).val()=='-') {
			$("#email2").val(''); //지정위치 데이터 지우기
			$("#email2").focus(); //포커스
		} else {
			$("#email2").val($(this).val());
		}
	});
	
	//아이디 중복 확인
	$("#id").blur(function () {
		
		var id = $(this).val().trim();
		if(id.length==0) {
			return;
		}
		$.ajax({
			type: "get",
			dataType: "json",
			data: {"id":id},
			url: "corpidcheck",
			success:function(data) {
				if(data.check==1) {
					$("b.idmsg").html("<font color='red'>이미 사용중인 아이디입니다</font>");
					$("#id").val("");
					$("#id").focus();
				} else {
					$("b.idmsg").html("<font color='green'>사용가능한 아이디입니다</font>")
				}
			}
		});
		
	});
});

function check(f) {
	//비밀번호 체크
	if(f.pass.value!=f.pass2.value) {
		alert("비밀번호가 서로 다릅니다");
		f.pass.value="";
		f.pass2.value="";
		return false;
	}
}

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
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});

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
<title>Insert title here</title>
</head>

<body>
<div style="display: flex; justify-content: center; padding: 0;">
	<img alt="" src="${root }/images/joblogo.png">
</div>
<div style="display: flex; justify-content: center;">
	<span style="font-weight: bold; font-size: 2em; text-align: center;">기업 회원가입</span>
</div>

<div style="display: flex; justify-content: center;">
<form action="insertcorp" method="post" class="form from-inline" onsubmit="return check(this)" enctype="multipart/form-data">

	<span style="font-weight: bold; font-size: 1.1em;">아이디</span>
	<span style="color: red;">*</span>
	<input type="text" name="id" id="id" class="form-control"
		style="width: 400px; height: 40px;" required="required" placeholder="&nbsp;아이디">
	<b class="idmsg" style="font-size: 0.5em; "></b><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">비밀번호</span>
	<span style="color: red;">*</span>
	<input type="password" name="pass" class="form-control"
		style="width: 400px; height: 40px;" required="required" placeholder="&nbsp;비밀번호(8~16자의 영문, 숫자, 특수기호)"><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">비밀번호 재확인</span>
	<span style="color: red;">*</span>
	<input type="password" name="pass2" class="form-control"
		style="width: 400px; height: 40px;" required="required" placeholder="&nbsp;비밀번호(8~16자의 영문, 숫자, 특수기호)"><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">상호명</span>
	<span style="color: red;">*</span>
	<input type="text" name="name" class="form-control"
		style="width: 400px; height: 40px;" required="required" placeholder="&nbsp;상호명">
	<br>
	
	<span style="font-weight: bold; font-size: 1.1em;">기업 로고</span>
	<span style="color: red;">*</span><br>
	<input type="file" name="logoimage" id="image" accept="image/*" onchange="setThumbnail(event);"
		style="width: 100px; height: 40px; display: none;" required="required">
	<span class="photo" style="cursor: pointer; width: 100px;">
		<button type="button" class="btn btn-default">사진 선택</button>
	</span>
	<div id="image_container" style="float: right; margin-right: 200px;" ></div>
	<br><br><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">기업 사진</span>
	<span style="color: red;">*</span>
	<input type="file" name="photoimage" class="form-control" multiple="multiple"
	style="width: 400px; height: 40px;" required="required">
	<br>
	
	<span style="font-weight: bold; font-size: 1.1em;">소개글</span><br>
	<textarea name="intro" style="width: 400px; height: 100px;" class="form-control"></textarea>
	<br>
	
	<!-- 주소 API 불러올 예정 -->
	<span style="font-weight: bold; font-size: 1.1em;">회사주소</span>
	<span style="color: red;">*</span>
	<input type="text" name="addr" class="form-control" 
	style="width: 400px; height: 40px;" required="required">
	<br>
	
	<span style="font-weight: bold; font-size: 1.1em;">연락처</span>
	<br>
	<input type="text" name="hp1" class="form-control"
	style="width: 124px; height: 40px; display: inline;" placeholder="000">
	<b>-</b>
	<input type="text" name="hp2" class="form-control"
	style="width: 124px; height: 40px; display: inline;" placeholder="0000">
	<b>-</b>
	<input type="text" name="hp3" class="form-control"
	style="width: 124px; height: 40px; display: inline;" placeholder="0000">
	<br><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">대표자</span>
	<input type="text" name="ceo" class="form-control" 
	style="width: 400px; height: 40px;" placeholder="홍길동">
	<br>
	
	<span style="font-weight: bold; font-size: 1.1em;">사원수</span>
	<input type="text" name="employees" class="form-control" 
	style="width: 400px; height: 40px;" placeholder="숫자만 입력">
	<br>
	
	<span style="font-weight: bold; font-size: 1.1em;">매출액</span>
	<input type="text" name="sales" class="form-control" 
	style="width: 400px; height: 40px;" placeholder="0조 000억">
	<br>
	
	<span style="font-weight: bold; font-size: 1.1em;">주요산업</span>
	<span style="color: red;">*</span><br>
	<select name="industry" class="form-control" style="display: inline; width: 190px; height: 40px;" required="required"
	onchange="idnChange(this)">
		<option>산업 선택</option>
		<option value="1">서비스업</option>
		<option value="2">금융은행업</option>
		<option value="3">IT·정보통신산업</option>
		<option value="4">판매·유통업</option>
		<option value="5">제조·생산·화학업</option>
		<option value="6">미디어·광고업</option>
		<option value="7">기관·협회</option>
	</select>
	<select name="major" id="idnResult" class="form-control" required="required"
	style="width: 190px; height: 40px; display: inline; margin-left: 10px;">산업 상세</select>
	<br><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">4대보험</span><br>
	<label><input type="checkbox" name="insurance" class="form-control" 
	style="width: 20px; height: 20px; display: inline; margin-top: 10px;" value="연금보험">
	연금보험</label>
	<label><input type="checkbox" name="insurance" class="form-control" 
	style="width: 20px; height: 20px; display: inline; margin-left: 20px;" value="건강보험">
	건강보험</label><label><input type="checkbox" name="insurance" class="form-control" 
	style="width: 20px; height: 20px; display: inline; margin-left: 20px;" value="고용보험">
	고용보험</label><label><input type="checkbox" name="insurance" class="form-control" 
	style="width: 20px; height: 20px; display: inline; margin-left: 20px;" value="산재보험">
	산재보험</label>
	<br><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">설립일</span><br>
	<input type="text" name="birth1" class="form-control"
	style="width: 125px; height: 40px; display: inline;" required="required" placeholder="&nbsp;년(4자)">
	<select name="birth2" class="form-control" style="width: 125px; height: 40px; display: inline; margin-left: 10px;" required="required">
		<option value="">월</option>
		<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
		<option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
		<option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>		
	</select>
	<input type="text" name="birth3" class="form-control"
	style="width: 125px; height: 40px; display: inline; margin-left: 10px;" required="required" placeholder="&nbsp;일"><br><br>
	
	<span style="font-weight: bold; font-size: 1.1em;">기업 홈페이지</span><br>
	<input type="text" name="site" class="form-control" 
	style="width: 400px; height: 40px;"placeholder="http://">
	<br>
	
	<br><br>
	<button type="submit" style="width: 400px; height: 40px; color: white; background-color: #40e0d0;
	border: none; font-size: 1.2em; font-weight: bold;">가입하기</button><br><br>
		
</form>
</div>

<script type="text/javascript">
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.removeAttribute("src");
		img.setAttribute("src", event.target.result);
		img.setAttribute("style", "width: 80px;");
		document.querySelector("div#image_container").appendChild(img); 
	}; 
	reader.readAsDataURL(event.target.files[0]);
}
</script>
</body>
</html>