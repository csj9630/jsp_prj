<%@page import="java.util.Random"%>
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
					<strong>EL에서 제공하는 연산자들</strong>
					<ul>
						<li> <strong> 산순연산자</strong> </li>
						<li>11+1961 = ${11+1961}</li>
						<li>10 나머지 3 = ${10 % 3} or ${10 mod 3 }</li>
						<li> <strong> 관계연산자</strong> </li>
						<li> 5 &gt; 4 => ${ 5 > 4} or ${5 gt 4}</li>
						<li> 5 &lt; 4 => ${ 5 < 4} or ${5 lt 4}</li>
						<li> 5 &gt;= 4 => ${ 5 >= 4} or ${5 ge 4}</li>
						<li> 5 &lt;= 4 => ${ 5 <= 4} or ${5 le 4}</li>
						<li> 5 == 4 => ${ 5 == 4} or ${5 eq 4}</li>
						<li> 5 != 4 => ${ 5 != 4} or ${5 != 4}</li><!--ne오류는 버그다-->				
						<li> <strong> 논리연산자</strong> </li>
						<li> 5 &gt; 4 &amp;&amp; 4< 5 => ${ 5 > 4 && 4<5} or ${5 gt 4 and 4 lt 5}</li>
						<li> 5 &gt; 4 || 4< 5 => ${ 5 > 4 || 4<5} or ${5 gt 4 or 4 lt 5}</li>
						<li> <strong> 단항연산자</strong> </li>
						<li>!( 5 &gt; 4 &amp;&amp; 4< 5) => ${!( 5 > 4 && 4<5)} or ${!(5 gt 4 and 4 lt 5)}</li>
						<li> <strong> 삼항연산자</strong> </li>
						<li>10은 =${10 %2 == 0 ? "짝수" : "홀수" }입니다 or (${10 mod 2 eq 0 ? '짝수' : '홀수' })</li>
					
					
					<%
					String temp = null; // null
					String temp2 = ""; // empty
					List<String> list = new ArrayList(); //blank
					//attribute에 넣어야 EL에서 사용 가능
					pageContext.setAttribute("temp", temp);
					pageContext.setAttribute("temp2", temp2);
					pageContext.setAttribute("list", list);
					if(new Random().nextBoolean()){
						list.add("안녕");
					}
					%>

						<li><strong>EL에서는 null을 출력하지 않는다.</strong></li>						
						<li>temp =${temp} <%=temp %></li>
						<li><strong>Empty 연산자</strong></li>						
						<li>temp가 null?인가 ${empty temp}</li>
						<li>temp가 ""인가 ${empty temp}</li>
						<li>LIST의 방의 갯수는 0인가? ${empty list}</li>
					
					
					
					
					</ul>
				</div>
				
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
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