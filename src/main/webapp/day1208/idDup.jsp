<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.user.member.WebMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%
String id = request.getParameter("id");

System.out.println(id);
WebMemberService wms = WebMemberService.getInstance();
boolean flag = wms.searchId(id);//사용 가능하면 true, 불가능 시 false;


//1. JSONObject 생성 ( map 기반 )
JSONObject jsonObj = new JSONObject();

jsonObj.put("idResult", flag);

//JSONObject 출력
out.print(jsonObj.toJSONString());

%>