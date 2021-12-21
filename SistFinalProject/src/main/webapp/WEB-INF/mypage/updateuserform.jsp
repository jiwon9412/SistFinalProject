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
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				주소
			</th>
			<td>
				<input type="text" name="addr" class="form-control" style="width: 400px; height: 30px;" value="${dto.addr }">
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