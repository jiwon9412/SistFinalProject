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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

$(function () {
	
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
		
		var id = $(this).val().trim(); //id값 빈칸 제거
		if(id.length==0) { //입력안했을시 함수 종료
			return;
		}
		$.ajax({
			type: "get",
			dataType: "json",
			data: {"id":id},
			url: "idcheck",
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

//카카오 주소 API
function showPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } 
        }
    }).open();
}

</script>
<title>Insert title here</title>
</head>

<body>
<div style="display: flex; justify-content: center; padding: 0;">
	<img alt="" src="${root }/images/joblogo.png">
</div>
<div style="display: flex; justify-content: center;">
	<span style="font-weight: bold; font-size: 2em; text-align: center;">회원가입</span>
</div>

<div style="display: flex; justify-content: center;">
<form action="insertuser" method="post" class="form from-inline" onsubmit="return check(this)">
	<div id="job_seeker">
	
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
		
		<span style="font-weight: bold; font-size: 1.1em;">이름</span>
		<span style="color: red;">*</span>
		<input type="text" name="name" class="form-control"
		style="width: 400px; height: 40px;" required="required" placeholder="&nbsp;이름(실명)"><br>
		
		<span style="font-weight: bold; font-size: 1.1em;">생년월일</span>
		<span style="color: red;">*</span><br>
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
		
		<span style="font-weight: bold; font-size: 1.1em;">성별</span>
		<span style="color: red;">*</span>
		<select name="gender" class="form-control" style="width: 400px; height: 40px;">
			<option value="">성별</option>
			<option value="남성">남성</option>
			<option value="여성">여성</option>
			<option value="선택안함">선택안함</option>				
		</select><br>
		
		<span style="font-weight: bold; font-size: 1.1em;">연락처</span>
		<span style="color: red;">*</span><br>
		<input type="text" name="hp1" id="email2" class="form-control"
		style="width: 124px; height: 40px; display: inline;" required="required" placeholder="000">
		<b>-</b>
		<input type="text" name="hp2" id="email2" class="form-control"
		style="width: 124px; height: 40px; display: inline;" required="required" placeholder="0000">
		<b>-</b>
		<input type="text" name="hp3" id="email2" class="form-control"
		style="width: 124px; height: 40px; display: inline;" required="required" placeholder="0000"><br><br>
		
		<span style="font-weight: bold; font-size: 1.1em;">이메일</span>
		<span style="color: red;">*</span><br>
		<input type="text" name="email1" class="form-control"
		style="width: 130px; height: 40px; display: inline;" required="required" placeholder="이메일">
		<b>@</b>
		<input type="text" name="email2" id="email2" class="form-control"
		style="width: 130px; height: 40px; display: inline;" required="required" placeholder="">
		<select id="selemail" class="form-control" style="width: 110px; height: 40px; display: inline;">
			<option value="-">직접입력</option>
			<option value="naver.com">네이버</option>
			<option value="nate.com">네이트</option>
			<option value="gmail.com">구글</option>
			<option value="hanmail.net">다음</option>				
		</select><br><br>
		
		<span style="font-weight: bold; font-size: 1.1em;">주소</span>
		<span style="color: red;">*</span>
		<input type="text" name="zipcode" id="sample4_postcode" class="form-control" onclick="showPostCode()"
		style="width: 150px; height: 40px;" required="required" placeholder="우편번호" readonly="readonly"><br>
		
		<input type="text" name="addr" id="sample4_roadAddress" class="form-control" onclick="showPostCode()"
		style="width: 400px; height: 40px;" required="required" placeholder="도로명주소" readonly="readonly"><br>
		
		<input type="text" name="addr_detail" id="sample4_detailAddress" class="form-control" placeholder="상세주소"
		style="width: 400px; height: 40px;" required="required">
		<br>
		
		<br><br>
		<button type="submit" style="width: 400px; height: 40px; color: white; background-color: #40e0d0;
		border: none; font-size: 1.2em; font-weight: bold;">가입하기</button><br><br>
	</div>
</form>
</div>
</body>
</html>