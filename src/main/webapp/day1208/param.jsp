<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true"%>
    
<%@ include file="../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="http://192.168.10.82/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.82/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.82/jsp_prj/common/css/carousel.css" rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	//id btnQs 버튼이 클릭되면 함수 실행 
	$("#btnQs").click(function () {
		paramQueryString();
	});//click
	
	//id btnJson 버튼이 클릭되면 함수 실행
	$("#btnJson").click(function () {
		paramJSON();
	});//click
	
	
	
});//ready

function paramQueryString() {
	//QueryString 형식으로 web parameter 전송하기
	var param="na="+$("#name").val()+"&age="+$("#age").val();
	$.ajax({
		url:"paramProcess.jsp",
		type:"POST",//post 사용 시 한글 안 깨지게 주의 -> 
		data: param,
		//--ㄴ요청------------------------
		//-------------------응답ㄱ-------
		dataType:"JSON",
		error: function (xhr) {
			$("#output").html(xhr.status+" / " + xhr.statusText);
		},//error
		success:function(jsonObj){
			console.log(jsonObj.name + " / "+ jsonObj.age );
			
			//맨 위에서 isELIgnored="true" 써서 EL 막고 백틱(`) 써서 JS  템플릿 리터럴 사용.
			//EL 자체를 안 쓰고 해야해서 권장은 안함.
			var output = "<table class= 'table table-hover'>";
			output+= `<tr><td>${jsonObj.name}</td></tr>`;
			output+= `<tr><td>${jsonObj.age}살</td></tr>`;
			output+= `<tr><td>${jsonObj.birth}년생</td></tr>`;
			output+= `</table>`;
			
			$("#output").html(output);
			
		}//success
		
	});//ajax
	
}//paramQueryString

function paramJSON() {
	//JSONObject 형식으로 web parameter 전송하기
	if($("#name").val()==""){
		alert("이름 없음");
		$("#name").focus();
	}
	
	var param = {na : $("#name").val(), age : $("#age").val()};
	
	$.ajax({
		url:"paramProcess.jsp",
		type:"GET",//post 사용 시 한글 안 깨지게 주의
		data: param,
		
		//--ㄴ요청------------------------
		//-------------------응답ㄱ-------
		dataType:"JSON",
		error: function (xhr) {
			$("#output").html(xhr.status+" / " + xhr.statusText);
		},//error
		success:function(jsonObj){
			console.log(jsonObj.name + " / "+ jsonObj.age );
			//parisng
			var name = jsonObj.name;
			var age  =jsonObj.age;
			var birth  =jsonObj.birth;
			
			//jQuery Append로 원하는 위치에 동작으로 추가.
			var output = `<tr><td>${name}</td><td>${age}</td><td>${birth}</td></tr>`
			$("#tab tbody:last").append( output );
			
			//varable 내부 비워주기
			$("#name").foucs();
		}//success
		
	});//ajax
}//paramJSON

</script>


</head>
<body>
	<header data-bs-theme="dark">
				<jsp:include page="../fragments/header.jsp"/>
	</header>
	<main>
	
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h1>AJAX Parameter 요청</h1>
					<!-- autofocus : 브라우저 열리면 커서가 바로 이름으로 감. -->
					<label>이름</label> <input type="text" name="name" id="name" autofocus="autofocus" value="민병조"/><br>
					<label>나이</label> <input type="text" name="age" id="age" value="34"/><br>
					<br>
					<button id="btnQs" class="btn btn-success">QueryString 방식</button>
					<button id="btnJson" class="btn btn-info">JSONObject 방식</button>
					<div id="output"></div>
					<div id="output2">
						<table id="tab" class="table table-hover">
						<thead>
							<tr>
								<th>이름</th><th>나이</th><th>태어난해</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
						</table>
					</div>
					
				</div>
				
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end">
				<a href="#">위로</a>
			</p>
			<p>
				&copy; SIST class2. &middot; <a href="#">개인정보호정책</a>
				&middot; 개인정보관리 책임자 님이셈
			</p>
		</footer>
	</main>
	
</body>
</html>