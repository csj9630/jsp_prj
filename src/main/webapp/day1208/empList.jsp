<%@page import="kr.co.sist.emp.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$("#btn").click(function () {
		if($("#dept").val() != "N/A"){
			//셀렉트박스 선택 안됐으면 실행 안함.
			searchEmp();
		}
	});//click
});//ready

function searchEmp() {
	var param={deptno : $("#dept").val()};
	$.ajax({
		url:"${commonURL}/day1208/empData.jsp",
		type:"GET",
		data:param,
		dataType:"JSON",
		error:function(xhr){
			alert("죄송합니다 잠시 후 다시 시도하여주세요.")
			console.log(xhr.status);
		},
		success:function(jsonObj){
			//부가정보 꺼내기
			$("#pubDate").html(jsonObj.pubDate);
			$("#empCnt").html(jsonObj.dataLength);
			console.log(jsonObj);
			
			//jsonArr parsing
			var jsonArr = jsonObj.empData;
			
			var createTr="";
			
			$("#tab > tbody:last").empty();//tBody 내부의 모든 자식 태그(노드)를 한번 비운다.
			
			$.each(jsonArr, function (ind, jsonTemp) {
				createTr=
						"<tr><td>"+(ind+1)+"</td><td><a href='javascript:empDetal("+jsonTemp.empno+")'>"
						+jsonTemp.ename+"</a></td><td>"
						+"<td>"+jsonTemp.job+"</td>"
						+"<td>"+jsonTemp.sal+"</td>"
						+"<td>"+jsonTemp.hiredate+"</td>"
						+"<td>"+jsonTemp.hiredate_str+"</td></tr>";
						
				$("#tab > tbody:last").append(createTr);
			});
		}
	});//ajax
}//searchEmp

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
				<%
				//DB Service 객체 생성
				EmployeeService es = EmployeeService.getInstance();
				//System.out.println(es);
				//DB에서 조회한 내용을 scope객체에 저장
				pageContext.setAttribute("deptList", es.searchAllDept());
				
				
				%>
				<h1>AJAX와 DB를 연결하여 사원 정보 조회하기</h1>
					<div>
						<label>부서</label>					
						<select id="dept">
							<option value="N/A">-----부서선택-----</option>
							<c:forEach var="deptDTO" items="${deptList}" varStatus="i">
								<option value="${deptDTO.deptno}">
									<c:out value="${deptDTO.dname}"/>
								</option>
							</c:forEach>
						</select>
						<input type="button" value="사원검색" class="btn btn-info btn-sm" id="btn"/>
					
					</div>
				</div>
				<div id="output">
				<div>조회일자 : <span id="pubDate">0000-00-00</span> / 사원수 [<span id="empCnt">0</span>] </div>
					<table id="tab" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>사원명</th>
								<th>직무</th>
								<th>연봉</th>
								<th>입사일1</th>
								<th>입사일2</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
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