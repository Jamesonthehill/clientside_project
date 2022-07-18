<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="EUC-KR">
<script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/build/ol.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/css/ol.css" type="text/css">
<title>오픈레이어스 예제</title>

  <style>
    
  </style>	
	
</head>

<body>
	 <div>
        <h1>Excel Download</h1>
        <form action="/excel/download" method="get">
            <button type="submit">Excel</button>
        </form>
    </div>


		
		
		
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