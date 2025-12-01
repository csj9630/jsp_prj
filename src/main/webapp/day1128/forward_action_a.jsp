<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//데이터 처리 페이지라서 디자인이 필요 없음
//한글을 parameter로 전달할 때는 인코딩을 해서 넘겨야함.
request.setCharacterEncoding("UTF-8");


//업무처리 결과 : List (Web Parameter는 string만 가능하여 전달 불가)
List<String> names= new ArrayList<String>();
names.add("나우유씨미3");
names.add("귀멸의칼날");
names.add("주토피아");
names.add("쿵푸팬더");

//scope 객체에 데이터를 할당 > scope 객체 사용하여 받기
request.setAttribute("names", names);

String name="민병조";//scope 객체에 바로 넘겨도 되지만 파라미터로 넘겨서 전송하는 방법 써보기
int age = 20;
%>    

<!-- parameter가 없는 경우 -->
<jsp:forward page="forward_action_b.jsp"></jsp:forward>
	
<!-- parameter가 있는 경우 : 안에 html 안 들어가게 주의-->
<jsp:forward page="forward_action_b.jsp" >
	<jsp:param value="<%=name%>" name="name"/>
	<jsp:param value="<%=age%>" name="age"/>
</jsp:forward>