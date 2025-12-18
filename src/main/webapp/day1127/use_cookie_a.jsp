<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="${commonURL}/common/images/favicon.ico">

<script src="${commonURL}/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="${commonURL}/common/css/carousel.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: #0000001a;
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em #0000001a, inset 0 .125em .5em #00000026
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh
}

.bi {
	vertical-align: -.125em;
	fill: currentColor
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8
}

.bd-mode-toggle {
	z-index: 1500
}

.bd-mode-toggle .bi {
	width: 1em;
	height: 1em
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important
}
</style>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		chkNull();
	});//click
	
	$("#name").keydown(function( evt ){
		//엔터가 눌려졌을 때 만 null 유효성 검증
		if( evt.which == 13){
			chkNull();
		}//end if
	});//keydown
	
});//ready

function chkNull(){
	var name=$("#name").val();
	if( name.replace(/ /g,"")==""){
		alert("이름은 필수 입력!!!");
		$("#name").focus();
		return;
	}//end if
	
	$("#frm").submit();
}//chkNull

</script>
</head>
<%
//1. 쿠키들 읽기 : jsessionID는 tomcat에서 생성하는 기본 쿠키.
Cookie[] cookies = request.getCookies();//요청의 쿠기 읽기
boolean flag=false;
List<String> cookieName = new ArrayList<String>();
List<String> cookieValue = new ArrayList<String>();

if(cookies != null){//읽어들인 쿠키가 존재할 경우
	//쿠키를 읽고 입력 폼을 보여주기.
	Cookie tempCookie = null;
	for(int i=0;  i<cookies.length; i++){
		tempCookie = cookies[i];
		if("JSESSIONID".equals(tempCookie.getName())){
			//JSESSIONID가 아닌 쿠키가 있음;
			flag=true;
			out.println(tempCookie.getValue());
			cookieName.add(tempCookie.getName());//쿠키 이름 저장
			cookieValue.add(tempCookie.getValue());//쿠키 값 저장
			
		}//end if
	}//end for
	
}//end if
%>

<%
 	if(flag){//쿠키가 없다면 
%>


<body>
<strong>쿠키 사용</strong>
		<!--use.cookieb로 값을 넘김  -->
		<form name="frm" id="frm" action="use_cookie_b.jsp">
			<table>
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" name="name" id="name" tabindex="1"/></td>
					<td rowspan="2">
						<input type="button" value="입력" id="btn" class="btn btn-info" tabindex="3" style="heigth:68px; width:80px"/>
					</td>
				</tr>
				<tr>
					<td><label for="age">나이</label></td>
					<td><input type="text" name="age" id="age" tabindex="2"/></td>
				</tr>
			</table>
		</form>

<%
}else{//쿠키가 있음
	%>
	<h3>쿠키 있는 영역</h3>
	<%
	for(int i=0; i<cookieName.size(); i++){
		%>
		쿠키명 : <%=cookieName.get(i) %><br>
		쿠키값 : <%=cookieValue.get(i) %><br>
		<a href="use_cookie_c.jsp">쿠키 삭제</a>
		<%
	}//end for
	
}//end else
%>	
	<!-- <div>
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.13430162563!2d127.05059697535567!3d37.50475047205465!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1c32408f9b7%3A0x4e3761a4f356d1eb!2z7IyN7Jqp6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1764141433219!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
	 -->
</body>
</html>