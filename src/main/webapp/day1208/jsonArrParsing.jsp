<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true" trimDirectiveWhitespaces="true"%>
    
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
	$("#btn").click(function(){
		jsonArrParsing();
	});//click
});//ready

function jsonArrParsing() {
	$.ajax({
		url:"http://localhost/jsp_prj/day1205/jsonArr.jsp",
		type:"GET",
		dataType:"JSON",
		error:function(xhr){
			alert("문제발생");
			console.log(xhr);
		},
		success:function(jsonArr){
			test(jsonArr);
		}
		
	});//ajax
}//jsonArrParsing

function test(jsonArr) {
	var output="";
	$.each(jsonArr,function(ind,jsonObj){
		output+=`<div>
					${ind+1}.
					<input type="text" name="name" id="name" value="${jsonObj.name}"/>
					<input type="text" name="age" id="age" value="${jsonObj.age}"/>
					<input type="button"  class="btn btn-danger" value="삭제" onclick="del('${jsonObj.name}')" />
				</div>`;
	});//each
	$("#output").html(output);

}//test
</script>


</head>
<body>
	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp"/>
	</header>
	<main>
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
				<!-- 여기서부터 작성 시작-->
					<div id="output"></div>
					<button id="btn" class="btn btn-success">jsonArr 요청</button>
				</div>
				
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<jsp:include page="../fragments/footer.jsp"/>
		</footer>
	</main>
	
</body>
</html>