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
	
	//selectbox 기존 값으로 selected 이벤트
	//생년월일
	var M_birth_Chk = document.getElementById("M_Birth_Chk").value;
	$("#birth2 option:eq(" + M_birth_Chk + ")").prop("selected", true);
	
	//성별
	var gender_Chk = document.getElementById("Gender_Chk").value;
	if(gender_Chk == "남성")
		$("#gender option:eq(1)").prop("selected", true);
	if(gender_Chk == "여성")
		$("#gender option:eq(2)").prop("selected", true);
	if(gender_Chk == "선택안함")
		$("#gender option:eq(3)").prop("selected", true);
	
});

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

<div style="display: inline;">
<form action="updateuserpproc" method="post" enctype="multipart/form-data" style="width: 800px; margin: auto; margin-top: 50px;">

	<!-- hidden __ DB에 저장되어있는 값 -->
	<!-- 생년월일 -->
	<input type="hidden" id="Y_Birth_Chk" value="${dto.birth1 }">
	<input type="hidden" id="M_Birth_Chk" value="${dto.birth2 }">
	<input type="hidden" id="D_Birth_Chk" value="${dto.birth3 }">
	
	<input type="hidden" id="Gender_Chk" value="${dto.gender }">


	<span style="font-size: 1.5em; font-weight: bold; float: left;">회원정보 수정</span>
	<table class="table table-bordered">
		<caption> <span style="font-size: 8pt;">회원의 정보를 수정·확인하실 수 있습니다.</span> </caption>
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
				이름
			</th>
			<td>
				<input type="text" name="name" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				생년월일
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
				성별
			</th>
			<td>
				<select name="gender" id="gender" class="form-control" style="width: 200px; height: 30px;">
					<option value="">성별</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
					<option value="선택안함">선택안함</option>				
				</select>
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
				이메일
			</th>
			<td>
				<input type="text" name="email1" class="form-control"
				style="width: 130px; height: 30px; display: inline;" required="required" value="${dto.email1 }">
				<b>@</b>
				<input type="text" name="email2" id="email2" class="form-control"
				style="width: 130px; height: 30px; display: inline;" required="required" value="${dto.email2 }">&nbsp;
				<select id="selemail" class="form-control" style="width: 110px; height: 30px; display: inline;">
					<option value="-">직접입력</option>
					<option value="naver.com">네이버</option>
					<option value="nate.com">네이트</option>
					<option value="gmail.com">구글</option>
					<option value="hanmail.net">다음</option>				
				</select>
			</td>
		</tr>
		
		<tr>
			<th rowspan="3" width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				주소
			</th>
			<td>
				<input type="text" name="zipcode" id="sample4_postcode" class="form-control" style="width: 100px; height: 30px;" value="${dto.zipcode }"
				readonly="readonly" onclick="showPostCode()">
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="text" name="addr" id="sample4_roadAddress" class="form-control" style="width: 400px; height: 30px;" value="${dto.addr }"
				readonly="readonly" onclick="showPostCode()">
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="text" name="addr_detail" class="form-control" style="width: 200px; height: 30px;" value="${dto.addr_detail }">
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

</body>
</html>