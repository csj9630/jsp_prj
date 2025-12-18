<%@page import="kr.co.sist.map.RestaurantService"%>
<%@page import="kr.co.sist.map.RestaurantDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/loginChk3.jsp"%>    

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rDTO" class="kr.co.sist.map.RestaurantDTO" scope="page"/>
<jsp:setProperty name="rDTO" property="*"/>

<%
String id = (String) session.getAttribute("userId");
rDTO.setId(id);

RestaurantService rs = RestaurantService.getInstance();

//System.out.println(rs.addRestaurant(rDTO));
out.print(rs.addRestaurant(rDTO));




%>