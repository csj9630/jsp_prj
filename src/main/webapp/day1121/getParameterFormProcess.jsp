<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="입력 폼에 입력된 값을 받아서 처리하는 일"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//request 내장 객체를 사용하여 HTML Form Control에 입력된 값 받기
//id=testsdfg&pass=minjo123&birth=2025-11-06&loc=서울&intro=내소개&code=U3881

//name 속성에 값이 유일(이름이 유일함)
//String 변수명 = request.getParameter("이름");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String birth = request.getParameter("birth");
String location = request.getParameter("loc");
String intro = request.getParameter("intro");
String code = request.getParameter("code");

//입력한 값을 유효성 검증 (back-end) => 서비스 객체로 보내고 => DAO로 보내서
//=> 리턴값을 서비스가 받아서 => JSP로 리턴 받아서 -> 디자인 적용해서 사용자에게 응답.
%>

<!-- 입력값이 한글인 모든 값에 new String을 써줘야한다는 번거로움 -->
<div>
	<strong><%= request.getMethod()%> 방식으로 처리한 입력값</strong>
	<ul>
		<li><strong>아이디</strong> : <%= id%></li>
<%--	<li><strong>아이디</strong> : <%= new String(id.getBytes("8859_1"),"UTF-8")%></li> --%>		<li><strong>비번</strong> : <%= pass %></li>
		<li><strong>생년월일</strong> : <%= birth%></li>
		<li><strong>거주지</strong> : <%= location%></li>
		<li><strong>자기소개</strong> : <%= intro%></li>
		<li><strong>code</strong> : <%= code%></li>
	</ul>
</div>

</body>
</html>