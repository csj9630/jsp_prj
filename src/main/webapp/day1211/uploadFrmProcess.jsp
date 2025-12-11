<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
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

<title>JSP템플릿</title>
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
					<%-- 
					<%
					//enctype="multipart/form-data"을 쓸 때는 
					//기본에 쓰던 방식으로 웹파라미터 받는게 안된다.
					String uploader = request.getParameter("uploader");
					%>
					<%=uploader %>, ${param.uploader }
					
					// => 파일업로드 컴포넌트 사용.
					--%>

					<%
					//POST 한글 인코딩
					request.setCharacterEncoding("UTF-8");

					// =========== 파일업로드 컴포넌트 사용하여 리퀘스트 받기=============
					//***1. 업로드된 파일을 저장할 경로를 설정
					//이런 경로는 siteProperty에 넣고 하자.
					File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
					if (!saveDir.exists()) {
						saveDir.mkdirs();
					} //end if

					//***2. 최대 크기 설정
					int maxSize = 1024 * 1024 * 10; //10MB로 제한

					//2-1. 업로드 크기 설정
					int uploadSize = 1024 * 1024 * 600; //600MB로 큼직하게 설정.

					//***3. FileUpload 객체 ( MultipartRequest ) 생성
					//-> 생성하자마자 mr 객체도 생성되어서 업로드됨
					MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), uploadSize, "UTF-8",
							new DefaultFileRenamePolicy());

					//요청 받기
					String uploader = mr.getParameter("uploader");
					String[] ageArr = mr.getParameterValues("age");
					//String fileName = mr.getParameter("upfile");//파일명은 파라메터로 못 받음
					String originalName = mr.getOriginalFileName("upfile");//원본명
					String fileSystemName = mr.getFilesystemName("upfile");//변경명

					//2-2.업로드 파일의 크기를 얻어서 업로드 가능 크기와 비교한다.
					File compareFile = new File(saveDir.getAbsolutePath() + File.separator + fileSystemName);

					//파일이 크다면 사용자에게 에러 메시지를 보여주고 파일을 지운다.
					//작으면 바로 업로드.
					boolean flag = false;
					if (flag = (compareFile.length() > maxSize)) {
						compareFile.delete();
					} //end if

					//request로 받은 게 아니니 scope 객체에 직접 넣기
					pageContext.setAttribute("uploader", uploader);
					pageContext.setAttribute("ageArr", ageArr);
					pageContext.setAttribute("originalName", originalName);
					pageContext.setAttribute("fileSystemName", fileSystemName);
					pageContext.setAttribute("flag", flag);
					%>
					<!--maxSize보다 큰 파일이면 에러를 띄우고  -->
					<!--아니면 정상 작동한다.-->
					<c:choose>
						<c:when test="${flag}">
							<h5>Error! 파일 사이즈는 최대 10Mbyte 까지입니다.</h5>
						</c:when>
						<c:otherwise>
							업로더 :
							<c:out value="${uploader }" />
							<br> 대상층 연령 :
							<c:forEach var="age" items="${ageArr }">
								<c:out value="${age }" />
							</c:forEach>
							<br> 파일명 :
							<c:out value="${fileSystemName }" />
							<br> 원본명 :
							<c:out value="${originalName }" />
							<br> <a href="view_img.jsp?img=${ fileSystemName }">이미지 보기</a>
						</c:otherwise>
					</c:choose>
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