<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>파일업로드 실습</title>
<link rel="shortcut icon"
	href="http://192.168.10.82/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.82/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.82/jsp_prj/common/css/carousel.css"
	rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
#wrap {
	margin: 0px auto;
	width: 1200px;
	height: 1000px;
}

#header {
	height: 150px;
}

#container {
	height: 700px;
}

#footer {
	height: 150px;
}
</style>
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		//이 버튼이 클릭되면 저 버튼을 js가 클릭하게 하라
		$("#btnFile").click(function () {
			$("#upfile").click();//파일을 선택하면 파일이 변경 ( change event 발생)
		});//click
		
		$("#upfile").change(function(evt){
			/*
				//업로드 가능 확장자는 gif,jpg,png,bmp만 가능한 체크 코드 작성.
				var blockExt="gif,jpg,png,bmp".split(",");
				var file = $("#upfile").val();
				var ext = file.substring(file.lastIndexOf(".")+1);
				
				var flag = false;
				for (var i = 0; i < blockExt.length; i++) {
					if(blockExt[i] ==ext){
						flag = true;
					}//end if
				}//end for
				
				if(!flag){
					alert("업로드 가능 확장자는 gif,jpg,png,bmp만 가능합니다 - 현재 : "+ext);
					return;
				}//end if
			*/
			
			//미리보기
			//1. HTML File Control 접근
			var file = evt.target.files[0]; //input type="file">
			
			//2. 파일을 읽기 위한 스트림 생성
			var reader = new FileReader();
			
			//3.File 객체의 onload 이벤트 핸들러를 설정하여 >img> 태크의 src속성에 파일명 설정
			reader.onload = function(evt){
				$("#preview").prop("src",evt.target.result);
			}//end if
			
			//4. 스트림을 사용하여 img 태그에 이미지 로딩
			reader.readAsDataURL(file);

			
			//파일이 변경되면 변경된 파일명을 div에 넣는다.
			$("#selectFile").html($("#upfile").val());
		});//click
		
		
		$("#btnUpload").click(function () {
			if($("#uploader").val() == ""){
				alert("필수입력");
				return;
			}//end if
			if($("#btnFile").val() == ""){
				alert("필수입력");
				return;
			}//end if
			if($("#upfile").val() == ""){
				alert("필수입력");
				return;
			}//end if
			
			$("#frm").submit();
		})//click

	});//ready
</script>


</head>
<body>
	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp" />
	</header>
	<main>
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<!-- 여기서부터 작성 시작-->
					<h2>파일 업로드</h2>
					<form  id="frm" action="uploadFrmProcess.jsp"  method="POST" enctype="multipart/form-data" >
						<label>업로더</label>
						<input type="text" name="uploader" id="uploader"><br />
						<label>대상연령</label>
						<c:forEach var="age" begin="10" end ="80" step="10">
							<input type="checkbox" name="age" value="${age}">
							<c:out value="${age}대"/>
						</c:forEach>
						
						<label>파일</label> 
	   					<img id="preview" alt="이미지 미리보기" src="../common/images/default.png"
	   					style="width: 100px; height: 100px; border-radius: 50px" 
	   					/>
	   					
	   				    <input type="button" value="파일선택" id="btnFile" class="btn btn-success"/>
	   				    업로드는 이미지만 가능합니다.(jpg, gif, png, bmp)
	   				    <div id="selectFile"></div>
<!-- 						<input type="file" accept=".gif,.jpg,.png,.bmp" name ="upfile" id="upfile" style="display: none"><br />
 -->						<input type="file" accept="image/*" name ="upfile" id="upfile" style="display: none"><br />
	   				    <input type="button" value="업로드" id="btnUpload" class="btn btn-success" />
					</form>

				</div>

			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<jsp:include page="../fragments/footer.jsp" />
		</footer>
	</main>

</body>
</html>