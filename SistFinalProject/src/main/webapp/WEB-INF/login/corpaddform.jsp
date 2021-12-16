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
	
	<span style="font-weight: bold; font-size: 1.1em;">회사 사진</span>
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
	
	<!-- select로 바꿀 예정 -->
	<span style="font-weight: bold; font-size: 1.1em;">주요사업</span>
	<input type="text" name="major" class="form-control" 
	style="width: 400px; height: 40px;" required="required">
	<br>
	
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