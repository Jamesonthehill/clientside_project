<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/build/ol.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/css/ol.css" type="text/css">
<title>오픈레이어스 예제</title>

  <style>
    .map {
      height: 960px;
      width: 100%;
    }
    
  </style>	
	
</head>

<body>
		<h1>❤안녕하세요. 행복한 서울시에 방문을 환영합니다😊</h1>


	<table class="table table-hover">
	<c:forEach items="${list}" var="item" varStatus="status">
		<tr>
			<td style="width: 50px;">번호</td>		
			<td style="width: 50px;">주소1</td>		
			<td style="width: 50px;">주소2</td>		
			<td style="width: 50px;">호수</td>		
			<td style="width: 50px;">평당가격</td>		
			<td style="width: 50px;">번지수</td>		
			<td>좌표</td>		
		</tr>
		<tr>
			<td><c:out value="${item.gid}" /></td>		
			<td><c:out value="${item.emd_cd}" /></td>		
			<td><c:out value="${item.emd_nm}" /></td>		
			<td><c:out value="${item.sgg_oid}" /></td>		
			<td><c:out value="${item.col_adm_se}" /></td>		
			<td><c:out value="${item.__gid}" /></td>		
			<td><c:out value="${item.geom}" /></td>		
		</tr>
	</c:forEach>
	</table>		
		
		
		
	<!-- html안에 Map이 보여질 div 요소를 생성해주고 id 설정 -->
<!-- 	<div id="map" class="map"></div>
 -->	
    <!-- 지도 위에 팝업이 나타날 부분 -->
<!-- 	<div id="popup">
		<div id="popup-content"></div>
	</div>
 -->		
		
<!-- 		<script>
		
		  let map = new ol.Map({
			    target: 'map',
			    layers: [
			      new ol.layer.Tile({
			        source: new ol.source.OSM({
			          url: 'https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png'
			        })
			      })
			    ],
			    view: new ol.View({
			      center: ol.proj.fromLonLat([128.4, 35.7]),
			      zoom: 7
			    })
			  });
			
		</script> -->
</body>
</html>