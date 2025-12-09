<%@page import="kr.co.sist.board.BoardDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.co.sist.board.BoardDAO"%>
<%@ page import="kr.co.sist.board.BoardDTO"%>
<%@ page import="kr.co.sist.board.RangeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>게시판 리스트</title>
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
	$(function () {
		$("#btnWrite").click(function () {
			checkLogin();
		});
	});
});//ready

function checkLogin() {
	if(${sessionScope.userId ==null}){
		alert("로그인을 한 사용자만 이용 가능한 기능입니다.");
		location.href="${commonURL}/login/loginFrm.jsp"; //로그인 폼 열기(무작정 가면 안된다이)
		return;
	}//end if
	<c:if test="${sessionScope.userId !=null}">
		location.href="boardWriteFrm.jsp>";
	</c:if>
}


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
				<div>
					<h3>아무말 대잔치 게시판</h3>	
					<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"/>
					<jsp:setProperty property="*" name="rDTO"/>
					<%
					BoardDAO bDAO = BoardDAO.getInstance();
					//System.out.println("bDAO"+bDAO);

					//******1. 총 게시물의 수
					int totalCount = bDAO.selectBoardTotalCnt();
					//System.out.println(totalCount);
					
					//******2. 한 화면에 보여줄 게시물의 수
					int pageScale = 10;
					
					//******3.총 페이지의 수
					/*
					int totalPage=totalCount%pageScale;
					if(totalCount%pageScale != 0 ){
					//딱 떨어지지 않으면 1장 더 필요함
						totalPage++;
					}//end if
					*/
					//실수가 발생 시 올림
					int totalPage = (int)Math.ceil((double) totalCount/pageScale);
					
					
					
					//******4. 시작번호
					
					String tempPage = request.getParameter("currentPage");
					
					int currentPage =1;
					
					if(tempPage != null){
						try{
						//사용자가 pagination을 클릭하여 정상적인 값이 립력됨
						currentPage = Integer.parseInt(tempPage);
						}catch(NumberFormatException nfe){
							
						}//end catch
					}//end if
					int startNum=1;
					
					//시작번호
					startNum = currentPage * pageScale-pageScale+1;
						//1페이지 클릭 : 1*10-10+1 =1 , 2페이지 클릭 : 2*10-10+1 = 11
					
					//******5. 끝 번호
					int endNum = startNum + pageScale -1;
					
					
					//******6. 시작 번호와 끝 번호 사이에 해당되는 게시글을 조회.
					//rDTO 는 시작번호와 끝 번호를 web parameter로 받지 않고
					//연산된 값(위 1항에서 5항까지 과정)으로 설정한다.
					rDTO.setStartNum(startNum);
					rDTO.setEndNum(endNum);

					List<BoardDTO> boardList = bDAO.selectRangeBoard(rDTO);
					
					//@@@@ 글 제목이 20글자를 초과하면 19자까지만 보여주고 나머진 ... 으로 처리.
					String title="";
					for (BoardDTO bDTO:boardList){
						title=bDTO.getTitle();			
						if(bDTO.getTitle().length()>19){
							bDTO.setTitle(title.substring(0, 20)+"...");
						}
					}//end for
					
					
					//7.pagination
					//StringBuilder pagination = new StringBuilder();
					
					pageContext.setAttribute("totalCount", totalCount);
					pageContext.setAttribute("pageScale", pageScale);
					pageContext.setAttribute("totalPage", totalPage);
					pageContext.setAttribute("currentPage", currentPage);
					pageContext.setAttribute("startNum", startNum);
					pageContext.setAttribute("endNum", endNum);
					
					pageContext.setAttribute("boardList", boardList);
					
					
					//int pn = totalCount - i +1 - 10*(totalPage-1);
					%>			
					<%-- 
					총 게시글 수 : <c:out value="${totalCount}"/> <br>
					한 화면에 보여줄 게시물 수  수 : <c:out value="${pageScale}"/> <br>
					총 페이지 수 : ${totalPage} <br>
					현재 페이지 수 : ${currentPage} <br>
					시작번호 : ${ startNum }<br>
					끝번호 : ${ endNum }<br>
				 --%>
					 <h5>
					 	<c:out value="${totalPage}"/> 중
					 	<c:out value="${currentPage}"/>페이지입니다.
					 </h5>
					<input type="button" value="글쓰기" class="btn btn-success" id="btnWrite"/>
				
					<div id="boardList">
						<table class="table table-hover">
						<thead>
							<tr>
								<th style="width:80px">번호</th>
								<th style="width:450px">제목</th>
								<th style="width:150px">작성자 id</th>
								<!-- <th style="width:150px">ip</th> -->
								<th style="width:80px">조회수</th>
								<th style="width:200px">작성일</th>
							</tr>
						</thead>
						<tbody>
							<!--검색한 boardList가 비어있다면? -->
							<c:if test="${empty boardList}">
								<td colspan="6" style="text-align: center">
									작성된 게시글이 없습니다.
								</td>
							</c:if>
							<!--검색한 boardList가 있다면? -->
							<c:forEach var="bDTO" items="${boardList}" varStatus="i">
				
							<tr><!--현재 페이지 번호를 보여주기  -->
								<td><c:out value="${totalCount-(currentPage-1)*pageScale-i.count }"></c:out> </td>
								<td><c:out value="${bDTO.title}"></c:out> </td>
								<td><c:out value="${bDTO.id}"></c:out> </td>
							<!-- 	<td><c:out value="${bDTO.ip}"></c:out> </td> -->
								<td><c:out value="${bDTO.cnt}"></c:out> </td>
								<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${bDTO.input_date}"/></td>
							</tr>
							</c:forEach>
						
						
						</tbody>
						
						</table>
					</div>
					<div id="pagination">
						<c:forEach var="tPage" begin="1" end="${totalPage }" step="1">
							<a href="boardList.jsp?currentPage=${tPage }">${tPage }</a>
						</c:forEach>
					
					</div>
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