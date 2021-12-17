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
			<option value="남자">남자</option>
			<option value="여자">여자</option>
			<option value="선택안함">선택안함</option>				
		</select><br>
		
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
		
		<!-- 주소 API 불러올 예정 -->
		<span style="font-weight: bold; font-size: 1.1em;">주소</span>
		<span style="color: red;">*</span>
		<input type="text" name="addr" class="form-control" 
		style="width: 400px; height: 40px;" required="required" placeholder="주소">
		<br>
		
		<span style="font-weight: bold; font-size: 1.1em;">연락처</span>
		<span style="color: red;">*</span><br>
		<input type="text" name="hp1" id="email2" class="form-control"
		style="width: 124px; height: 40px; display: inline;" required="required" placeholder="000">
		<b>-</b>
		<input type="text" name="hp2" id="email2" class="form-control"
		style="width: 124px; height: 40px; display: inline;" required="required" placeholder="0000">
		<b>-</b>
		<input type="text" name="hp3" id="email2" class="form-control"
		style="width: 124px; height: 40px; display: inline;" required="required" placeholder="0000">
		
		<br><br>
		<button type="submit" style="width: 400px; height: 40px; color: white; background-color: #40e0d0;
		border: none; font-size: 1.2em; font-weight: bold;">가입하기</button><br><br>
	</div>
</form>
</div>
</body>
</html>