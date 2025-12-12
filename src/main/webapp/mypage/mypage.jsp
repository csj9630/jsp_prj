<%@page import="day1128.ParamDTO"%>
<%@page import="kr.co.sist.user.member.WebMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ include file="../fragments/siteProperty.jsp"%>
 <%@ include file="../fragments/loginChk3.jsp"%><!--로그인 여부 체크  --> 
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="http://192.168.10.82/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.82/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.82/jsp_prj/common/css/carousel.css" rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
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
	
	//***업로드 버튼에 대한 업무처리****
	//이 버튼이 클릭되면 저 버튼을 js가 클릭하게 하라
	$("#btnFile").click(function () {
		$("#upfile").click();//파일을 선택하면 파일이 변경 ( change event 발생)
	});//click
	
	//***파일선택 시 미리보기****
	$("#upfile").change(function(evt){
		
		
		//미리보기
		//1. HTML File Control 접근
		var file = evt.target.files[0]; //input type="file">
		
		//2. 파일을 읽기 위한 스트림 생성
		var reader = new FileReader();
		
		//3.File 객체의 onload 이벤트 핸들러를 설정하여 >img> 태크의 src속성에 파일명 설정
		reader.onload = function(evt){
			$("#preview").prop("src",evt.target.result);
		}//end if
		
		//4. 스트림을 사용하여 img 태그에 이미지 로딩
		reader.readAsDataURL(file);

	});//change
	
	$("#btn").click(function () {
		if(confirm("회원 정보를 수정하시겠습니까?")){
			$("#modifyFrm").submit();
		}//end if
	});//click
	
});//ready
</script>


</head>
<body>
	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp"/>
	</header>
	<main>
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
				<!-- 여기서부터 작성 시작-->
					<h1>마이페이지</h1>
					<%
					String id = (String)session.getAttribute("userId");
					//String id = "kim";//테스트용
					WebMemberService wms = WebMemberService.getInstance();
					ParamDTO pDTO = wms.searchMember(id);
					
					//이메일을 도메인과 아이디 부분을 나누기 위해 따로 저장.
					String selectMail = pDTO.getEmail();
					
					String email = selectMail.substring(0,selectMail.indexOf("@"));
					String domain = selectMail.substring(selectMail.indexOf("@")+1);
					
					pageContext.setAttribute("pDTO",pDTO);
					pageContext.setAttribute("email",email);
					pageContext.setAttribute("domain",domain);
					//out.print(pDTO);
					System.out.println("********마이페이지 시작 시점 이메일   : "+email+"/"+domain +"**********************");
					
					%>
					
					<h2>회원정보 수정</h2>
<!-- 					<form name="modifyFrm" method="post" id="modifyFrm"
						action="myPageProcess.jsp"> -->
						<!--파일을 보낼 수 있도록 enctype 변경, 이 경우 파라미터는 안 날라감. -->
					<form name="modifyFrm" method="post" id="modifyFrm"
						action="mypageProcess.jsp" enctype="multipart/form-data">
						<table id="joinFrm">
							<tr>
								<td class="title"><label><span class="star">*</span>아이디</label></td>
								<td class="input"> <c:out value="${sessionScope.userId }"></c:out> </td>
							</tr>
							<tr>
								<td class="input" colspan="2">
									<img alt="프로필이미지" src="${commonURL}/upload/${pDTO.profile}"
									id="preview"
									style="width:100px; height:100px; border-radius: 50px">
									<br>
									 <input type="button" value="파일선택" id="btnFile" class="btn btn-success"/>
	   				    			업로드는 이미지만 가능합니다.(jpg, gif, png, bmp)
									<input type="file" accept="image/*" name ="upfile" id="upfile" style="display: none"><br />
				   				   <!--  <input type="button" value="업로드" id="btnUpload" class="btn btn-success" /> -->
				   				    <input type="hidden" value="${pDTO.profile}" id="profile"  />
								</td>
							</tr>

							<tr>
								<td class="title"><label><span class="star">*</span>생일</label></td>
								<td class="input"><input type="date" name="birth"
									class="inputBox" value="2025-11-06" /></td>
							</tr>
							<tr>
								<td class="title"><label><span class="star">*</span>이름</label></td>
							<td class="input"><input type="text" name="name"
									class="inputBox" value="${pDTO.name }" /></td>
							</tr>
							<tr>
								<td class="title"><label><span class="star">*</span>이메일</label></td>
								<td class="input"><input type="text" name="email" class="inputBox" value="${email}"/>@
									<select name="domain">
										<option value="google.com">google.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="steam.com">steam.com</option>
										<option value="test.com">test.com</option>
									</select>	
									<script type="text/javascript">
									//여기서 하면 documment.ready로 안해도 된다.
									${"#domain"}.val("${domain}");//select칸을 EL 도메인 값으로 채워준다.
									
									</script>
									
								</td>
							</tr>

							<tr>
								<td class="title"><label><span class="star">*</span>소재지</label></td>
								<td class="input"><select name="loc" class="inputBox"
									style="width: 120px; height: 25px">
										<option value="N/A">선택해주세요</option>
										<option value="강원">강원</option>
										<option value="경기">경기</option>
										<option value="경남">경남</option>
										<option value="경북">경북</option>
										<option value="광주">광주</option>
										<option value="대구">대구</option>
										<option value="대전">대전</option>
										<option value="부산">부산</option>
										<option value="서울" >서울</option>
										<option value="울산">울산</option>
										<option value="인천">인천</option>
										<option value="전남">전남</option>
										<option value="전북">전북</option>
										<option value="제주">제주</option>
										<option value="충남">충남</option>
										<option value="충북">충북</option>
										<option value="제주">제주</option>
										<option value="해외">해외</option>
								</select>
								<script type="text/javascript">
									//여기서 하면 documment.ready로 안해도 된다.
									${"#loc"}.val("${pDTO.loc}");//select칸을 EL 도메인 값으로 채워준다.
									
								</script>
								</td>
							</tr>
							<tr>
								<td class="title">소개</td>
								<td><textarea name="intro"
										style="width: 400px; height: 100px"><c:out value="${pDTO.intro}"/>	</textarea>
							
								</td>
							</tr>
							
							<tr>
								<td colspan="2" style="text-align: center"><input
									type="hidden" name="code" value="U3881"> <input
									type="button" value="회원정보 변경" class="btn btn-success" id="btn" />
								</td>
							</tr>
						</table>
					</form>
				</div>
				
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<jsp:include page="../fragments/footer.jsp"/>
		</footer>
	</main>
	
</body>
</html>