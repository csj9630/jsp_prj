<%@page import="day1128.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="http://192.168.10.68/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.68/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.68/jsp_prj/common/css/carousel.css" rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"/>
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

		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
				<jsp:useBean id="pDTO" class="day1128.ParamDTO" scope="page"/>
				<!-- web parameter를 한번에 받을 수 있다. -->
				<jsp:setProperty property="*" name="pDTO"/>
				<%
				//web parameter가 아닌 접속자의 정보 받아야함.
				String ip=request.getRemoteAddr();
				pDTO.setIp(ip);
				//sec-ch-ua-platform, user-agent
				pDTO.setSecChUaPlatform(request.getHeader("sec-ch-ua-platform"));
				pDTO.setUserAgent(request.getHeader("user-agent"));
				
				%>
				
				<%
				//email은 mail과 domain으로 분리되어 있고 합쳐야 한다.
				//back-end : request 객체 부르고 합치기
				//front:js 잘 써보기
				pDTO.setEmail(request.getParameter("email")+"@"+request.getParameter("domain"));
				pDTO.setName(request.getParameter("name"));
				/*
				**********************************************************************
				12/04
				WebMemberService로 변경하기
				**********************************************************************
				*/
				
				
				MemberService ms=new MemberService();
				ms.joinMember(pDTO); //값을 받을 DTO를 Service객체에 전달할 수 있다.
				%>
				<strong><jsp:getProperty property="id" name="pDTO"/></strong>
				 님
				 회원 가입을 축하드립니다.<br>
				 기존 서비스와는 차별화된 새로운 사용자 경험을 제공합니다.<br>
				 <img src="../common/images/img_4.jpg">
				<br>
				아이디 : <input type="text" value="${ param.id }"/><br>
				비밀번호 : ${ param.pass }<br>
				이름 : ${ param.name }<br>
				이메일 : ${ param.email }@${param.domain }<br>
				생년월일 : ${ param.birth }<br>
				거주지 : ${ param.loc }<br>
				소개 : ${ param.intro }<br>
				코드 : ${ param.code }<br>
				</div>
				<div>
				<strong>&lt;jsp:getProperty 사용</strong><br>
				주소 : <jsp:getProperty property="language" name="pDTO"/><br>
				<% //<jsp:getProperty를 사용하면 배열의 요소를 출력할 수 없다.
				String[] lang=request.getParameterValues("language");
				
				if( lang != null){ //NullPointerException발생을 막기위해서
				for(int i=0; i < lang.length ; i++){
					%>
					<%= i+1 %>. <%= lang[i] %> 
					<%
				}//end for
				}//end if
				%>
				</div>
				<div>
				<strong>&lt;c:forEach 사용</strong><br>
				<c:forEach var="lang" items="${ paramValues.language }" varStatus="i">
				<c:out value="${ i.count }"/>. <c:out value="${ lang }"/>
				</c:forEach>
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