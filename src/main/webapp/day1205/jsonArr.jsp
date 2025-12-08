<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%@ include file="../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
//**********JSONArray*******************
//1.JSONArray를 생성한다.(List 기반)
JSONArray jsonArr = new JSONArray();

//2.JSONArray 값 할당
//2-1.JSONObject 생성
JSONObject jsonObj = new JSONObject();
jsonObj.put( "name", "민병조" );
jsonObj.put( "age", 20 ); 

JSONObject jsonObj2 = new JSONObject();
jsonObj2.put( "name", "김진우" );
jsonObj2.put( "age", 28 ); 

JSONObject jsonObj3 = new JSONObject();
jsonObj3.put( "name", "김똘복" );
jsonObj3.put( "age", 31 ); 


//2-2.JSONObject을 JSONArray에 할당
jsonArr.add(jsonObj);
jsonArr.add(jsonObj2);
jsonArr.add(jsonObj3);

String jsonArrStr=jsonArr.toJSONString();
out.print(jsonArrStr);

%>