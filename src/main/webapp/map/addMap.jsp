<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/siteProperty.jsp"%>
<%@ include file="../fragments/loginChk3.jsp"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>식당등록</title>
<link rel="shortcut icon"
	href="http://192.168.10.82/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.82/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.82/jsp_prj/common/css/carousel.css"
	rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
#wrap {
	margin: 0px auto;
	width: 1200px;
	height: 1000px;
}

#header {
	height: 150px;
}

#container {
	height: 700px;
}

#footer {
	height: 150px;
}
</style>
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#btnAdd").click(function(){
			console.log("asdf");
			//유효성 검증
			var rest_name= $("#rest_name").val();
			var param={
					rest_name : rest_name,
					menu : $("#menu").val(),
					info : $("#info").val(),
					lat : $("#lat").val(),
					lng : $("#lng").val()
			};
			$.ajax({
				url:"addMapProcess.jsp",
				type:"get",
				data:param,
				dataType:"json",
				error: function(xhr, status, error) {
				    console.log("상태 코드: " + xhr.status);
				    console.log("에러 내용: " + error);
				    console.log("서버 응답 텍스트: " + xhr.responseText); // 서버에서 보낸 생얼 데이터를 확인하세요
				    alert("식당 등록 실패: " + error);
				},
				success:function(jsonObj){
					//alert(jsonObj)
					var msg = rest_name+"등록을 실패하였습니다.";
					if(jsonObj.resultFlag){
						msg = rest_name+"을 성공적으로 등록하였습니다.";
						//입력값 초기화
						$("#rest_name").val("");
						$("#menu").val("");
						$("#info").val("");
						$("#lat").val("");
						$("#lng").val("");
						
						$("vLat").text("");
						$("vLng").text("");
						
					}//end if
					
				}
				
			});	
		});//click
	});//ready
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a1ac775d203b783184fbffaf6d655b5"></script>
<script>
	window.onload = function() {

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.50416599371483, 127.05168765413), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);
			//console.log(latlng);
			$("#vLat").text(latlng.getLng());
			$("#vLng").text(latlng.getLng());
			$("#lat").val(latlng.getLng());
			$("#lng").val(latlng.getLng());
		});
	}//window.onload
</script>

</head>
<body>
	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp" />
	</header>
	<main>
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div>
					<h2>맛집 등록</h2>
					<div id="map" style="width: 100%; height: 350px;"></div>
					<table>
						<tr>
							<td>식당명</td>
							<td><input type="text" name="rest_name" id="rest_name"
								style="width: 350px;"></td>
						</tr>
						<tr>
							<td>대표메뉴</td>
							<td><input type="text" name="menu" id="menu"
								style="width: 350px;"></td>
						</tr>
						<tr>
							<td>상세평</td>
							<!-- textarea 쓸 때는 태그 사이에 공백을 절대 쓰지 않는다. 모든 글에 공백 들어간다고 함. -->
							<td><textarea name="info" id="info"
									style="width: 350px; height: 150px;"></textarea></td>
						</tr>
						<tr>
							<td>위도/경도</td>
							<td><span id="vLat"></span>/<span id="vLng"></span> 
							<input type="hidden" name="lat" id="lat" />
							<input type="hidden" name="lng" id="lng"/></td>

						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><input
								type="button" value="등록" id="btnAdd"
								class="btn btn-primary btn-sm"> <a href="mapList.jsp"
								class="btn btn-info btn-sm">리스트</a></td>
						</tr>

					</table>

				</div>

			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<jsp:include page="../fragments/footer.jsp" />
		</footer>
	</main>

</body>
</html>