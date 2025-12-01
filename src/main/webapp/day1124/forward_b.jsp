<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="http://192.168.10.82/jsp_prj/common/images/favicon2.ico">
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
		<%
		//업무 처리페이지에서 업무처리한 결과를 받는다.
		String[] names = (String[])request.getAttribute("names");
		String[] infos = (String[])request.getAttribute("infos");
		
		//화면을 만든다.
		%>
		
		<select id = "name">
			<%for(int i=0; i<names.length; i++){%>
			<option value="<%=infos[i]%>"><%=names[i] %></option>
				
			<%}%>
		
		</select>
	</div>
	<div id="footer">footer 1200(w) x 150(h)</div>
</div>
</body>
</html>