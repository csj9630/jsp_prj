<%@page import="kr.co.sist.user.member.WebMemberService"%>
<%@page import="day1128.ParamDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../fragments/siteProperty.jsp"%>
 <%@ include file="../fragments/loginChk3.jsp"%><!--로그인 여부 체크  --> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="${commonURL}/common/images/favicon.ico">

<script src="${commonURL}/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="${commonURL}/common/css/carousel.css" rel="stylesheet">
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
	
});//ready
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
					<h2>회원 정보 수정 프로세스</h2>
					<%
					//POST 한글 인코딩
					request.setCharacterEncoding("UTF-8");
	
					//id 받기
					String id = (String)session.getAttribute("userId");
					
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
					String email = mr.getParameter("email");
					System.out.println("********프로세스 시점 이메일   : "+email+"**********************");
					
					String domain = mr.getParameter("domain");
					String birth = mr.getParameter("birth");
					String loc = mr.getParameter("loc");
					String intro = mr.getParameter("intro");
					String profile = mr.getParameter("profile");
					
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
					
					ParamDTO pDTO = new ParamDTO();
					pDTO.setId(id);
					pDTO.setEmail(email+"@"+domain);
					pDTO.setBirth(birth);
					pDTO.setLoc(loc);
					pDTO.setIntro(intro);
				
					//프로필 이지미 파일이 선택 안되어 있으면 -> 기존 이미지명으로
					//선택되어있으면 새로운 파일명으로 설정되게 하기.
					pDTO.setProfile(fileSystemName==null? profile : fileSystemName);
					
					WebMemberService wms = WebMemberService.getInstance();
					
					//회원 정보를 수정하고 성공 여부를 flag로 저장
					boolean flagModfiy = wms.modifyMember(pDTO);
					pageContext.setAttribute("flag", flagModfiy);
					
					//index.jsp에서 프로필 이미지를 세션에서 가져와서 보여주기 때문에
					//회원 정보 변경이 성공하면 세션에 프로필 이미지를 변경해준다.
					if(flagModfiy){
						session.setAttribute("userProfile", pDTO.getProfile());
						session.setAttribute("userBirth", pDTO.getProfile());
					}//end if
					
					
					%>
					
					
					<c:choose>
						<c:when test="${flag}">
							<img alt="정상 등록" src="${commonURL}/upload/icon_60.png">
							<h3>회원 정보가 정상 수정되었습니다.</h3>
							<h5><a href="${commonURL }/index.jsp">메인화면으로</a></h5>
						</c:when>
						<c:otherwise>
							회원정보 변경 시 문제가 발생하였습니다.<br>
							그렇게 됐다..							
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
			<jsp:include page="../fragments/footer.jsp"/>
		</footer>
	</main>
	
</body>
</html>