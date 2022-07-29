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
<link href="http://localhost:8081/o2.platform/build/dist/o2sdk.css" rel="stylesheet">
<!-- bootstrap key  -->
<link rel="shortcut icon" href="https://ifh.cc/g/w26hDN.png">
<!-- CSS only -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"> -->
<!-- JavaScript Bundle with Popper -->
<!-- O2Platform SDK Example -->		      			
<title id="ctl00_headerTitle">GEO2, SEOUL!</title>

<!-- <style>
	li {
			list-style-image: url("images/dot.png");
			width: 2px;
			height: 2px;
		}
	</style> -->
						
</head>
<body>


  <!-- Navbar content -->
		<!-- kakao / vworld -->
	<div class="container-fluid">
	<!-- vworld 지도  -->	
	<div id="map-div" class="map">
		<button class="btn btn-primary move" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling" style="position: absolute;"><i class="fa-solid fa-angles-right"></i></button>
		<div class="toolbar-area">
			<div class="btn-group" role="group" style="background-color:white;width:250px;">
			  <button type="button" class="btn btn-light map-change-button" value="KAKAO">카카오</button>
			  <button type="button" class="btn btn-light map-change-button" value="VWORLD">브이월드</button>
			</div>
				<p>
				  <a class="btn" data-bs-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1" style="margin-top:5px;width:250px;background-color:white;">
				  <i class="fa-solid fa-gear" style="padding-right:35px;"></i><span style="padding-right:10px;">사용자 레이어</span><i class="fa-solid fa-caret-down" style="padding-right:50px;"></i></a>
				</p>
				<div class="row">
				  <div class="col">
				    <div class="collapse multi-collapse" id="multiCollapseExample1">
				      <div class="card card-body" style="width:200px;"> 
				      <table>	
				      		<c:forEach var="list" items="${list}" varStatus="status">
				      		<tr>
						      	<td>
								<input type="text" id="alpha" name="${list.ROLENAMENY }" class="form-check-input">
				      			</td>
				      		</tr>
				      		</c:forEach>
				      		<tr>
						      	<td><input type="checkbox" class="form-check-input" style="margin-top:10px;"></td>
						      	<td></td>
				      		</tr>
				      		<tr>
						      	<td><input type="checkbox" class="form-check-input" style="margin-top:10px;"></td>
						      	<td></td>
				      		</tr>
				      		<tr>
						      	<td><input type="checkbox" class="form-check-input" style="margin-top:10px;"></td>
						      	<td></td>
				      		</tr>
				      </table>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			<div class="toolbar">
				<button id="no1" type="button" class="" style="margin-top: 5px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrows-fullscreen" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344 0a.5.5 0 0 1 .707 0l4.096 4.096V11.5a.5.5 0 1 1 1 0v3.975a.5.5 0 0 1-.5.5H11.5a.5.5 0 0 1 0-1h2.768l-4.096-4.096a.5.5 0 0 1 0-.707zm0-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707zm-4.344 0a.5.5 0 0 1-.707 0L1.025 1.732V4.5a.5.5 0 0 1-1 0V.525a.5.5 0 0 1 .5-.5H4.5a.5.5 0 0 1 0 1H1.732l4.096 4.096a.5.5 0 0 1 0 .707z"/></svg></button>
				<button id="zoomIn" type="button" class=""><i class="fa-solid fa-plus"></i></button>
			  	<button id="zoomOut" type="button" class="" ><i class="fa-solid fa-minus"></i></button> 
			  	<button id="prev" type="button" class="" ><i class="fa-solid fa-angle-left" style="width:12px;height:6px;"></i></button>
			  	<button id="next" type="button" class="" ><i class="fa-solid fa-angle-right" style="width:12px;height:6px;"></i></button>
			  	<button id="clear" type="button" class="" style="margin-top: 10px;"><i class="fa-solid fa-arrow-rotate-right"></i></button> 
			  	<button id="distanceBtn" type="button" class=""><i class="fa-solid fa-ruler"></i></button>
			  	<button id="measurementBtn" type="button" class=""><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen" viewBox="0 0 16 16"><path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/></svg></button> 
			  	<button id="save" type="button" class="" style="margin-top: 5px;"><i class="fa-solid fa-download"></i></button>
			  	<button id="no2" type="button" class="" style="margin-top: 5px;"><i class="fa-solid fa-magnifying-glass"></i></button>
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
		<!-- Navbar 시작 -->
		<nav class="navbar" style="background-color:lightgrey;top:850px;width:100%;">
		  <div class="container-fluid">
		  	<div>
		    <a href="http://localhost:5050/index/" style="float:left;"><img src="images/geotwo.png" style="width:50px;height:50px;"></a>
		    </div>
		    
		    <div>
		      <form class="d-flex">
				<label for="alpha" style="margin-right:5px;vertical-align:middle;"><li><span>위치</span></li></label>
		        <select id="alpha" class="me-2">
		        	<option></option>
		        	<option></option>
		        	<option></option>
		        </select>
				<label for="scale"><li>축척</li></label>
		        <input id="scale" class="me-2" type="text" placeholder="축적" >
		    	<ul><li>좌표</li></ul>
		        <input id="" class="me-2" type="text" placeholder="위도">
		        <input class="me-2" type="text" placeholder="경도" >
		      	<button id="indexMap" type="button" class="btn btn-light"><i class="fa-solid fa-globe"></i></button>
		      </form>
		    </div>
		  </div>
		</nav>
		<!-- Navbar 끝 -->
	
	
	
	
	
	
	<!-- O2Platform SDK Example -->		      			
	<script src="https://kit.fontawesome.com/b322818db5.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://localhost:8081/o2.platform/build/dist/o2sdk.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/tools.js"></script>
	<script type="text/javascript" src="js/layers.js"></script>
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