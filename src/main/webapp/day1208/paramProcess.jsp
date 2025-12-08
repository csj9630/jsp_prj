<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%
//post 방식으로 요청 받을 때는 한글 안 깨지게 첫 줄에 이거 추가할 것.
request.setCharacterEncoding("UTF-8");

//요청 받은 web parameter 데이터를 응답하여 출력하기
String name = request.getParameter("na");
String age = request.getParameter("age");
System.out.println(request.getMethod()+" / "+name+" / "+age);

//JSONObject을 응답하기. 나이로  태어난 해를 구해서 응답하기
int nowYear = LocalDate.now().getYear();

//1. JSONObject 생성 ( map 기반 )
JSONObject jsonObj = new JSONObject();
int intAge= 0;

//age 유효성 검사
if(age != null && !age.isEmpty()){
 	intAge = Integer.parseInt(age);
}//end if

//2. JSONObject에 응답할 값 설정
jsonObj.put("name", name+"님 안녕하세요?");
jsonObj.put("age", intAge);
jsonObj.put("birth", nowYear - intAge);

//JSONObject 출력
out.print(jsonObj.toJSONString());

%>