<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="css/buttonCss.css" rel="stylesheet">
<link rel="stylesheet" href="fontawesome/css/all.css">
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="stylesheet" href="fontawesome/css/solid.css">
<link rel="stylesheet" href="fontawesome/css/solid.min.css">
<link href="fontawesome/css/solid.min.css" rel="stylesheet">
<link href="bootStrap/bootstrap-5.2.0/dist/css/bootstrap.css" rel="stylesheet">
<!-- bootstrap key  -->
<link rel="shortcut icon" href="https://ifh.cc/g/w26hDN.png">
<!-- CSS only -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"> -->
<!-- JavaScript Bundle with Popper -->
<!-- O2Platform SDK Example -->		      			
<title id="ctl00_headerTitle">GEO2, SEOUL!</title>


						
</head>
<body>

<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
  <div class="container-fluid">
  	<div>
  	
    <a href="http://localhost:5050/index/" style="float:left;"><img src="images/geotwo.png" style="width:50px;height:50px;"></a>
    </div>
    <div>
      <form class="d-flex">
        <input class="form-control me-2" type="text"  index="getResolutionFromScale" placeholder="축적" >
        <input class="form-control me-2" type="text" placeholder="좌표" >
        <input class="form-control me-2" type="text" placeholder="위도" ><input class="form-control me-2" type="text" placeholder="경도" >
      </form>
    </div>
  </div>
</nav>

  <!-- Navbar content -->
		<!-- kakao / vworld -->
	<div class="container-fluid">
	<!-- vworld 지도  -->	
	<div id="map-div" class="map">
		<button class="btn btn-primary move" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling" style="position: absolute;"><i class="fa-solid fa-angles-right"></i></button>
		<div class="toolbar-area">
			<div class="btn-group" role="group" style="background-color:white;border:none;">
			  <button type="button" class="btn btn-outline-primary form-control map-change-button" value="KAKAO">Kakao</button>
			  <button type="button" class="btn btn-outline-primary form-control map-change-button" value="VWORLD">Vworld</button>
			</div>
			<div class="toolbar">
				<button id="zoomIn" type="button" class="btn btn-light"><i class="fa-solid fa-plus"></i></button>
			  	<button id="zoomOut" type="button" class="btn btn-light"><i class="fa-solid fa-minus"></i></button> 
			  	<button id="prev" type="button" class="btn btn-light"><i class="fa-solid fa-angle-left" style="width:12px;height:6px;"></i></button>
			  	<button id="next" type="button" class="btn btn-light"><i class="fa-solid fa-angle-right" style="width:12px;height:6px;"></i></button>
			  	<button id="clear" type="button" class="btn btn-light"><i class="fa-solid fa-arrow-rotate-right"></i></button> 
			  	<button id="distanceBtn" type="button" class="btn btn-light"><i class="fa-solid fa-ruler"></i></button>
			  	<button id="measurementBtn" type="button" class="btn btn-light" style=""><i class="fa-solid fa-pencil"></i></button> 
			  	<button id="save" type="button" class="btn btn-light" style=""><i class="fa-solid fa-download"></i></button>
			  	<button id="IndexMap" type="button" class="btn btn-light" style=""><i class="fa-solid fa-map"></i></button>
		  	</div>
	  	</div>
	</div>
		
	<!-- 지도 영역  -->
		
			<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  <div class="offcanvas-header">
			    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">검색어를 입력해주세요.</h5>
			    <button class="btn btn-outline-success" type="submit">검색</button>
			    <button type="button" class="btn" data-bs-dismiss="offcanvas" aria-label="Close"><i class="fa-solid fa-angles-left"></i></button>
			  </div>
			  <div class="offcanvas-body">
			    <p>DashBoard</p>
			  </div>
			</div>
			
		</div>
	
	
	
	
	
	
	
	<!-- O2Platform SDK Example -->		      			
	<script src="https://kit.fontawesome.com/b322818db5.js" crossorigin="anonymous"></script>
	<script src="http://localhost:8081/o2.platform/build/dist/o2sdk.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/tools.js"></script>
	<!-- proxy.jsp 연동  -->
	<script>
	//proxy.jsp를 통한 describeLayer API 호출
	var proxyHost = "common/proxy.jsp";
	var o2platformHost = "http://localhost:8081/o2.platform";
	var api = "/info/layerinfo/describeLayer";
	//파라미터 맨 앞에 url을 추가한다. 
	var param = "url=" + o2platformHost + api + "&" + "LAYER=DBMS:SOL_GWLEE:LSMD_CONT_LDREG";
	var url = proxyHost + "?" + param;

	//아래 형태로 url이 생성되어 동작하게 되며, 정상 호출 된다.
	//common/proxy.jsp?url=http://localhost:9090/o2.platform/info/layerinfo/describeLayer&LAYER=DBMS:TEST:LSMD_CONT_LDREG
	fetch(url).then(function(res){
	    return res.json();
	}).then(function(data){
	    console.log(data);
	})
	
	
	//--------------------
	// o2.common.Config 설정 클래스
	//--------------------
	
	//콘솔창에서 o2.common.Config를 통해 전체 설정항목을 확인할 수 있다.
	//어플리케이션이 초기화되는 시점에서 환경에 따른 HOST설정을 어플리케이션 단에서 설정하는 방법을 소개한다.
	
	//아래 방식으로 값을 설정한다.
	
	//어플리케이션 컨텍스트패스
	o2.common.Config.HOST.VALUES.APP_CONTEXT_PATH = "index";
	//어플리케이션 프록시
	o2.common.Config.HOST.VALUES.APP_PROXY = "common/proxy.jsp";
	//O2Platform 호스트
	o2.common.Config.HOST.VALUES.PLATFORM_HOST = "http://localhost:8081/o2.platform";
	//어플리케이션 프록시 사용 여부
	o2.common.Config.HOST.VALUES.USE_PROXY = true;

	</script>
	
	
</body>
</html>