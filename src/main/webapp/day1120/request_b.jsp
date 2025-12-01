<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.getColor {color: #FFFF00;}
.postColor {color: #0000FF;}

</style>


<%
String requestColorCss="getColor";
if("POST".equals(request.getMethod())){
	requestColorCss=".postColor";
}//end if
%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<strong><span class="<%=requestColorCss%>"><%=request.getMethod() %></span></strong>
<br>
<a href="javascript:history.back()"></a>
</body>
</html>