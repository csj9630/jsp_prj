<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
//응답되는 페이지가 아니므로 디자인 코드는 넣지 않는다.

//0. 업무처리한 결과를 view페이지로 전달하기위해서 request객체에 속성으로 설정
String[] names={"tim berners lee","James Gosling","민병조"};
String[] infos={"Web의 아버지 !! ","Java의 아버지", "아버지가 될 사람"};
request.setAttribute("names", names);
request.setAttribute("infos", infos);


//1. 이동할 페이지의 URI를 설정하여 RequestDispatcher를 얻기
RequestDispatcher rd=request.getRequestDispatcher("forward_b.jsp");
//2. 이동
rd. forward(request, response);

%>

<html>
<head>
<link rel="shortcut icon" href="${commonURL}/common/images/favicon2.ico">
<meta charset="UTF-8">
<title>이터널리턴 지금바로다운로드</title>
<!-- bootStrap CDN ---------------------->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
 <!----------------------- bootStrap CDN -->
 
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>

<!-- JQuery 세트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!--JS 실습 파트-->
<script type="text/javascript">

</script>
</head>
<body>
<div id="wrap">
	<div id="header">header 1200(w) x 150(h) 사이트로고, 주력서비스, navigation bar</div>
	<div id="container">
		<div id="output"></div>
	</div>
	<div id="footer">footer 1200(w) x 150(h)</div>
<%-- <%//0. 업무 처리한 결과를 view 페이지로 전달하기 위해서 request 객체에 속성으로 설정

//1. 이동할 페이지의 URL을 설정하여 requestDispatcher를 얻기
RequestDispatcher rd = request.getRequestDispatcher("forward_b.jsp");

//2. 이동
rd. forward(request, response);
%> --%>


</div>
</body>
</html>