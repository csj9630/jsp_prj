<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//post 방식일 때의 한글 처리



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><div>
<strong><%=request.getMethod() %>방식 요청</strong><br>
<% 
//web parameter의 이름이 같다면 배열로 처리된다.
String[] lang=request.getParameterValues("language");
//Form Control이 하나 일지라도 getParameterValues로 받을 수 있다.
String[] license=request.getParameterValues("license");
%>

<strong> 선택 언어</strong>
<%
	try{
	for(int i =0; i< lang.length; i++){
	%>	<%= lang[i] %> <%
	}//end for
	}catch(NullPointerException npe){
		%>관심 언어가 없습니다.<%
	}// end catch
%>

<br>
<strong>자격증</strong>
<%
//자격증이 없습니다.
if( license.length == 1 && license[0].trim().isEmpty() ){
%>자격증이 없습니다. <%
}else{
	

for(int i= 0 ; i < license.length ;i++){
%>
<%= license[i] %>
<%
}//end for
}//end else
%>

</div>
</body>
</html>