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
		
		$("#logofile").trigger("click");
	});
});

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

</script>

<c:set var="root" value="<%=request.getContextPath() %>"/>

<title>Insert title here</title>
</head>
<body>
<div style="display: inline;">
<form action="updatecorpproc" method="post" enctype="multipart/form-data" style="width: 800px; margin: auto; margin-top: 50px;">
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
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="100" style="vertical-align: middle; background-color: #F7F7F7; ">
				기업 로고
			</th>
			<td>
				<input type="file" name="logoimage" id="logofile" accept="image/*" onchange="setThumbnail(event);"
					style="width: 100px; height: 40px; display: none;" required="required">
				<span class="photo" style="cursor: pointer; width: 100px;">
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
				<input type="file" name="pass" class="form-control" style="width: 200px; height: 30px;">
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
				style="width: 100px; height: 30px; display: inline;" placeholder="000">
				<b>-</b>
				<input type="text" name="hp2" class="form-control"
				style="width: 100px; height: 30px; display: inline;" placeholder="0000">
				<b>-</b>
				<input type="text" name="hp3" class="form-control"
				style="width: 100px; height: 30px; display: inline;" placeholder="0000">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				대표자
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				사원수
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				매출액
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				주요산업
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				4대보험
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				설립일
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
			</td>
		</tr>
		
		<tr>
			<th width="150" height="45" style="vertical-align: middle; background-color: #F7F7F7; ">
				기업 홈페이지
			</th>
			<td>
				<input type="text" name="pass" class="form-control" style="width: 200px; height: 30px;" value="${dto.name }">
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