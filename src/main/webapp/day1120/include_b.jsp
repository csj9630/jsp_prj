<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 다른 페이지에 들어가는 jsp : 공통 코드를 정의한다. -->
	<%
		String msg="오늘은 목요일입니다. 여긴 B 페이지입니다";
		String name="민병조";
		
		
	%>
	<strong><%=msg %></strong>
</body>
</html>