<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//예시
//세션에 로그인한 정보가 있는지를 판단함.
//세션은 아직 안 배운 관계로 적당히
String sessionId = "";
if(new Random().nextBoolean()){
	sessionId = "min";
}else{//없다면 로그인 페이지로 이동.
	response.sendRedirect("http://192.168.10.82/jsp_prj/day1120/loginFrm.jsp");
	return;
}//end else



%>