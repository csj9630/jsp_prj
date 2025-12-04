<%@page import="kr.co.sist.user.member.WebMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="http://192.168.10.82/jsp_prj/common/images/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 내가만든 CSS -->
<!-- <link rel="stylesheet" type="text/css" href="http://192.168.10.68/html_prj/common/css/main_v251031.css"/> -->

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->

<style type="text/css">
#wrap{  margin: 0px auto; width: 480px; height: 380px; }	
#container{ height: 380px; position:relative;	
	background: #FFFFFF url(images/id_background.png) no-repeat; }	
#searchFrm{ position: absolute; top: 180px; left: 100px; }	

#searchResult{ position: absolute; top: 230px; left: 100px  }

.fail{ color:#FF0000 }
.success{ color:#186292 }
</style>
<script type="text/javascript">
window.onload=function(){
	document.getElementById("btnSearch").addEventListener("click",findId);
	document.getElementById("id").addEventListener("keydown",chkEnter);
}//onload

function chkEnter(evt) {
	//엔터 키가 눌리면 findId 함수로 넘김.
	if(evt.which == 13){
		findId();
	}//end if
}//chkEnter

function findId(){
	var obj = document.popupFrm;
	
	var id = obj.id.value;
	
	//공백 검사
 	if(id.replace(/ /g,"") ==""){
		alert("중복검사할 id를 입력해주세요")
		return;
	}//end if 
	
	obj.submit(); // action=findId.jsp로 되어 있으므로 자신 페이지로 요청을 보낸다.
		
		
}//findId

function sendId( id ){
	//부모창(opener )으로 값 전달
	opener.window.document.joinFrm.id.value=id;
	//자식창 닫기
	self.close();
}

</script>
</head>
<body>
<div id="wrap">
	<div id="container">
	<img alt="아이디찾기 이미지" src="http://localhost/jsp_prj/day1202/images/findId.png"/>
	<div id="searchFrm">
	
		<form name="popupFrm" action="findId.jsp" method="get">
			<input type="text" name="id" id="id" value="${ param.id }" style="width:200px"/>
			<input type="button" value="중복확인" class="btn btn-success btn-sm" id="btnSearch"/>
		</form>
	</div>
	<c:if test="${not empty param.id }">
		<div id="searchResult">
		<%
			WebMemberService wmService = WebMemberService.getInstance();
			boolean flagId = wmService.searchId(request.getParameter("id"));
			pageContext.setAttribute("flagId", flagId);//EL로 쓰기 위해 scope객체에 넣기
		%>	
		<c:set var="resultCss" value="fail"/>
		<c:set var="resultMsg" value="사용 불가능"/>
		
		<c:if test="${flagId }">
			<c:set var="resultCss" value="success"/>
			<c:set var="resultMsg" value="사용 가능합니다!"/>
		
		</c:if>
			<div>	
				입력하신 <strong>${param.id }</strong>는 
				<span class="${resultCss}"><c:out value="${resultMsg }" /></span>
				
				<c:if test="${flagId }">
					<a href ="javascript:sendId('${param.id }')">사용 </a>
					<!--          ㄴ 여어어어기 띄어쓰기 들어가면 안된다이 -->
				</c:if>
			</div>
		</div>
	</c:if>
	</div>
</div>
</body>
</html>