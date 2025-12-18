<%@page import="day1127.DataDTO"%>
<%@page import="java.util.List"%>
<%@page import="day1201.CollectionService"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
	
});//ready
</script>


</head>
<body>
	<header data-bs-theme="dark">
				<jsp:include page="../fragments/header.jsp"/>
	</header>
	<main>
	<jsp:include page="../fragments/carousel.jsp"/>
		<div id="myCarousel" class="carousel slide mb-6"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
						<rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
					<div class="container">
						<div class="carousel-caption text-start">
							<h1>Example headline.</h1>
							<p class="opacity-75">Some representative placeholder content
								for the first slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
						<rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
					<div class="container">
						<div class="carousel-caption">
							<h1>Another example headline.</h1>
							<p>Some representative placeholder content for the second
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
						<rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
					<div class="container">
						<div class="carousel-caption text-end">
							<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					영화의 리스트가 보여진다고 가정.
					<c:forEach var="i" begin="1" end="10" step="1">
						<c:out value = "${i }"/>
					</c:forEach>
					<select>
						<c:forEach var="i" begin="10" end="100" step="2">
							<option value="${i}">
								<c:out value = "${i }"/>
							</option>
						</c:forEach>
					</select>					
				</div>
				<%
				//업무를 처리할 수 있는 클래스 생성
				CollectionService cs = new CollectionService();

				//1.값을 받아와서
				String[] arrData = cs.arr();
				List<String> listData = cs.list();
				
				//2.scope 객체에 할당하여 eL사용
				pageContext.setAttribute("arr", arrData );
				pageContext.setAttribute("list", listData );
				%>
				<div>
					<strong>배열</strong>
						<table class="table table-hover">
							<thead>
							<tr>
								<th>번호</th><th>이름</th>
							</tr>
							</thead>
							<tbody>
							
							
							
							</tbody>
						
						</table>
					
					<strong>list</strong>
					다음 중 고객정보가 가장많이 털린 사이트는 ?<br>
					<c:forEach var="site" items="${ list }" varStatus="i">
						<c:out value="${sit.count }"/>
						<input type="radio" name="site" value="${ site }"/>
						<c:out value="${site }"/>
					</c:forEach>
				</div>
			
				
				<%
				//1.데이터를 얻고
				List<DataDTO> dtoList= cs.searchMember();
				//2.scope 객체에 데이터 추가해서 el에서 사용
				pageContext.setAttribute("membersData", dtoList);
				pageContext.setAttribute("poll", cs.poll());//설문
				pageContext.setAttribute("notice", cs.notice()); //공지
				%>
				
				<div>
					<h3>DTO가 방값인 util.list</h3	>
					<!--3.jstl에서 el을 사용하여 반복하여 값 출력.-->
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th><th>이름</th><th>나이</th>
							</tr>
							<tr>
								<td colspan="3"><c:out value="${poll }"/></td>
							</tr>
							<tr>
								<td colspan="3"><c:out value="${notice }"/></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${membersData }" varStatus="i">
							<c:set var="totalAge" value="${ member.myAge+totalAge }"/>							<tr>
								<td><c:out value="${i.count}"/></td>
								<td><input type="text" name="name"  value="${member.name}"/></td>
								<td><input type="text" name="age"  value="${member.myAge}"/></td>
								<c:out value="${totalAge }"/>
							</tr>
							<c:if test="${i.last}">
								<tr>
									<td colspan="2">총 나이</td>
									<td><strong><c:out value="${totalAge}" /> </strong> </td>
								</tr>
							</c:if>
							
							</c:forEach>	
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
	
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end">
				<a href="#">위로</a>
			</p>
			<p>
				&copy; SIST class2. &middot; <a href="#">개인정보호정책</a>
				&middot; 개인정보관리 책임자 님이셈
			</p>
		</footer>
	</main>
	
</body>
</html>